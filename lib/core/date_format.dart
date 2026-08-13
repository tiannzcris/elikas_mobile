import 'package:flutter/material.dart';

const _months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String formatTime(BuildContext context, DateTime dt) {
  return TimeOfDay.fromDateTime(dt).format(context);
}

String formatFullDate(DateTime dt) {
  return '${_months[dt.month - 1]} ${dt.day}, ${dt.year}';
}

/// "Today", "Yesterday", or a full date -- used as list section headers.
String formatDateHeader(DateTime dt) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(dt.year, dt.month, dt.day);
  final diff = today.difference(day).inDays;

  if (diff == 0) return 'Today';
  if (diff == 1) return 'Yesterday';
  return formatFullDate(dt);
}
