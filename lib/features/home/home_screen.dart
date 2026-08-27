import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/database.dart';
import '../../providers/core_providers.dart';
import '../alerts/alert_details_screen.dart';

/// Resident-facing Home tab. Every number on this screen is derived from
/// the real cached /public/evacuation-centers and /public/alerts data --
/// nothing here is hardcoded, matching the project's own rule against
/// fabricating figures the backend doesn't actually produce (see the
/// implementation plan's gap #2 and #1).
class HomeScreen extends ConsumerWidget {
  final VoidCallback onViewAllAlerts;

  const HomeScreen({super.key, required this.onViewAllAlerts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnlineAsync = ref.watch(isOnlineProvider);
    final isOnline = isOnlineAsync.asData?.value ?? true;
    final syncState = ref.watch(homeSyncProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(homeSyncProvider.notifier).syncNow(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _Header(alertsAsync: ref.watch(alertsProvider)),
              const SizedBox(height: 16),
              if (!isOnline) _OfflineBanner(syncState: syncState),
              if (!isOnline) const SizedBox(height: 12),
              _StatusBanner(alertsAsync: ref.watch(alertsProvider), onTap: onViewAllAlerts),
              const SizedBox(height: 12),
              const _WeatherPlaceholderCard(),
              const SizedBox(height: 16),
              _SituationOverview(
                centersAsync: ref.watch(evacuationCentersProvider),
                alertsAsync: ref.watch(alertsProvider),
              ),
              const SizedBox(height: 16),
              _RecentAlertsSection(
                alertsAsync: ref.watch(alertsProvider),
                onViewAll: onViewAllAlerts,
              ),
              const SizedBox(height: 16),
              _SyncCard(syncState: syncState, isOnline: isOnline),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final AsyncValue<List<Alert>> alertsAsync;

  const _Header({required this.alertsAsync});

  @override
  Widget build(BuildContext context) {
    final alertCount = alertsAsync.asData?.value.length ?? 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D2A5C), Color(0xFF13407A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Image.asset('assets/images/logo_badge_transparent.png', fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('E-LIKAS',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Electronic Ligao Kaligtasan Sistema',
                    style: TextStyle(color: Colors.white70, fontSize: 11)),
                SizedBox(height: 2),
                Text('Ligao City, Albay', style: TextStyle(color: Colors.white70, fontSize: 11)),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.notifications_outlined, color: Color(0xFF0D2A5C), size: 20),
              ),
              if (alertCount > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '$alertCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OfflineBanner extends StatelessWidget {
  final HomeSyncState syncState;

  const _OfflineBanner({required this.syncState});

  @override
  Widget build(BuildContext context) {
    final lastSynced = syncState.lastSyncedAt;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_off, color: Colors.blue.shade700, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              lastSynced == null
                  ? "You're offline — showing whatever was previously cached."
                  : "You're offline — showing data cached at "
                      "${TimeOfDay.fromDateTime(lastSynced).format(context)}.",
              style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  final AsyncValue<List<Alert>> alertsAsync;
  final VoidCallback onTap;

  const _StatusBanner({required this.alertsAsync, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return alertsAsync.when(
      loading: () => const _BannerShell(
        color: Colors.grey,
        icon: Icons.hourglass_empty,
        title: 'Loading status…',
        subtitle: '',
      ),
      error: (e, _) => _BannerShell(
        color: Colors.grey,
        icon: Icons.error_outline,
        title: 'Unable to load status',
        subtitle: 'Showing cached data if available',
        onTap: onTap,
      ),
      data: (alerts) {
        final hasMandatory = alerts.any((a) => a.severity == 'mandatory');
        final hasAdvisory = alerts.any((a) => a.severity == 'advisory');

        if (hasMandatory) {
          return _BannerShell(
            color: Colors.red,
            icon: Icons.warning_amber_rounded,
            title: 'Mandatory alert in effect',
            subtitle: 'Tap to view active alerts',
            onTap: onTap,
          );
        }
        if (hasAdvisory) {
          return _BannerShell(
            color: Colors.orange,
            icon: Icons.info_outline,
            title: 'Advisory in effect',
            subtitle: 'Tap to view active alerts',
            onTap: onTap,
          );
        }
        return _BannerShell(
          color: Colors.green,
          icon: Icons.verified_user_outlined,
          title: 'No urgent alerts at this time',
          subtitle: 'Ligao City is currently monitoring',
          onTap: onTap,
        );
      },
    );
  }
}

class _BannerShell extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _BannerShell({
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, color: color.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: color.shade900, fontWeight: FontWeight.w600, fontSize: 14)),
                  if (subtitle.isNotEmpty)
                    Text(subtitle, style: TextStyle(color: color.shade800, fontSize: 12)),
                ],
              ),
            ),
            if (onTap != null) Icon(Icons.chevron_right, color: color.shade700),
          ],
        ),
      ),
    );
  }
}

/// Honest placeholder per the implementation plan's gap #1: no live
/// weather API is wired up yet, so this deliberately doesn't show fake
/// temperature/humidity numbers.
class _WeatherPlaceholderCard extends StatelessWidget {
  const _WeatherPlaceholderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_outlined, color: Colors.grey.shade600, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Weather updates from PAGASA are not yet available in this app.',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _SituationOverview extends StatelessWidget {
  final AsyncValue<List<EvacuationCenter>> centersAsync;
  final AsyncValue<List<Alert>> alertsAsync;

  const _SituationOverview({required this.centersAsync, required this.alertsAsync});

  @override
  Widget build(BuildContext context) {
    final centers = centersAsync.asData?.value ?? const <EvacuationCenter>[];
    final alerts = alertsAsync.asData?.value ?? const <Alert>[];

    final activeCenters = centers.where((c) => c.status == 'active').length;
    final activeAlerts = alerts.length;
    int availableSlots = 0;
    for (final c in centers) {
      final cap = c.capacityPersons;
      final occ = c.currentOccupancy;
      if (cap != null) {
        availableSlots += (cap - (occ ?? 0)).clamp(0, cap);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Situation Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                value: '$activeCenters',
                label: 'Active Centers',
                icon: Icons.home_work_outlined,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatTile(
                value: '$activeAlerts',
                label: 'Active Alerts',
                icon: Icons.notifications_active_outlined,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                value: '${centers.length}',
                label: 'Centers Tracked',
                icon: Icons.map_outlined,
                color: Colors.teal,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatTile(
                value: '$availableSlots',
                label: 'Available Slots',
                icon: Icons.groups_outlined,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final MaterialColor color;

  const _StatTile({required this.value, required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.shade700, size: 20),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color.shade900)),
          Text(label, style: TextStyle(fontSize: 11, color: color.shade800)),
        ],
      ),
    );
  }
}

class _RecentAlertsSection extends StatelessWidget {
  final AsyncValue<List<Alert>> alertsAsync;
  final VoidCallback onViewAll;

  const _RecentAlertsSection({required this.alertsAsync, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Alerts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            TextButton(onPressed: onViewAll, child: const Text('View All')),
          ],
        ),
        alertsAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text('Could not load alerts: $e', style: const TextStyle(color: Colors.red, fontSize: 12)),
          ),
          data: (alerts) {
            if (alerts.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('No alerts yet. Pull down to sync.', style: TextStyle(color: Colors.grey)),
              );
            }
            final recent = alerts.take(3).toList();
            return Column(
              children: recent.map((a) => _AlertTile(alert: a)).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _AlertTile extends StatelessWidget {
  final Alert alert;

  const _AlertTile({required this.alert});

  @override
  Widget build(BuildContext context) {
    final color = switch (alert.severity) {
      'mandatory' => Colors.red,
      'advisory' => Colors.orange,
      'all_clear' => Colors.green,
      _ => Colors.blue,
    };

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => AlertDetailsScreen(alert: alert)),
      ),
      child: Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(Icons.campaign_outlined, color: color, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(alert.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text(
                  alert.message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(alert.severity, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
      ),
    );
  }
}

class _SyncCard extends StatelessWidget {
  final HomeSyncState syncState;
  final bool isOnline;

  const _SyncCard({required this.syncState, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    final subtitle = switch (syncState.status) {
      SyncStatus.syncing => 'Syncing…',
      SyncStatus.success =>
        'Last synced ${syncState.lastSyncedAt != null ? TimeOfDay.fromDateTime(syncState.lastSyncedAt!).format(context) : ''}',
      SyncStatus.failed => 'Sync failed: ${syncState.errorMessage ?? ''}',
      SyncStatus.idle => isOnline ? 'Pull down to sync' : 'Offline — using cached data',
    };

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            syncState.status == SyncStatus.failed ? Icons.sync_problem : Icons.sync,
            size: 18,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade700))),
        ],
      ),
    );
  }
}
