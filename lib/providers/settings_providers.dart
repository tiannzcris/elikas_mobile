import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core_providers.dart';

/// UI-only preference -- there is no push-notification infrastructure
/// (no Firebase Cloud Messaging, no device token storage) anywhere in the
/// backend yet, so this toggle is saved locally and does nothing beyond
/// that. The Settings screen must keep this labeled as not-yet-functional
/// rather than implying it actually enables notifications.
class NotificationsPrefNotifier extends StateNotifier<bool> {
  static const _key = 'notifications_enabled_pref';

  final SharedPreferences _prefs;

  NotificationsPrefNotifier(this._prefs) : super(_prefs.getBool(_key) ?? true);

  Future<void> set(bool value) async {
    state = value;
    await _prefs.setBool(_key, value);
  }
}

final notificationsPrefProvider = StateNotifierProvider<NotificationsPrefNotifier, bool>((ref) {
  return NotificationsPrefNotifier(ref.watch(sharedPreferencesProvider));
});

final packageInfoProvider = FutureProvider<PackageInfo>((ref) => PackageInfo.fromPlatform());
