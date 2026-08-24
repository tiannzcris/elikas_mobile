import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/date_format.dart';
import '../../../database/database.dart';
import '../../../providers/auth_providers.dart';
import '../../../providers/core_providers.dart';
import '../../../providers/registration_providers.dart';
import '../family_registration/family_registration_screen.dart';

/// Staff-only, server-fetched (GET /api/v1/families) and cached for
/// offline browsing. Barangay scoping is handled server-side (confirmed
/// against the real index() logic): barangay officials automatically see
/// only their own barangay, CSWD/admin see everyone -- this screen just
/// displays whatever the server decided to send back.
class AllEvacueesScreen extends ConsumerStatefulWidget {
  const AllEvacueesScreen({super.key});

  @override
  ConsumerState<AllEvacueesScreen> createState() => _AllEvacueesScreenState();
}

class _AllEvacueesScreenState extends ConsumerState<AllEvacueesScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncNow());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _syncNow() async {
    final token = ref.read(staffAuthProvider).session?.token;
    final isOnline = ref.read(isOnlineProvider).asData?.value ?? true;
    if (token == null || !isOnline) return;
    await ref.read(evacueesSyncProvider.notifier).syncNow(token);
  }

  @override
  Widget build(BuildContext context) {
    final familiesAsync = ref.watch(cachedFamiliesProvider);
    final evacueesAsync = ref.watch(cachedEvacueesProvider);
    final syncState = ref.watch(evacueesSyncProvider);
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;

    final families = familiesAsync.asData?.value ?? const <CachedFamily>[];
    final evacuees = evacueesAsync.asData?.value ?? const <CachedEvacuee>[];

    final query = _query.trim().toLowerCase();
    List<CachedFamily> visible;
    if (query.isEmpty) {
      visible = families;
    } else {
      final matchingFamilyIdsByMember =
          evacuees.where((e) => e.fullName.toLowerCase().contains(query)).map((e) => e.familyId).toSet();
      visible = families.where((f) {
        return (f.headOfFamilyName ?? '').toLowerCase().contains(query) ||
            f.barangayName.toLowerCase().contains(query) ||
            matchingFamilyIdsByMember.contains(f.id);
      }).toList();
    }

    final byBarangay = <String, List<CachedFamily>>{};
    for (final f in visible) {
      byBarangay.putIfAbsent(f.barangayName, () => []).add(f);
    }
    final barangayNames = byBarangay.keys.toList()..sort();
    for (final list in byBarangay.values) {
      list.sort((a, b) => (a.headOfFamilyName ?? '').compareTo(b.headOfFamilyName ?? ''));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Evacuees'),
        actions: [
          IconButton(
            icon: syncState.syncing
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.sync),
            onPressed: syncState.syncing ? null : _syncNow,
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
        onRefresh: _syncNow,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by name or barangay',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 12),
            if (!isOnline)
              _Banner(
                color: Colors.blue,
                icon: Icons.cloud_off,
                text: "You're offline -- showing cached data.",
              ),
            if (syncState.error != null) ...[
              const SizedBox(height: 8),
              _Banner(color: Colors.red, icon: Icons.error_outline, text: 'Sync failed: ${syncState.error}'),
            ],
            const SizedBox(height: 8),
            Text(
              syncState.lastSyncedAt != null
                  ? 'Showing data as of ${formatFullDate(syncState.lastSyncedAt!)} · ${formatTime(context, syncState.lastSyncedAt!)}'
                  : 'Never synced yet -- connect to the internet and tap sync.',
              style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 12),
            if (families.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: [
                    Icon(Icons.groups_outlined, size: 40, color: Colors.grey.shade400),
                    const SizedBox(height: 12),
                    Text('No evacuees cached yet.', style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              )
            else if (visible.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text('No matches for "$_query".', style: TextStyle(color: Colors.grey.shade600)),
              )
            else
              for (final barangayName in barangayNames) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 4),
                  child: Text(
                    'BRGY. ${barangayName.toUpperCase()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5, color: Colors.grey.shade600, letterSpacing: 0.5),
                  ),
                ),
                for (final f in byBarangay[barangayName]!)
                  _FamilyTile(family: f, members: evacuees.where((e) => e.familyId == f.id).toList()),
                const SizedBox(height: 8),
              ],
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

class _FamilyTile extends StatelessWidget {
  final CachedFamily family;
  final List<CachedEvacuee> members;

  const _FamilyTile({required this.family, required this.members});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12),
          title: Text(family.headOfFamilyName ?? '(No head of family set)', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
          subtitle: Text(
            [
              '${family.memberCount} member${family.memberCount == 1 ? '' : 's'}',
              if (family.evacuationCenterName != null) family.evacuationCenterName!,
              if (family.evacuationCenterName == null && family.homeAddress != null) family.homeAddress!,
            ].join(' · '),
            style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
          ),
          trailing: Wrap(
            spacing: 4,
            children: [
              if (family.is4psBeneficiary) const _Badge(label: '4Ps', color: Colors.purple),
              if (family.hasPwdMember) const _Badge(label: 'PWD', color: Colors.blue),
              if (family.hasLactatingMember) const _Badge(label: 'Lactating', color: Colors.pink),
            ],
          ),
          children: [
            for (final m in members)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Row(
                  children: [
                    Icon(
                      m.id == family.headOfFamilyEvacueeId ? Icons.star : Icons.person_outline,
                      size: 16,
                      color: m.id == family.headOfFamilyEvacueeId ? Colors.amber.shade700 : Colors.grey.shade500,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.fullName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          Text(
                            [
                              if (m.dateOfBirth != null) '${_age(m.dateOfBirth!)} y/o',
                              m.sex,
                              if (m.contactNumber != null) m.contactNumber!,
                            ].join(' · '),
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  int _age(DateTime dob) {
    final now = DateTime.now();
    var age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) age--;
    return age;
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final MaterialColor color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: color.shade50, borderRadius: BorderRadius.circular(6)),
      child: Text(label, style: TextStyle(fontSize: 9, color: color.shade800, fontWeight: FontWeight.bold)),
    );
  }
}
