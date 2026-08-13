import 'package:flutter/material.dart';

/// Colors/labels for whatever status string the backend actually sends
/// (confirmed live: "active" and "on_standby" so far). Falls back to grey
/// for any value not in this map instead of assuming a fixed enum the
/// backend hasn't confirmed.
const Map<String, Color> centerStatusColors = {
  'active': Colors.green,
  'on_standby': Colors.blueGrey,
  'full': Colors.red,
  'closed': Colors.grey,
};

Color centerStatusColor(String status) => centerStatusColors[status] ?? Colors.grey;

String centerStatusLabel(String status) {
  return status
      .split('_')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');
}
