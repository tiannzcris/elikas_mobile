import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/date_format.dart';
import '../../../database/database.dart';
import '../../../providers/auth_providers.dart';
import '../../../providers/core_providers.dart';
import '../../../providers/registration_providers.dart';
import '../family_registration/family_registration_screen.dart';

class PendingRegistrationsScreen extends ConsumerStatefulWidget {
  const PendingRegistrationsScreen({super.key});

  @override
  ConsumerState<PendingRegistrationsScreen> createState() => _PendingRegistrationsScreenState();
}

class _PendingRegistrationsScreenState extends ConsumerState<PendingRegistrationsScreen> {
  // Deliberately no auto-sync on open -- staff need a reliable window to
  // review/edit a registration before it's pushed. Sync only ever runs
  // from an explicit tap (the AppBar button or pull-to-refresh below).
  Future<void> _syncNow() async {
    final token = ref.read(staffAuthProvider).session?.token;
    final isOnline = ref.read(isOnlineProvider).asData?.value ?? true;
    if (token == null || !isOnline) return;
    await ref.read(pendingRegistrationsSyncProvider.notifier).pushNow(token);
  }

  /// The AppBar sync button confirms first -- an accidental tap there
  /// shouldn't silently submit registrations staff may still want to
  /// review/edit. Pull-to-refresh is left unconfirmed since that's
  /// already a deliberate gesture, not an easy misfire.
  Future<void> _confirmAndSync() async {
    final unsyncedCount =
        ref.read(pendingRegistrationsProvider).asData?.value.where((r) => !r.synced).length ?? 0;
    if (unsyncedCount == 0) {
      await _syncNow();
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sync now?'),
        content: Text(
          'This will submit $unsyncedCount not-yet-synced registration${unsyncedCount == 1 ? '' : 's'} to the server. '
          'Once synced, they can no longer be edited here.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Not yet')),
          TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Sync')),
        ],
      ),
    );
    if (confirmed == true) await _syncNow();
  }

  Future<void> _confirmDelete(PendingRegistration row) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete this registration?'),
        content: Text(
          row.synced
              ? '${row.headOfFamilyName}\'s family was already synced to the server -- this only removes the local copy from this list.'
              : '${row.headOfFamilyName}\'s family has NOT been synced yet. Deleting it removes this registration entirely -- it will not be submitted.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final db = ref.read(appDatabaseProvider);
    await (db.delete(db.pendingRegistrations)..where((r) => r.id.equals(row.id))).go();
  }

  @override
  Widget build(BuildContext context) {
    final registrationsAsync = ref.watch(pendingRegistrationsProvider);
    final syncState = ref.watch(pendingRegistrationsSyncProvider);
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pending Registrations'),
        actions: [
          IconButton(
            icon: syncState.status == PushSyncStatus.syncing
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.sync),
            onPressed: syncState.status == PushSyncStatus.syncing ? null : () => _confirmAndSync(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const FamilyRegistrationScreen()),
        ),
        icon: const Icon(Icons.person_add_alt_outlined),
        label: const Text('Register a Family'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _syncNow(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!isOnline)
              _Banner(
                color: Colors.blue,
                icon: Icons.cloud_off,
                text: "You're offline. Registrations below are saved on this device and will sync once you're back online.",
              ),
            if (isOnline && syncState.status == PushSyncStatus.done && syncState.lastResult != null) ...[
              const SizedBox(height: 8),
              _Banner(
                color: syncState.lastResult!.failed == 0 ? Colors.green : Colors.orange,
                icon: syncState.lastResult!.failed == 0 ? Icons.check_circle_outline : Icons.warning_amber_outlined,
                text: syncState.lastResult!.failed == 0
                    ? 'Synced ${syncState.lastResult!.succeeded} registration(s).'
                    : 'Synced ${syncState.lastResult!.succeeded}, ${syncState.lastResult!.failed} failed -- see below.',
              ),
            ],
            const SizedBox(height: 12),
            registrationsAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text('Could not load registrations: $e', style: const TextStyle(color: Colors.red)),
              data: (rows) {
                if (rows.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Icon(Icons.family_restroom_outlined, size: 40, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        Text('No registrations yet.', style: TextStyle(color: Colors.grey.shade600)),
                        const SizedBox(height: 4),
                        Text('Use "Register a Family" to add one.', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                      ],
                    ),
                  );
                }
                return Column(
                  children: rows
                      .map((r) => _RegistrationTile(
                            row: r,
                            onDelete: () => _confirmDelete(r),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => FamilyRegistrationScreen(existing: r)),
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;
  final String text;

  const _Banner({required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color.shade50, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: color.shade700, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(fontSize: 12, color: color.shade900))),
        ],
      ),
    );
  }
}

class _RegistrationTile extends StatelessWidget {
  final PendingRegistration row;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const _RegistrationTile({required this.row, required this.onDelete, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final failed = !row.synced && row.syncError != null;
    final color = row.synced ? Colors.green : (failed ? Colors.red : Colors.orange);
    final label = row.synced ? 'Synced' : (failed ? 'Failed' : 'Pending');

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
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(row.headOfFamilyName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration:
                          BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                      child: Text(label, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: color.shade800)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                      visualDensity: VisualDensity.compact,
                      onPressed: onDelete,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Brgy. ${row.barangayName} · ${row.memberCount} member${row.memberCount == 1 ? '' : 's'} · '
                  '${formatFullDate(row.createdAt)}'
                  '${row.synced ? ' · Tap to view' : ' · Tap to edit'}',
                  style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
                ),
                if (failed) ...[
                  const SizedBox(height: 6),
                  Text(row.syncError!, style: const TextStyle(fontSize: 11, color: Colors.red)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
