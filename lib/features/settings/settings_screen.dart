import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/date_format.dart';
import '../../providers/auth_providers.dart';
import '../../providers/core_providers.dart';
import '../../providers/registration_providers.dart';
import '../../providers/settings_providers.dart';
import '../staff/all_evacuees/all_evacuees_screen.dart';
import '../staff/evacuation_center_form/evacuation_center_form_screen.dart';
import '../staff/family_registration/family_registration_screen.dart';
import '../staff/my_evacuation_centers/my_evacuation_centers_screen.dart';
import '../staff/pending_registrations/pending_registrations_screen.dart';
import '../staff/staff_login_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(homeSyncProvider);
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;
    final centersCount = ref.watch(evacuationCentersProvider).asData?.value.length ?? 0;
    final alertsCount = ref.watch(alertsProvider).asData?.value.length ?? 0;
    final hazardsCount = ref.watch(hazardAreasProvider).asData?.value.length ?? 0;
    final totalRecords = centersCount + alertsCount + hazardsCount;
    final notificationsEnabled = ref.watch(notificationsPrefProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    final authState = ref.watch(staffAuthProvider);
    final pendingCount =
        ref.watch(pendingRegistrationsProvider).asData?.value.where((r) => !r.synced).length ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (!isOnline) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Icon(Icons.cloud_off, color: Colors.blue.shade700, size: 18),
                  const SizedBox(width: 8),
                  const Expanded(child: Text("You're offline. Some data may be out of date.", style: TextStyle(fontSize: 12))),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          _SectionLabel('OFFLINE & DATA'),
          _Card(
            child: Column(
              children: [
                _Row(
                  icon: Icons.storage_outlined,
                  title: '$totalRecords records cached',
                  subtitle: syncState.lastSyncedAt != null
                      ? 'Last synced ${formatFullDate(syncState.lastSyncedAt!)} · ${formatTime(context, syncState.lastSyncedAt!)}'
                      : 'Never synced yet',
                ),
                const Divider(height: 1),
                _Row(icon: Icons.notifications_outlined, title: 'Alerts & Notices', trailing: '$alertsCount'),
                const Divider(height: 1),
                _Row(icon: Icons.home_work_outlined, title: 'Evacuation Centers', trailing: '$centersCount'),
                const Divider(height: 1),
                _Row(icon: Icons.warning_amber_outlined, title: 'Hazard Areas', trailing: '$hazardsCount'),
                const Divider(height: 1),
                _Row(
                  icon: Icons.sync,
                  title: syncState.status == SyncStatus.syncing ? 'Syncing…' : 'Sync Now',
                  onTap: syncState.status == SyncStatus.syncing ? null : () => ref.read(homeSyncProvider.notifier).syncNow(),
                  trailingWidget: syncState.status == SyncStatus.syncing
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.chevron_right, size: 18),
                ),
                if (syncState.status == SyncStatus.failed)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text('Sync failed: ${syncState.errorMessage}', style: const TextStyle(color: Colors.red, fontSize: 11.5)),
                  ),
                const Divider(height: 1),
                _Row(
                  icon: Icons.delete_outline,
                  iconColor: Colors.red,
                  titleColor: Colors.red,
                  title: 'Clear Cached Data',
                  onTap: () => _confirmClear(context, ref),
                  trailingWidget: const Icon(Icons.chevron_right, size: 18, color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionLabel('NOTIFICATIONS'),
          _Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications_outlined),
              title: const Text('Push Notifications', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
              subtitle: const Text(
                'Not yet available — no notification service is set up on the backend. This only saves a local preference for now.',
                style: TextStyle(fontSize: 11),
              ),
              value: notificationsEnabled,
              onChanged: (v) => ref.read(notificationsPrefProvider.notifier).set(v),
            ),
          ),
          const SizedBox(height: 20),
          _SectionLabel('ABOUT'),
          _Card(
            child: packageInfo.when(
              loading: () => const _Row(icon: Icons.info_outline, title: 'E-LIKAS', subtitle: 'Loading version…'),
              error: (e, _) => const _Row(icon: Icons.info_outline, title: 'E-LIKAS', subtitle: 'Version unavailable'),
              data: (info) => _Row(
                icon: Icons.info_outline,
                title: 'E-LIKAS Mobile',
                subtitle: 'Version ${info.version} (Build ${info.buildNumber})',
              ),
            ),
          ),
          const SizedBox(height: 20),
          _SectionLabel('STAFF'),
          _Card(
            child: authState.checkingStoredSession
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                  )
                : authState.isLoggedIn
                    ? Column(
                        children: [
                          _Row(
                            icon: Icons.badge_outlined,
                            title: authState.session!.name ?? 'Logged in',
                            subtitle: [
                              if (authState.session!.role != null) authState.session!.role!,
                              if (authState.session!.barangay != null) 'Brgy. ${authState.session!.barangay}',
                            ].join(' · '),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.person_add_alt_outlined,
                            title: 'Register a Family',
                            subtitle: 'Works offline -- syncs when online',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const FamilyRegistrationScreen()),
                            ),
                            trailingWidget: const Icon(Icons.chevron_right, size: 18),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.pending_actions_outlined,
                            title: 'My Pending Registrations',
                            subtitle: pendingCount == 0
                                ? 'Nothing queued'
                                : '$pendingCount not yet synced',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const PendingRegistrationsScreen()),
                            ),
                            trailingWidget: const Icon(Icons.chevron_right, size: 18),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.groups_outlined,
                            title: 'All Evacuees',
                            subtitle: 'Browse registered families',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const AllEvacueesScreen()),
                            ),
                            trailingWidget: const Icon(Icons.chevron_right, size: 18),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.add_home_work_outlined,
                            title: 'Add Evacuation Center',
                            subtitle: 'Online only -- not queued offline',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const EvacuationCenterFormScreen()),
                            ),
                            trailingWidget: const Icon(Icons.chevron_right, size: 18),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.holiday_village_outlined,
                            title: 'My Evacuation Centers',
                            subtitle: 'View and edit centers you can manage',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const MyEvacuationCentersScreen()),
                            ),
                            trailingWidget: const Icon(Icons.chevron_right, size: 18),
                          ),
                          const Divider(height: 1),
                          _Row(
                            icon: Icons.logout,
                            iconColor: Colors.red,
                            titleColor: Colors.red,
                            title: 'Staff Logout',
                            onTap: () => ref.read(staffAuthProvider.notifier).logout(),
                          ),
                        ],
                      )
                    : _Row(
                        icon: Icons.badge_outlined,
                        title: 'Staff Login',
                        subtitle: 'For barangay officials and E-LIKAS staff',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const StaffLoginScreen()),
                        ),
                        trailingWidget: const Icon(Icons.chevron_right, size: 18),
                      ),
          ),
        ],
      ),
    );
  }

  void _confirmClear(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear cached data?'),
        content: const Text(
          'This removes every alert, evacuation center, and hazard area stored on this device. '
          'You\'ll need to sync again (while online) to get it back.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              final db = ref.read(appDatabaseProvider);
              await db.delete(db.evacuationCenters).go();
              await db.delete(db.alerts).go();
              await db.delete(db.hazardAreas).go();
              await ref.read(homeSyncProvider.notifier).clearSyncedMarker();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cached data cleared.')));
              }
            },
            child: const Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

/// Bordered card whose content sits on its own Material surface -- ListTile
/// and SwitchListTile paint splashes on the nearest Material ancestor, so
/// without this they'd render invisibly under the card's own background.
class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5, color: Colors.grey.shade600, letterSpacing: 0.5)),
    );
  }
}

class _Row extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? titleColor;
  final String title;
  final String? subtitle;
  final String? trailing;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const _Row({
    required this.icon,
    required this.title,
    this.iconColor,
    this.titleColor,
    this.subtitle,
    this.trailing,
    this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor ?? Colors.grey.shade700, size: 20),
      title: Text(title, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: titleColor)),
      subtitle: subtitle != null ? Text(subtitle!, style: const TextStyle(fontSize: 11.5)) : null,
      trailing: trailingWidget ?? (trailing != null ? Text(trailing!, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)) : null),
    );
  }
}
