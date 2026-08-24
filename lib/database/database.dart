import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

/// Cached copy of GET /public/evacuation-centers. The id here is the
/// SAME id the central server uses -- unlike the desktop companion's local
/// SQLite (which had to distinguish locally-created records from synced
/// ones), everything in this app's cache is downloaded FROM the server,
/// nothing is created locally, so there's no local/remote id collision to
/// worry about.
class EvacuationCenters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get address => text()();
  TextColumn get barangay => text().nullable()();
  // Nullable -- the backend now allows evacuation centers to be created
  // without coordinates (map/photo location picker is optional there).
  // Any UI that plots centers on the map must skip null-coordinate rows.
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  IntColumn get capacityPersons => integer().nullable()();
  IntColumn get currentOccupancy => integer().nullable()();
  RealColumn get occupancyPercent => real().nullable()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached copy of GET /public/alerts. severity and alertType are two
/// separate fields on the server (see the Alert Severity module) -- kept
/// separate here too, not conflated into one field.
class Alerts extends Table {
  IntColumn get id => integer()();
  // The event's own id, not just its name -- captured so the family
  // registration form can offer a real, verified evacuation_event_id
  // instead of guessing one. Nullable since not every alert is tied to
  // an event.
  IntColumn get eventId => integer().nullable()();
  TextColumn get eventName => text().nullable()();
  TextColumn get senderName => text().nullable()();
  TextColumn get title => text()();
  TextColumn get message => text()();
  TextColumn get alertType => text()();
  TextColumn get severity => text()();
  DateTimeColumn get dateSent => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached copy of GET /barangays -- real backend data, unlike Hotlines
/// (which genuinely has no backing table). The registration form's
/// barangay dropdown needs to be correct, not a hand-maintained list that
/// could drift out of sync with the server's actual barangay records.
class Barangays extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached copy of GET /api/v1/evacuation-events -- staff data, needed
/// because RegisterFamilyRequest requires evacuation_event_id. Cached
/// (not just fetched live) so the registration form's event picker still
/// works offline, matching the form's core "must work fully offline"
/// requirement. The endpoint deliberately returns ALL events (active and
/// closed) since it feeds multiple consumers with opposite needs -- the
/// registration picker filters to status != 'closed' client-side, same
/// as the web dashboard's existing form does.
class EvacuationEvents extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Family registrations captured by staff while potentially offline.
/// payloadJson is the exact request body POST /api/v1/families expects,
/// built once at save time so the push-sync step just POSTs it verbatim
/// -- no serialization logic duplicated between the form and sync.
///
/// Unlike every other table in this file, this is NOT a re-downloadable
/// cache -- until a row is synced, it is the ONLY copy of that data.
/// Migrations must never drop this table.
class PendingRegistrations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get payloadJson => text()();
  // Denormalized purely for the "My Pending Registrations" list UI, so
  // it doesn't need to re-parse payloadJson just to show a summary row.
  TextColumn get headOfFamilyName => text()();
  TextColumn get barangayName => text()();
  IntColumn get memberCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  TextColumn get syncError => text().nullable()();
}

/// Cached copy of GET /api/v1/families -- one row per family, flattened
/// from FamilyResource's nested shape (barangay/evacuation_event/
/// evacuation_center/head_of_family are all nested objects there).
/// evacuationCenterName is NOT a strict source of truth -- the backend
/// derives it from the family's first member's most recent evacuation
/// record, purely a representative display value.
class CachedFamilies extends Table {
  IntColumn get id => integer()();
  IntColumn get barangayId => integer()();
  TextColumn get barangayName => text()();
  TextColumn get homeAddress => text().nullable()();
  IntColumn get evacuationEventId => integer().nullable()();
  TextColumn get evacuationEventName => text().nullable()();
  IntColumn get evacuationCenterId => integer().nullable()();
  TextColumn get evacuationCenterName => text().nullable()();
  BoolColumn get is4psBeneficiary => boolean()();
  BoolColumn get hasPwdMember => boolean()();
  BoolColumn get hasSeniorMember => boolean()();
  BoolColumn get hasLactatingMember => boolean()();
  IntColumn get memberCount => integer()();
  // Matched against each member's own id (from the "members" array) to
  // find the head -- the read shape has no direct
  // head_of_family_evacuee_id field, just a nested head_of_family object.
  IntColumn get headOfFamilyEvacueeId => integer().nullable()();
  TextColumn get headOfFamilyName => text().nullable()();
  DateTimeColumn get familyCreatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached copy of each family's "members" array (EvacueeResource). The
/// write side (POST /families/register) uses flat is_pwd/is_pregnant/etc
/// fields per member, but the READ side nests those same flags under a
/// "sectoral" object instead -- confirmed against the real controller,
/// not assumed. Flattened back out here since nothing about storing them
/// nested would help either the duplicate-detection search or display.
class CachedEvacuees extends Table {
  IntColumn get id => integer()();
  IntColumn get familyId => integer()();
  TextColumn get fullName => text()();
  TextColumn get firstName => text()();
  TextColumn get middleName => text().nullable()();
  TextColumn get lastName => text()();
  TextColumn get suffix => text().nullable()();
  TextColumn get sex => text()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get civilStatus => text().nullable()();
  TextColumn get contactNumber => text().nullable()();
  BoolColumn get isPwd => boolean()();
  TextColumn get pwdType => text().nullable()();
  BoolColumn get isPregnant => boolean()();
  BoolColumn get isLactating => boolean()();
  BoolColumn get isSoloParent => boolean()();
  BoolColumn get isIndigenousPerson => boolean()();
  BoolColumn get is4psBeneficiary => boolean()();
  // Denormalized so duplicate-detection/browsing queries don't need a
  // join back to CachedFamilies just to show/filter by barangay.
  TextColumn get barangayName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached copy of the hazard-area features from GET /public/gis/map-data.
/// Geometry is stored as raw GeoJSON text rather than modeled as typed
/// columns -- polygon coordinates don't map cleanly onto simple SQL
/// columns, and the map-rendering code just needs to parse this same
/// GeoJSON shape it would have gotten directly from the API anyway.
/// Columns here are verified directly against GisController's actual
/// properties output (id, area_name, hazard_type, description) -- no
/// barangay field exists on this endpoint's hazard features.
class HazardAreas extends Table {
  IntColumn get id => integer()();
  TextColumn get areaName => text()();
  TextColumn get hazardType => text()();
  TextColumn get description => text().nullable()();
  TextColumn get geoJsonGeometry => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    EvacuationCenters,
    Alerts,
    HazardAreas,
    Barangays,
    EvacuationEvents,
    PendingRegistrations,
    CachedFamilies,
    CachedEvacuees,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'elikas_cache'));

  /// For widget tests -- takes any executor directly (e.g. an in-memory
  /// one) instead of drift_flutter's isolate-backed file executor, which
  /// needs platform channels the test environment doesn't provide.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        // Versioned step-by-step, NOT a blanket "drop everything" --
        // PendingRegistrations must never be dropped by a future
        // migration, since (unlike every other table here) it can hold
        // real not-yet-synced data. Every other table is a
        // re-downloadable cache, safe to drop and recreate.
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.deleteTable(evacuationCenters.actualTableName);
            await m.createTable(evacuationCenters);
          }
          if (from < 3) {
            await m.deleteTable(alerts.actualTableName);
            await m.createTable(alerts);
            await m.createTable(barangays);
            await m.createTable(pendingRegistrations);
          }
          if (from < 4) {
            await m.createTable(evacuationEvents);
          }
          if (from < 5) {
            await m.createTable(cachedFamilies);
            await m.createTable(cachedEvacuees);
          }
        },
      );
}
