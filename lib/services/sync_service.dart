import 'dart:convert';
import 'package:drift/drift.dart';
import '../database/database.dart';
import 'api_service.dart';

/// Pulls fresh data from elikas-backend's public API and upserts it into
/// the local Drift cache. "Upsert" (insertOnConflictUpdate) rather than
/// insert -- since every table's primary key is the server's own id, this
/// naturally refreshes existing rows in place instead of duplicating them
/// every time sync runs.
class SyncService {
  final ApiService _api;
  final AppDatabase _db;

  SyncService(this._api, this._db);

  Future<int> syncEvacuationCenters() async {
    final centers = await _api.getEvacuationCenters();

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.evacuationCenters,
        centers.map((raw) {
          final c = raw as Map<String, dynamic>;
          return EvacuationCentersCompanion.insert(
            id: Value(c['id'] as int),
            name: c['name'] as String,
            type: c['type'] as String,
            address: c['address'] as String,
            barangay: Value(c['barangay'] as String?),
            // Nullable: the backend now allows centers to be created
            // without a map location (see database.dart's schema note).
            latitude: Value((c['latitude'] as num?)?.toDouble()),
            longitude: Value((c['longitude'] as num?)?.toDouble()),
            capacityPersons: Value(c['capacity_persons'] as int?),
            currentOccupancy: Value(c['current_occupancy'] as int?),
            occupancyPercent: Value((c['occupancy_percent'] as num?)?.toDouble()),
            status: c['status'] as String,
          );
        }).toList(),
      );
    });

    return centers.length;
  }

  Future<int> syncAlerts() async {
    final alerts = await _api.getAlerts();

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.alerts,
        alerts.map((raw) {
          final a = raw as Map<String, dynamic>;
          final event = a['evacuation_event'] as Map<String, dynamic>?;
          final sender = a['sender'] as Map<String, dynamic>?;
          return AlertsCompanion.insert(
            id: Value(a['id'] as int),
            eventId: Value(event?['id'] as int?),
            eventName: Value(event?['name'] as String?),
            senderName: Value(sender?['name'] as String?),
            title: a['title'] as String,
            message: a['message'] as String,
            alertType: a['alert_type'] as String,
            severity: a['severity'] as String,
            dateSent: Value(a['date_sent'] != null ? DateTime.parse(a['date_sent'] as String) : null),
            createdAt: DateTime.parse(a['created_at'] as String),
          );
        }).toList(),
      );
    });

    return alerts.length;
  }

  Future<int> syncHazardAreas() async {
    final mapData = await _api.getMapData();
    final features = (mapData['hazard_areas']['features'] as List<dynamic>);

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.hazardAreas,
        features.map((raw) {
          final feature = raw as Map<String, dynamic>;
          final props = feature['properties'] as Map<String, dynamic>;
          return HazardAreasCompanion.insert(
            id: Value(props['id'] as int),
            areaName: props['area_name'] as String,
            hazardType: props['hazard_type'] as String,
            description: Value(props['description'] as String?),
            // The geometry itself is re-encoded to a JSON string for
            // storage -- Drift has no native GeoJSON column type, and the
            // map-rendering code will decode this the same way it would
            // have decoded the API response directly.
            geoJsonGeometry: jsonEncode(feature['geometry']),
          );
        }).toList(),
      );
    });

    return features.length;
  }

  Future<void> syncAll() async {
    await syncEvacuationCenters();
    await syncAlerts();
    await syncHazardAreas();
  }

  /// Staff-only, not part of syncAll() -- GET /barangays needs a staff
  /// auth token, unlike every other sync method here which hits public
  /// resident-facing endpoints on app launch regardless of login state.
  Future<int> syncBarangays(String token) async {
    final barangays = await _api.getBarangays(token);

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.barangays,
        barangays.map((raw) {
          final b = raw as Map<String, dynamic>;
          return BarangaysCompanion.insert(
            id: Value(b['id'] as int),
            name: b['name'] as String,
          );
        }).toList(),
      );
    });

    return barangays.length;
  }

  /// Staff-only, same reasoning as syncBarangays -- cached so the
  /// registration form's (now-required) event picker still works offline.
  Future<int> syncEvacuationEvents(String token) async {
    final events = await _api.getEvacuationEvents(token);

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.evacuationEvents,
        events.map((raw) {
          final e = raw as Map<String, dynamic>;
          return EvacuationEventsCompanion.insert(
            id: Value(e['id'] as int),
            name: e['name'] as String,
            status: e['status'] as String,
          );
        }).toList(),
      );
    });

    return events.length;
  }

  /// Pages through GET /api/v1/families (per_page=100) until an empty or
  /// short page is returned -- doesn't rely on knowing the exact
  /// pagination meta field names, just keeps asking for the next page
  /// while there's evidently more.
  ///
  /// Flattens each family's nested "members" (EvacueeResource) into
  /// CachedEvacuees, pulling sectoral flags back out of the "sectoral"
  /// sub-object the read side nests them under (unlike the flat shape
  /// POST /families/register expects) -- confirmed against the real
  /// resource, not assumed.
  Future<int> syncEvacuees(String token) async {
    final allFamilies = <Map<String, dynamic>>[];
    var page = 1;
    while (true) {
      final batch = await _api.getFamilies(token, page: page);
      if (batch.isEmpty) break;
      allFamilies.addAll(batch.cast<Map<String, dynamic>>());
      if (batch.length < 100) break;
      page++;
    }

    final familyRows = <CachedFamiliesCompanion>[];
    final evacueeRows = <CachedEvacueesCompanion>[];

    for (final f in allFamilies) {
      final barangay = f['barangay'] as Map<String, dynamic>?;
      final event = f['evacuation_event'] as Map<String, dynamic>?;
      final center = f['evacuation_center'] as Map<String, dynamic>?;
      final head = f['head_of_family'] as Map<String, dynamic>?;
      final barangayName = barangay?['name'] as String? ?? '';
      final familyId = f['id'] as int;

      familyRows.add(CachedFamiliesCompanion.insert(
        id: Value(familyId),
        barangayId: (barangay?['id'] as int?) ?? 0,
        barangayName: barangayName,
        homeAddress: Value(f['home_address'] as String?),
        evacuationEventId: Value(event?['id'] as int?),
        evacuationEventName: Value(event?['name'] as String?),
        evacuationCenterId: Value(center?['id'] as int?),
        evacuationCenterName: Value(center?['name'] as String?),
        is4psBeneficiary: f['is_4ps_beneficiary'] as bool? ?? false,
        hasPwdMember: f['has_pwd_member'] as bool? ?? false,
        hasSeniorMember: f['has_senior_member'] as bool? ?? false,
        hasLactatingMember: f['has_lactating_member'] as bool? ?? false,
        memberCount: f['member_count'] as int? ?? 0,
        headOfFamilyEvacueeId: Value(head?['id'] as int?),
        headOfFamilyName: Value(head?['full_name'] as String?),
        familyCreatedAt: Value(f['created_at'] != null ? DateTime.tryParse(f['created_at'] as String) : null),
      ));

      final members = f['members'] as List<dynamic>? ?? const [];
      for (final raw in members) {
        final m = raw as Map<String, dynamic>;
        final sectoral = m['sectoral'] as Map<String, dynamic>? ?? const {};
        evacueeRows.add(CachedEvacueesCompanion.insert(
          id: Value(m['id'] as int),
          familyId: familyId,
          fullName: m['full_name'] as String? ?? '',
          firstName: m['first_name'] as String? ?? '',
          middleName: Value(m['middle_name'] as String?),
          lastName: m['last_name'] as String? ?? '',
          suffix: Value(m['suffix'] as String?),
          sex: m['sex'] as String? ?? '',
          dateOfBirth: Value(m['date_of_birth'] != null ? DateTime.tryParse(m['date_of_birth'] as String) : null),
          civilStatus: Value(m['civil_status'] as String?),
          contactNumber: Value(m['contact_number'] as String?),
          isPwd: sectoral['is_pwd'] as bool? ?? false,
          pwdType: Value(sectoral['pwd_type'] as String?),
          isPregnant: sectoral['is_pregnant'] as bool? ?? false,
          isLactating: sectoral['is_lactating'] as bool? ?? false,
          isSoloParent: sectoral['is_solo_parent'] as bool? ?? false,
          isIndigenousPerson: sectoral['is_indigenous_person'] as bool? ?? false,
          is4psBeneficiary: sectoral['is_4ps_beneficiary'] as bool? ?? false,
          barangayName: barangayName,
        ));
      }
    }

    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.cachedFamilies, familyRows);
      batch.insertAllOnConflictUpdate(_db.cachedEvacuees, evacueeRows);
    });

    return allFamilies.length;
  }

  /// Pushes every not-yet-synced family registration to the server, one
  /// at a time. A failure on one record is recorded on that row (visible
  /// in the "My Pending Registrations" list) and does NOT stop the rest
  /// -- one bad record shouldn't block every other queued registration.
  Future<PushSyncResult> pushPendingRegistrations(String token) async {
    final unsynced = await (_db.select(_db.pendingRegistrations)..where((r) => r.synced.equals(false))).get();

    var succeeded = 0;
    var failed = 0;
    for (final row in unsynced) {
      try {
        final payload = jsonDecode(row.payloadJson) as Map<String, dynamic>;
        await _api.createFamily(token, payload);
        await (_db.update(_db.pendingRegistrations)..where((r) => r.id.equals(row.id))).write(
              const PendingRegistrationsCompanion(synced: Value(true), syncError: Value(null)),
            );
        succeeded++;
      } catch (e) {
        await (_db.update(_db.pendingRegistrations)..where((r) => r.id.equals(row.id))).write(
              PendingRegistrationsCompanion(syncError: Value(e.toString())),
            );
        failed++;
      }
    }
    return PushSyncResult(succeeded: succeeded, failed: failed);
  }
}

class PushSyncResult {
  final int succeeded;
  final int failed;

  const PushSyncResult({required this.succeeded, required this.failed});
}
