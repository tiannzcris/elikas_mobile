import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/database.dart';
import '../services/sync_service.dart';
import 'core_providers.dart';

/// Live view of cached barangays (staff-only data, synced separately from
/// the public syncAll() flow since it needs an auth token).
final barangaysProvider = StreamProvider<List<Barangay>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final query = db.select(db.barangays)..orderBy([(b) => OrderingTerm(expression: b.name)]);
  return query.watch();
});

/// Live view of cached evacuation events, ALL statuses included --
/// filtering to non-closed ones for the registration picker is a UI
/// concern done where it's used, matching the confirmed backend/web
/// dashboard pattern (see EvacuationEvents' doc comment in database.dart).
final evacuationEventsProvider = StreamProvider<List<EvacuationEvent>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.evacuationEvents).watch();
});

/// Live view of the offline registration queue, newest first.
final pendingRegistrationsProvider = StreamProvider<List<PendingRegistration>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final query = db.select(db.pendingRegistrations)
    ..orderBy([(r) => OrderingTerm(expression: r.createdAt, mode: OrderingMode.desc)]);
  return query.watch();
});

enum PushSyncStatus { idle, syncing, done }

class PendingRegistrationsSyncState {
  final PushSyncStatus status;
  final PushSyncResult? lastResult;
  final String? error;

  const PendingRegistrationsSyncState({this.status = PushSyncStatus.idle, this.lastResult, this.error});
}

/// Drives pushing the offline registration queue to the server. A failure
/// here is reported but never clears the queue -- each row's own
/// synced/syncError state (written by SyncService) is the source of
/// truth, this just reports the outcome of one push attempt.
class PendingRegistrationsSyncNotifier extends StateNotifier<PendingRegistrationsSyncState> {
  final SyncService _sync;

  PendingRegistrationsSyncNotifier(this._sync) : super(const PendingRegistrationsSyncState());

  Future<void> pushNow(String token) async {
    state = const PendingRegistrationsSyncState(status: PushSyncStatus.syncing);
    try {
      final result = await _sync.pushPendingRegistrations(token);
      state = PendingRegistrationsSyncState(status: PushSyncStatus.done, lastResult: result);
    } catch (e) {
      state = PendingRegistrationsSyncState(status: PushSyncStatus.done, error: e.toString());
    }
  }
}

final pendingRegistrationsSyncProvider =
    StateNotifierProvider<PendingRegistrationsSyncNotifier, PendingRegistrationsSyncState>((ref) {
  return PendingRegistrationsSyncNotifier(ref.watch(syncServiceProvider));
});

/// Live view of cached families, newest first within each barangay group
/// (grouping/sorting itself is done in the "All Evacuees" screen).
final cachedFamiliesProvider = StreamProvider<List<CachedFamily>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.cachedFamilies).watch();
});

/// Live view of cached individual evacuees -- the source of truth for
/// offline duplicate-detection while registering a new family.
final cachedEvacueesProvider = StreamProvider<List<CachedEvacuee>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.cachedEvacuees).watch();
});

class EvacueesSyncState {
  final bool syncing;
  final DateTime? lastSyncedAt;
  final String? error;

  const EvacueesSyncState({this.syncing = false, this.lastSyncedAt, this.error});
}

/// Drives pulling the All Evacuees cache. Unlike pending-registration
/// push-sync, auto-syncing here on screen-open is fine -- this is a pure
/// read cache, nothing gets sent prematurely by refreshing it.
class EvacueesSyncNotifier extends StateNotifier<EvacueesSyncState> {
  static const _key = 'evacuees_last_synced_at';

  final SyncService _sync;
  final SharedPreferences _prefs;

  EvacueesSyncNotifier(this._sync, this._prefs) : super(EvacueesSyncState(lastSyncedAt: _load(_prefs)));

  static DateTime? _load(SharedPreferences prefs) {
    final iso = prefs.getString(_key);
    return iso == null ? null : DateTime.tryParse(iso);
  }

  Future<void> syncNow(String token) async {
    state = EvacueesSyncState(syncing: true, lastSyncedAt: state.lastSyncedAt);
    try {
      await _sync.syncEvacuees(token);
      final now = DateTime.now();
      await _prefs.setString(_key, now.toIso8601String());
      state = EvacueesSyncState(lastSyncedAt: now);
    } catch (e) {
      state = EvacueesSyncState(lastSyncedAt: state.lastSyncedAt, error: e.toString());
    }
  }
}

final evacueesSyncProvider = StateNotifierProvider<EvacueesSyncNotifier, EvacueesSyncState>((ref) {
  return EvacueesSyncNotifier(ref.watch(syncServiceProvider), ref.watch(sharedPreferencesProvider));
});
