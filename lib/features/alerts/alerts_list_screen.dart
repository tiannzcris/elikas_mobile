import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/date_format.dart';
import '../../database/database.dart';
import '../../providers/core_providers.dart';
import 'alert_details_screen.dart';

/// null means "All". Only the four severities the backend actually uses
/// (mandatory/advisory/info/all_clear) are offered -- no invented values.
final severityFilterProvider = StateProvider<String?>((ref) => null);

class AlertsListScreen extends ConsumerWidget {
  const AlertsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsync = ref.watch(alertsProvider);
    final filter = ref.watch(severityFilterProvider);
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts & Notices'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterChip(label: 'All', selected: filter == null, onTap: () => ref.read(severityFilterProvider.notifier).state = null),
                  _FilterChip(label: 'Mandatory', selected: filter == 'mandatory', color: Colors.red, onTap: () => ref.read(severityFilterProvider.notifier).state = 'mandatory'),
                  _FilterChip(label: 'Advisory', selected: filter == 'advisory', color: Colors.orange, onTap: () => ref.read(severityFilterProvider.notifier).state = 'advisory'),
                  _FilterChip(label: 'Info', selected: filter == 'info', color: Colors.blue, onTap: () => ref.read(severityFilterProvider.notifier).state = 'info'),
                  _FilterChip(label: 'All Clear', selected: filter == 'all_clear', color: Colors.green, onTap: () => ref.read(severityFilterProvider.notifier).state = 'all_clear'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeSyncProvider.notifier).syncNow(),
        child: alertsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text('Could not load alerts: $e', style: const TextStyle(color: Colors.red)),
              ),
            ],
          ),
          data: (allAlerts) {
            final alerts = filter == null ? allAlerts : allAlerts.where((a) => a.severity == filter).toList();

            if (alerts.isEmpty) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
                    child: Column(
                      children: [
                        Icon(Icons.notifications_off_outlined, size: 40, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        Text(
                          allAlerts.isEmpty
                              ? 'No alerts yet. Pull down to sync.'
                              : 'No alerts match this filter.',
                          style: TextStyle(color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            final groups = _groupByDate(alerts);

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (!isOnline) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.cloud_off, color: Colors.blue.shade700, size: 18),
                        const SizedBox(width: 8),
                        const Expanded(child: Text("You're offline — showing cached alerts.", style: TextStyle(fontSize: 12))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                for (final entry in groups.entries) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 4),
                    child: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                  ...entry.value.map((a) => _AlertListTile(alert: a)),
                  const SizedBox(height: 8),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Map<String, List<Alert>> _groupByDate(List<Alert> alerts) {
    final groups = <String, List<Alert>>{};
    for (final a in alerts) {
      final header = formatDateHeader(a.dateSent ?? a.createdAt);
      groups.putIfAbsent(header, () => []).add(a);
    }
    return groups;
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.selected, required this.onTap, this.color = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        selectedColor: color.withValues(alpha: 0.15),
        labelStyle: TextStyle(color: selected ? color.withValues(alpha: 1) : Colors.grey.shade700, fontWeight: selected ? FontWeight.bold : FontWeight.normal, fontSize: 12.5),
        side: BorderSide(color: selected ? color : Colors.grey.shade300),
      ),
    );
  }
}

class _AlertListTile extends StatelessWidget {
  final Alert alert;

  const _AlertListTile({required this.alert});

  static const _colors = {
    'mandatory': Colors.red,
    'advisory': Colors.orange,
    'all_clear': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    final color = _colors[alert.severity] ?? Colors.blue;
    final when = alert.dateSent ?? alert.createdAt;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AlertDetailsScreen(alert: alert)),
          ),
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(Icons.campaign_outlined, color: color, size: 18),
          ),
          title: Text(alert.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
          subtitle: Text(alert.message, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
          trailing: Text(formatTime(context, when), style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ),
      ),
    );
  }
}
