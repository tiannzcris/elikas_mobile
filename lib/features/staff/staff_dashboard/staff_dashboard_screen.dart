import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/auth_providers.dart';
import '../all_evacuees/all_evacuees_screen.dart';
import '../evacuation_center_form/evacuation_center_form_screen.dart';
import '../family_registration/family_registration_screen.dart';
import '../my_evacuation_centers/my_evacuation_centers_screen.dart';
import '../pending_registrations/pending_registrations_screen.dart';

/// The primary, unmissable home for every staff feature -- Settings still
/// links to some of these individually (kept as secondary paths), but
/// this dashboard is the one place all of them live together.
class StaffDashboardScreen extends ConsumerWidget {
  const StaffDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(staffAuthProvider).session;

    return Scaffold(
      appBar: AppBar(title: const Text('Staff Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
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
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.badge_outlined, color: Color(0xFF0D2A5C)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(session?.name ?? 'Staff', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        [if (session?.role != null) session!.role!, if (session?.barangay != null) 'Brgy. ${session!.barangay}']
                            .join(' · '),
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _DashboardTile(
            icon: Icons.person_add_alt_outlined,
            color: Colors.indigo,
            title: 'Register a Family',
            subtitle: 'Works offline -- syncs when you\'re ready',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FamilyRegistrationScreen())),
          ),
          _DashboardTile(
            icon: Icons.pending_actions_outlined,
            color: Colors.orange,
            title: 'My Pending Registrations',
            subtitle: 'Offline queue -- review, edit, and sync',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PendingRegistrationsScreen())),
          ),
          _DashboardTile(
            icon: Icons.groups_outlined,
            color: Colors.teal,
            title: 'All Evacuees',
            subtitle: 'Browse registered families',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AllEvacueesScreen())),
          ),
          _DashboardTile(
            icon: Icons.add_home_work_outlined,
            color: Colors.green,
            title: 'Add Evacuation Center',
            subtitle: 'Online only -- not queued offline',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EvacuationCenterFormScreen())),
          ),
          _DashboardTile(
            icon: Icons.holiday_village_outlined,
            color: Colors.brown,
            title: 'My Evacuation Centers',
            subtitle: 'View and edit centers you can manage',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyEvacuationCentersScreen())),
          ),
          const SizedBox(height: 12),
          _DashboardTile(
            icon: Icons.logout,
            color: Colors.red,
            title: 'Staff Logout',
            subtitle: 'Return to the resident-only experience',
            onTap: () async {
              await ref.read(staffAuthProvider.notifier).logout();
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.12),
              child: Icon(icon, color: color.shade700, size: 20),
            ),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: Text(subtitle, style: const TextStyle(fontSize: 11.5)),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
