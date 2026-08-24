import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../providers/core_providers.dart';
import '../alerts/alerts_list_screen.dart';
import '../gis/gis_map_screen.dart';
import '../home/home_screen.dart';
import '../hotlines/hotlines_screen.dart';
import '../settings/settings_screen.dart';
import '../staff/staff_dashboard/staff_dashboard_screen.dart';

/// Five bottom-nav destinations per the implementation plan's information
/// architecture, built one tab at a time.
class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    // Kick a background sync on launch, after the cached data has already
    // been read (the Home screen's watch-streams show cache immediately
    // regardless of whether this succeeds).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeSyncProvider.notifier).syncNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onViewAllAlerts: () => setState(() => _index = 1)),
      const AlertsListScreen(),
      const GisMapScreen(),
      const HotlinesScreen(),
      const SettingsScreen(),
    ];
    final isStaffLoggedIn = ref.watch(staffAuthProvider).isLoggedIn;

    return Scaffold(
      body: IndexedStack(index: _index, children: screens),
      // Persistent across all five tabs (this Scaffold wraps the
      // IndexedStack, not any one tab's own Scaffold) -- one tap to the
      // Staff Dashboard from anywhere, per the requirement that this not
      // be buried behind Settings. Docked to the start (left) so it
      // never overlaps the GIS Map tab's own "locate me" button, which
      // sits at the bottom-right.
      floatingActionButton: isStaffLoggedIn
          ? FloatingActionButton.extended(
              heroTag: 'staff-dashboard-fab',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const StaffDashboardScreen()),
              ),
              icon: const Icon(Icons.dashboard_outlined),
              label: const Text('Staff Dashboard'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'GIS Map'),
          NavigationDestination(icon: Icon(Icons.phone_outlined), selectedIcon: Icon(Icons.phone), label: 'Hotlines'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
