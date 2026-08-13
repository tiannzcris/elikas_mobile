import 'package:flutter/material.dart';
import '../../core/date_format.dart';
import '../../database/database.dart';

/// Full detail view for a single alert. Deliberately does NOT show
/// "affected barangays" or a "related evacuation center" link -- verified
/// against the actual alerts migration/API, neither a barangay-scoping
/// field nor an evacuation_event_id is available to key off of, so those
/// sections are dropped for v1 instead of faking them (implementation
/// plan gap #3).
class AlertDetailsScreen extends StatelessWidget {
  final Alert alert;

  const AlertDetailsScreen({super.key, required this.alert});

  static const _severityColors = {
    'mandatory': Colors.red,
    'advisory': Colors.orange,
    'all_clear': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    final color = _severityColors[alert.severity] ?? Colors.blue;
    final when = alert.dateSent ?? alert.createdAt;

    return Scaffold(
      appBar: AppBar(title: const Text('Alert Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border(left: BorderSide(color: color, width: 4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      alert.severity.toUpperCase().replaceAll('_', ' '),
                      style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        alert.alertType.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(alert.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(alert.message, style: const TextStyle(fontSize: 14, height: 1.4)),
                const SizedBox(height: 12),
                Text(
                  '${formatFullDate(when)} · ${formatTime(context, when)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          _DetailRow(label: 'Type', value: alert.alertType),
          if (alert.eventName != null) _DetailRow(label: 'Related Event', value: alert.eventName!),
          if (alert.senderName != null) _DetailRow(label: 'Source', value: alert.senderName!),
          _DetailRow(label: 'Date Sent', value: '${formatFullDate(when)} · ${formatTime(context, when)}'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Barangay-level breakdown and linked evacuation centers aren\'t tracked '
                    'by the backend yet, so they\'re not shown here.',
                    style: TextStyle(fontSize: 11.5, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
