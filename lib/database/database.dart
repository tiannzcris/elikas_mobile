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
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
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

@DriftDatabase(tables: [EvacuationCenters, Alerts, HazardAreas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'elikas_cache'));

  @override
  int get schemaVersion => 1;
}
