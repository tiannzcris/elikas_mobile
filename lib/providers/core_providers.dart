import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/database.dart';
import '../services/api_service.dart';
import '../services/sync_service.dart';

/// Overridden in main() with the real instance once
/// SharedPreferences.getInstance() resolves -- never read before that
/// override is in place.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in main()');
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref.watch(apiServiceProvider), ref.watch(appDatabaseProvider));
});

/// True when the device has any network connection. Not a guarantee the
/// backend itself is reachable -- just the local online/offline signal the
/// UI needs to decide whether to show the offline banner and cached data.
final isOnlineProvider = StreamProvider<bool>((ref) {
  return Connectivity().onConnectivityChanged.map(
        (results) => !results.contains(ConnectivityResult.none),
      );
});

/// Live view of cached evacuation centers -- Drift's .watch() pushes a new
/// list the moment SyncService writes fresh rows, so the UI updates without
/// any manual refresh wiring.
final evacuationCentersProvider = StreamProvider<List<EvacuationCenter>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.evacuationCenters).watch();
});

/// Live view of cached alerts, newest first.
final alertsProvider = StreamProvider<List<Alert>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final query = db.select(db.alerts)
    ..orderBy([(a) => OrderingTerm(expression: a.createdAt, mode: OrderingMode.desc)]);
  return query.watch();
});

/// Live view of cached hazard areas (GeoJSON polygons), for the GIS map.
final hazardAreasProvider = StreamProvider<List<HazardArea>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.hazardAreas).watch();
});

enum SyncStatus { idle, syncing, success, failed }

class HomeSyncState {
  final SyncStatus status;
  final DateTime? lastSyncedAt;
  final String? errorMessage;

  const HomeSyncState({required this.status, this.lastSyncedAt, this.errorMessage});

  HomeSyncState copyWith({SyncStatus? status, DateTime? lastSyncedAt, String? errorMessage}) {
    return HomeSyncState(
      status: status ?? this.status,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      errorMessage: errorMessage,
    );
  }
}

/// Drives the manual/on-launch "sync now" action. Failure intentionally
/// leaves whatever is already cached in Drift untouched -- the UI keeps
/// showing last-known-good data, per the project's offline-first design.
/// The last-synced timestamp is persisted to SharedPreferences so it
/// survives app restarts instead of resetting to blank every launch.
class HomeSyncNotifier extends StateNotifier<HomeSyncState> {
  static const _lastSyncedKey = 'last_synced_at';

  final SyncService _sync;
  final SharedPreferences _prefs;

  HomeSyncNotifier(this._sync, this._prefs)
      : super(HomeSyncState(status: SyncStatus.idle, lastSyncedAt: _loadLastSynced(_prefs)));

  static DateTime? _loadLastSynced(SharedPreferences prefs) {
    final iso = prefs.getString(_lastSyncedKey);
    return iso == null ? null : DateTime.tryParse(iso);
  }

  Future<void> syncNow() async {
    state = state.copyWith(status: SyncStatus.syncing);
    try {
      await _sync.syncAll();
      final now = DateTime.now();
      await _prefs.setString(_lastSyncedKey, now.toIso8601String());
      state = state.copyWith(status: SyncStatus.success, lastSyncedAt: now);
    } catch (e) {
      state = state.copyWith(status: SyncStatus.failed, errorMessage: e.toString());
    }
  }

  /// Wipes the persisted last-synced marker -- used when the cache itself
  /// is cleared, so the UI doesn't claim data is "up to date" right after
  /// everything was just deleted.
  Future<void> clearSyncedMarker() async {
    await _prefs.remove(_lastSyncedKey);
    state = const HomeSyncState(status: SyncStatus.idle);
  }
}

final homeSyncProvider = StateNotifierProvider<HomeSyncNotifier, HomeSyncState>((ref) {
  return HomeSyncNotifier(ref.watch(syncServiceProvider), ref.watch(sharedPreferencesProvider));
});
