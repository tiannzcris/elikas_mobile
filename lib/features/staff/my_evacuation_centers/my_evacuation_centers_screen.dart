import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/center_status.dart';
import '../../../database/database.dart';
import '../../../providers/auth_providers.dart';
import '../../../providers/core_providers.dart';
import '../evacuation_center_form/evacuation_center_form_screen.dart';

/// Online-only, matching the rest of evacuation-center management (no
/// offline cache -- this always reflects the server's current state).
///
/// Scoping: barangay_official accounts only have a "barangay" set on
/// their session (confirmed at login); CSWD/admin accounts don't serve
/// one specific barangay. That existing, already-verified signal is
/// reused here to decide whether to filter to "centers I created" or
/// show everything, rather than guessing at a literal role enum string
/// that was never confirmed against the real backend.
class MyEvacuationCentersScreen extends ConsumerStatefulWidget {
  const MyEvacuationCentersScreen({super.key});

  @override
  ConsumerState<MyEvacuationCentersScreen> createState() => _MyEvacuationCentersScreenState();
}

class _MyEvacuationCentersScreenState extends ConsumerState<MyEvacuationCentersScreen> {
  bool _loading = true;
  String? _error;
  List<Map<String, dynamic>> _centers = const [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final session = ref.read(staffAuthProvider).session;
    final isOnline = ref.read(isOnlineProvider).asData?.value ?? true;
    if (session == null) return;
    if (!isOnline) {
      setState(() {
        _loading = false;
        _error = null;
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final raw = await ref.read(apiServiceProvider).getMyEvacuationCenters(session.token);
      final all = raw.cast<Map<String, dynamic>>();

      // Officials (session.barangay != null) only see centers they
      // created themselves (or that an admin assigned to them) --
      // CSWD/admin (no single barangay tied to their account) see all,
      // since server-side they can edit any center regardless of creator.
      final isBarangayScoped = session.barangay != null;
      final mine = isBarangayScoped
          ? all.where((c) => _extractCreatorId(c) == session.userId).toList()
          : all;

      setState(() {
        _centers = mine;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  int? _extractCreatorId(Map<String, dynamic> c) {
    final raw = c['created_by'] ?? c['creator'] ?? c['created_by_id'];
    if (raw == null) return null;
    if (raw is int) return raw;
    if (raw is Map<String, dynamic>) return raw['id'] as int?;
    return null;
  }

  EvacuationCenter _toDriftRow(Map<String, dynamic> c) {
    final barangay = c['barangay'];
    return EvacuationCenter(
      id: c['id'] as int,
      name: c['name'] as String? ?? '',
      type: c['type'] as String? ?? 'other',
      address: c['address'] as String? ?? '',
      barangay: barangay is Map<String, dynamic> ? barangay['name'] as String? : barangay as String?,
      latitude: (c['latitude'] as num?)?.toDouble(),
      longitude: (c['longitude'] as num?)?.toDouble(),
      capacityPersons: c['capacity_persons'] as int?,
      currentOccupancy: c['current_occupancy'] as int?,
      status: c['status'] as String? ?? 'on_standby',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;
    final session = ref.watch(staffAuthProvider).session;
    final isBarangayScoped = session?.barangay != null;

    return Scaffold(
      appBar: AppBar(title: const Text('My Evacuation Centers')),
      body: !isOnline
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_off, size: 40, color: Colors.grey.shade400),
                    const SizedBox(height: 12),
                    Text(
                      'This needs an internet connection to load the current list from the server.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: _load,
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _error != null
                      ? ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text('Could not load centers: $_error', style: const TextStyle(color: Colors.red)),
                            ),
                          ],
                        )
                      : _centers.isEmpty
                          ? ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
                                  child: Column(
                                    children: [
                                      Icon(Icons.home_work_outlined, size: 40, color: Colors.grey.shade400),
                                      const SizedBox(height: 12),
                                      Text(
                                        isBarangayScoped
                                            ? 'You haven\'t created any evacuation centers yet, and none have been assigned to you.'
                                            : 'No evacuation centers found.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.grey.shade600),
                                      ),
                                      if (isBarangayScoped) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'Use "Add Evacuation Center" to create your first one.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: _centers.length,
                              itemBuilder: (context, i) {
                                final c = _centers[i];
                                final row = _toDriftRow(c);
                                final color = centerStatusColor(row.status);
                                final barangayName = row.barangay ?? 'No barangay on file';

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
                                      onTap: () async {
                                        await Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_) => EvacuationCenterFormScreen(existing: row)),
                                        );
                                        _load();
                                      },
                                      child: ListTile(
                                        title: Text(row.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                                        subtitle: Text('Brgy. $barangayName', style: const TextStyle(fontSize: 12)),
                                        trailing: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration:
                                              BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                                          child: Text(centerStatusLabel(row.status),
                                              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: color)),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
            ),
    );
  }
}
