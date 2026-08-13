import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hotlines_data.dart';

const _categoryIcons = {
  'Social Welfare': Icons.groups_outlined,
  'Emergency Response': Icons.warning_amber_rounded,
  'Medical': Icons.local_hospital_outlined,
  'Police': Icons.local_police_outlined,
  'Fire': Icons.local_fire_department_outlined,
  'Health': Icons.health_and_safety_outlined,
};

class HotlinesScreen extends StatelessWidget {
  const HotlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final byCategory = <String, List<Hotline>>{};
    for (final h in hotlines) {
      byCategory.putIfAbsent(h.category, () => []).add(h);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Hotlines')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(Icons.verified_user_outlined, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text('These are the official emergency services of Ligao City.', style: TextStyle(fontSize: 12.5)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final entry in byCategory.entries) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 4),
              child: Text(
                entry.key.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5, color: Colors.grey.shade600, letterSpacing: 0.5),
              ),
            ),
            ...entry.value.map((h) => _HotlineTile(hotline: h)),
            const SizedBox(height: 8),
          ],
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(Icons.phone_in_talk_outlined, color: Colors.orange.shade800),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('In an emergency, call 911', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade900, fontSize: 13)),
                      Text('For life-threatening situations requiring immediate response.',
                          style: TextStyle(fontSize: 11.5, color: Colors.orange.shade900)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Important Reminders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 6),
                Text('• Stay calm and provide accurate information.', style: TextStyle(fontSize: 12)),
                Text('• Share your location and the nature of the emergency.', style: TextStyle(fontSize: 12)),
                Text('• Keep the line open for the responder\'s instructions.', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HotlineTile extends StatelessWidget {
  final Hotline hotline;

  const _HotlineTile({required this.hotline});

  Future<void> _call(BuildContext context) async {
    if (hotline.isPlaceholder) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${hotline.name}\'s real number hasn\'t been set up yet.')),
      );
      return;
    }
    await launchUrl(Uri.parse('tel:${hotline.phoneNumber}'));
  }

  @override
  Widget build(BuildContext context) {
    final icon = _categoryIcons[hotline.category] ?? Icons.phone_outlined;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.blueGrey.shade50, child: Icon(icon, size: 18, color: Colors.blueGrey.shade700)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotline.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                Text(hotline.description, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(hotline.phoneNumber, style: TextStyle(fontSize: 12, color: hotline.isPlaceholder ? Colors.grey.shade400 : Colors.black87)),
                    if (hotline.isPlaceholder) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(color: Colors.amber.shade100, borderRadius: BorderRadius.circular(6)),
                        child: Text('not set', style: TextStyle(fontSize: 9.5, color: Colors.amber.shade900, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          IconButton.filled(
            onPressed: () => _call(context),
            icon: const Icon(Icons.call, size: 18),
            style: IconButton.styleFrom(
              backgroundColor: hotline.isPlaceholder ? Colors.grey.shade300 : Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
