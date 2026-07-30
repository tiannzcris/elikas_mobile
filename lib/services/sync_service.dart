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
            latitude: (c['latitude'] as num).toDouble(),
            longitude: (c['longitude'] as num).toDouble(),
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
}
