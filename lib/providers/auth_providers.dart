import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/api_service.dart';
import 'core_providers.dart';

const _tokenKey = 'staff_auth_token';
const _userIdKey = 'staff_auth_user_id';
const _nameKey = 'staff_auth_name';
const _roleKey = 'staff_auth_role';
const _barangayKey = 'staff_auth_barangay';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

class StaffSession {
  final String token;
  final int? userId;
  final String? name;
  final String? role;
  final String? barangay;

  const StaffSession({required this.token, this.userId, this.name, this.role, this.barangay});
}

class StaffAuthState {
  final bool isLoading;
  final bool checkingStoredSession;
  final StaffSession? session;
  final String? error;

  const StaffAuthState({
    this.isLoading = false,
    this.checkingStoredSession = true,
    this.session,
    this.error,
  });

  bool get isLoggedIn => session != null;

  StaffAuthState copyWith({
    bool? isLoading,
    bool? checkingStoredSession,
    StaffSession? session,
    bool clearSession = false,
    String? error,
  }) {
    return StaffAuthState(
      isLoading: isLoading ?? this.isLoading,
      checkingStoredSession: checkingStoredSession ?? this.checkingStoredSession,
      session: clearSession ? null : (session ?? this.session),
      error: error,
    );
  }
}

/// Holds the staff login session. The Sanctum token is kept in
/// flutter_secure_storage (Keystore/Keychain-backed), not SharedPreferences
/// -- this is a real credential, unlike the UI-only prefs elsewhere in the
/// app (last-synced timestamp, notification toggle).
class StaffAuthNotifier extends StateNotifier<StaffAuthState> {
  final ApiService _api;
  final FlutterSecureStorage _storage;

  StaffAuthNotifier(this._api, this._storage) : super(const StaffAuthState()) {
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    final token = await _storage.read(key: _tokenKey);
    if (token == null) {
      state = state.copyWith(checkingStoredSession: false);
      return;
    }
    final userIdStr = await _storage.read(key: _userIdKey);
    final name = await _storage.read(key: _nameKey);
    final role = await _storage.read(key: _roleKey);
    final barangay = await _storage.read(key: _barangayKey);
    state = state.copyWith(
      checkingStoredSession: false,
      session: StaffSession(
        token: token,
        userId: userIdStr != null ? int.tryParse(userIdStr) : null,
        name: name,
        role: role,
        barangay: barangay,
      ),
    );
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _api.login(email, password);
      final session = StaffSession(
        token: result['token'] as String,
        userId: result['userId'] as int?,
        name: result['name'] as String?,
        role: result['role'] as String?,
        barangay: result['barangay'] as String?,
      );
      await _storage.write(key: _tokenKey, value: session.token);
      if (session.userId != null) await _storage.write(key: _userIdKey, value: '${session.userId}');
      if (session.name != null) await _storage.write(key: _nameKey, value: session.name);
      if (session.role != null) await _storage.write(key: _roleKey, value: session.role);
      if (session.barangay != null) await _storage.write(key: _barangayKey, value: session.barangay);
      state = state.copyWith(isLoading: false, session: session);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _nameKey);
    await _storage.delete(key: _roleKey);
    await _storage.delete(key: _barangayKey);
    state = state.copyWith(clearSession: true);
  }
}

final staffAuthProvider = StateNotifierProvider<StaffAuthNotifier, StaffAuthState>((ref) {
  return StaffAuthNotifier(ref.watch(apiServiceProvider), ref.watch(secureStorageProvider));
});
