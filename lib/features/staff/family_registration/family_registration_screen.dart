import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/validators.dart';
import '../../../database/database.dart';
import '../../../providers/auth_providers.dart';
import '../../../providers/core_providers.dart';
import '../../../providers/registration_providers.dart';

const _civilStatusOptions = ['single', 'married', 'widowed', 'separated', 'divorced'];
// Confirmed against the actual backend controller/routes -- this describes
// WHERE the family physically is (checked into a center vs. self-evacuated
// elsewhere), not evacuation timing. evacuation_center_id is required only
// when inside_center.
const _displacementOptions = {
  'inside_center': 'Inside Evacuation Center',
  'outside_center': 'Outside Evacuation Center (Self-Evacuated)',
};

String _titleCase(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

String _fullName(_MemberEntry m) {
  final parts = [
    m.firstNameController.text.trim(),
    m.middleNameController.text.trim(),
    m.lastNameController.text.trim(),
    m.suffixController.text.trim(),
  ];
  return parts.where((p) => p.isNotEmpty).join(' ');
}

/// One family member's in-progress form state. Plain mutable class (not
/// Drift-backed) -- this only needs to live for the lifetime of the form;
/// the moment it's submitted it's serialized straight into the
/// PendingRegistrations JSON blob and this object is discarded.
class _MemberEntry {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final suffixController = TextEditingController();
  final contactController = TextEditingController();
  final pwdTypeController = TextEditingController();
  DateTime? dateOfBirth;
  String sex = 'male';
  String civilStatus = 'single';
  bool isHeadOfFamily = false;
  bool isPwd = false;
  bool isPregnant = false;
  bool isLactating = false;
  bool isSoloParent = false;
  bool isIndigenousPerson = false;
  bool is4psBeneficiary = false;

  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    suffixController.dispose();
    contactController.dispose();
    pwdTypeController.dispose();
  }
}

class FamilyRegistrationScreen extends ConsumerStatefulWidget {
  /// Pass the row being edited or viewed. Omit for a brand-new
  /// registration. If the row is already synced, the form opens
  /// read-only -- editing a registration already submitted to the
  /// server would need a real update call there too, which isn't wired
  /// up (nothing in this queue re-syncs edits after the first success).
  final PendingRegistration? existing;

  const FamilyRegistrationScreen({super.key, this.existing});

  @override
  ConsumerState<FamilyRegistrationScreen> createState() => _FamilyRegistrationScreenState();
}

class _FamilyRegistrationScreenState extends ConsumerState<FamilyRegistrationScreen> {
  final _homeAddressController = TextEditingController();
  final List<_MemberEntry> _members = [];

  Barangay? _selectedBarangay;
  EvacuationCenter? _selectedCenter;
  EvacuationEvent? _selectedEvent;
  String _displacementType = 'inside_center';
  bool _familyIs4psBeneficiary = false;

  bool _barangaySyncing = false;
  String? _barangaySyncError;
  bool _eventsSyncing = false;
  String? _eventsSyncError;
  String? _formError;

  bool get _isEditing => widget.existing != null;
  bool get _isReadOnly => widget.existing?.synced == true;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _loadFromExisting(widget.existing!);
    } else {
      _members.add(_MemberEntry()..isHeadOfFamily = true);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncBarangaysIfPossible());
  }

  /// Reconstructs form state from a previously-saved payload. Lookups
  /// (barangay/event/center) are resolved via `ref.read` against
  /// whatever's already cached -- these providers are already active
  /// well before a pending registration could exist (the create form
  /// requires them), so their cached value should already be present.
  void _loadFromExisting(PendingRegistration row) {
    final payload = jsonDecode(row.payloadJson) as Map<String, dynamic>;

    _homeAddressController.text = payload['home_address'] as String? ?? '';
    _displacementType = payload['displacement_type'] as String? ?? 'inside_center';
    _familyIs4psBeneficiary = payload['is_4ps_beneficiary'] as bool? ?? false;

    final barangayId = payload['barangay_id'] as int?;
    final eventId = payload['evacuation_event_id'] as int?;
    final centerId = payload['evacuation_center_id'] as int?;

    if (barangayId != null) {
      final list = ref.read(barangaysProvider).asData?.value ?? const <Barangay>[];
      for (final b in list) {
        if (b.id == barangayId) _selectedBarangay = b;
      }
    }
    if (eventId != null) {
      final list = ref.read(evacuationEventsProvider).asData?.value ?? const <EvacuationEvent>[];
      for (final e in list) {
        if (e.id == eventId) _selectedEvent = e;
      }
    }
    if (centerId != null) {
      final list = ref.read(evacuationCentersProvider).asData?.value ?? const <EvacuationCenter>[];
      for (final c in list) {
        if (c.id == centerId) _selectedCenter = c;
      }
    }

    final members = payload['members'] as List<dynamic>? ?? const [];
    for (final raw in members) {
      final m = raw as Map<String, dynamic>;
      final entry = _MemberEntry();
      entry.firstNameController.text = m['first_name'] as String? ?? '';
      entry.middleNameController.text = m['middle_name'] as String? ?? '';
      entry.lastNameController.text = m['last_name'] as String? ?? '';
      entry.suffixController.text = m['suffix'] as String? ?? '';
      entry.contactController.text = m['contact_number'] as String? ?? '';
      entry.pwdTypeController.text = m['pwd_type'] as String? ?? '';
      final dobStr = m['date_of_birth'] as String?;
      entry.dateOfBirth = dobStr != null ? DateTime.tryParse(dobStr) : null;
      entry.sex = m['sex'] as String? ?? 'male';
      entry.civilStatus = m['civil_status'] as String? ?? 'single';
      entry.isPwd = m['is_pwd'] as bool? ?? false;
      entry.isPregnant = m['is_pregnant'] as bool? ?? false;
      entry.isLactating = m['is_lactating'] as bool? ?? false;
      entry.isSoloParent = m['is_solo_parent'] as bool? ?? false;
      entry.isIndigenousPerson = m['is_indigenous_person'] as bool? ?? false;
      entry.is4psBeneficiary = m['is_4ps_beneficiary'] as bool? ?? false;
      entry.isHeadOfFamily = m['is_head_of_family'] as bool? ?? false;
      _members.add(entry);
    }
    if (_members.isEmpty) {
      _members.add(_MemberEntry()..isHeadOfFamily = true);
    } else if (!_members.any((m) => m.isHeadOfFamily)) {
      _members.first.isHeadOfFamily = true;
    }
  }

  @override
  void dispose() {
    _homeAddressController.dispose();
    for (final m in _members) {
      m.dispose();
    }
    super.dispose();
  }

  Future<void> _syncBarangaysIfPossible() async {
    final token = ref.read(staffAuthProvider).session?.token;
    final isOnline = ref.read(isOnlineProvider).asData?.value ?? true;
    if (token == null || !isOnline) return;

    setState(() {
      _barangaySyncing = true;
      _barangaySyncError = null;
    });
    try {
      await ref.read(syncServiceProvider).syncBarangays(token);
    } catch (e) {
      if (mounted) setState(() => _barangaySyncError = e.toString());
    } finally {
      if (mounted) setState(() => _barangaySyncing = false);
    }

    setState(() {
      _eventsSyncing = true;
      _eventsSyncError = null;
    });
    try {
      await ref.read(syncServiceProvider).syncEvacuationEvents(token);
    } catch (e) {
      if (mounted) setState(() => _eventsSyncError = e.toString());
    } finally {
      if (mounted) setState(() => _eventsSyncing = false);
    }
  }

  void _addMember() {
    setState(() => _members.add(_MemberEntry()));
  }

  void _removeMember(_MemberEntry entry) {
    setState(() {
      final wasHead = entry.isHeadOfFamily;
      entry.dispose();
      _members.remove(entry);
      if (wasHead && _members.isNotEmpty) {
        _members.first.isHeadOfFamily = true;
      }
    });
  }

  void _setHead(_MemberEntry entry) {
    setState(() {
      for (final m in _members) {
        m.isHeadOfFamily = identical(m, entry);
      }
    });
  }

  Future<void> _pickCenter(List<EvacuationCenter> centers) async {
    final result = await showModalBottomSheet<_CenterPickerResult>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _CenterPickerSheet(centers: centers, current: _selectedCenter),
    );
    if (result != null) {
      setState(() => _selectedCenter = result.center);
    }
  }

  String? _validate() {
    if (_selectedBarangay == null) return 'Select the family\'s barangay.';
    if (_selectedEvent == null) return 'Select the evacuation event this registration is for.';
    if (_displacementType == 'inside_center' && _selectedCenter == null) {
      return 'Select an evacuation center, or change status to Outside Evacuation Center.';
    }
    if (_members.isEmpty) return 'Add at least one family member.';
    for (var i = 0; i < _members.length; i++) {
      final m = _members[i];
      final label = 'Member ${i + 1}';
      if (m.firstNameController.text.trim().isEmpty) return '$label: first name is required.';
      if (m.lastNameController.text.trim().isEmpty) return '$label: last name is required.';
      if (m.dateOfBirth == null) return '$label: date of birth is required.';
      if (m.contactController.text.trim().isEmpty) return '$label: contact number is required.';
      if (!isValidPhMobileNumber(m.contactController.text)) {
        return '$label: contact number must be 09XXXXXXXXX or +639XXXXXXXXX.';
      }
      if (m.isPwd && m.pwdTypeController.text.trim().isEmpty) {
        return '$label: PWD type is required when marked as PWD.';
      }
    }
    if (!_members.any((m) => m.isHeadOfFamily)) return 'Mark one member as head of family.';
    return null;
  }

  Future<void> _submit() async {
    final error = _validate();
    if (error != null) {
      setState(() => _formError = error);
      return;
    }
    setState(() => _formError = null);

    final head = _members.firstWhere((m) => m.isHeadOfFamily);
    final payload = {
      'evacuation_event_id': _selectedEvent!.id,
      'barangay_id': _selectedBarangay!.id,
      if (_homeAddressController.text.trim().isNotEmpty) 'home_address': _homeAddressController.text.trim(),
      'displacement_type': _displacementType,
      'evacuation_center_id': _displacementType == 'inside_center' ? _selectedCenter?.id : null,
      'is_4ps_beneficiary': _familyIs4psBeneficiary,
      'members': _members.map((m) {
        final dob = m.dateOfBirth!;
        return {
          'first_name': m.firstNameController.text.trim(),
          if (m.middleNameController.text.trim().isNotEmpty) 'middle_name': m.middleNameController.text.trim(),
          'last_name': m.lastNameController.text.trim(),
          if (m.suffixController.text.trim().isNotEmpty) 'suffix': m.suffixController.text.trim(),
          'sex': m.sex,
          'date_of_birth':
              '${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}',
          'civil_status': m.civilStatus,
          'contact_number': m.contactController.text.trim(),
          'is_pwd': m.isPwd,
          if (m.isPwd) 'pwd_type': m.pwdTypeController.text.trim(),
          'is_pregnant': m.isPregnant,
          'is_lactating': m.isLactating,
          'is_solo_parent': m.isSoloParent,
          'is_indigenous_person': m.isIndigenousPerson,
          'is_4ps_beneficiary': m.is4psBeneficiary,
          'is_head_of_family': m.isHeadOfFamily,
        };
      }).toList(),
    };

    final db = ref.read(appDatabaseProvider);
    if (_isEditing) {
      await (db.update(db.pendingRegistrations)..where((r) => r.id.equals(widget.existing!.id))).write(
            PendingRegistrationsCompanion(
              payloadJson: Value(jsonEncode(payload)),
              headOfFamilyName: Value(_fullName(head)),
              barangayName: Value(_selectedBarangay!.name),
              memberCount: Value(_members.length),
              // Content changed -- clear any previous sync error and mark
              // unsynced again so this edit actually gets pushed next time.
              synced: const Value(false),
              syncError: const Value(null),
            ),
          );
    } else {
      await db.into(db.pendingRegistrations).insert(
            PendingRegistrationsCompanion.insert(
              payloadJson: jsonEncode(payload),
              headOfFamilyName: _fullName(head),
              barangayName: _selectedBarangay!.name,
              memberCount: _members.length,
              createdAt: DateTime.now(),
            ),
          );
    }

    // Deliberately NOT auto-pushed to the server -- staff need a window
    // to review/edit a registration (e.g. from "My Pending
    // Registrations") before it goes out. Syncing only happens when they
    // explicitly tap Sync there.
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(_isEditing ? 'Registration Updated' : 'Registration Saved'),
        content: const Text(
          'Saved on this device. Sync it from "My Pending Registrations" when you\'re ready to submit it.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK')),
        ],
      ),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final barangaysAsync = ref.watch(barangaysProvider);
    final centersAsync = ref.watch(evacuationCentersProvider);
    final eventsAsync = ref.watch(evacuationEventsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isReadOnly ? 'View Registration' : (_isEditing ? 'Edit Registration' : 'Register a Family')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isReadOnly ? Colors.green.shade50 : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  _isReadOnly ? Icons.check_circle_outline : Icons.save_outlined,
                  color: _isReadOnly ? Colors.green.shade700 : Colors.blue.shade700,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _isReadOnly
                        ? 'This registration was already synced to the server. Viewing only -- submitted registrations can\'t be edited here.'
                        : (_isEditing
                            ? 'Editing an unsynced registration. Changes stay on this device until you sync it manually.'
                            : 'Saved on this device first. No internet needed -- sync it manually from "My Pending Registrations" when ready.'),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Family Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 10),
          barangaysAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Text('Could not load barangays: $e', style: const TextStyle(color: Colors.red, fontSize: 12)),
            data: (barangays) {
              if (barangays.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    _barangaySyncing
                        ? 'Loading barangays…'
                        : (_barangaySyncError != null
                            ? 'Could not load barangays: $_barangaySyncError'
                            : 'No barangays cached yet -- connect to the internet once to load the list.'),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
              return DropdownButtonFormField<Barangay>(
                initialValue: _selectedBarangay,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Barangay *', border: OutlineInputBorder()),
                items: barangays.map((b) => DropdownMenuItem(value: b, child: Text(b.name))).toList(),
                onChanged: _isReadOnly ? null : (v) => setState(() => _selectedBarangay = v),
              );
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _homeAddressController,
            enabled: !_isReadOnly,
            decoration: const InputDecoration(labelText: 'Street/Sitio Address (optional)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            title: const Text('Household is a 4Ps beneficiary', style: TextStyle(fontSize: 13)),
            value: _familyIs4psBeneficiary,
            onChanged: _isReadOnly ? null : (v) => setState(() => _familyIs4psBeneficiary = v ?? false),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: _displacementType,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Current Status *', border: OutlineInputBorder()),
            items: _displacementOptions.entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
            onChanged: _isReadOnly
                ? null
                : (v) => setState(() {
                      _displacementType = v ?? _displacementType;
                      if (_displacementType == 'outside_center') _selectedCenter = null;
                    }),
          ),
          const SizedBox(height: 12),
          // Required by the backend (RegisterFamilyRequest), and the
          // endpoint deliberately returns closed events too -- filtered
          // to non-closed here, same as the web dashboard's own picker.
          eventsAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) =>
                Text('Could not load evacuation events: $e', style: const TextStyle(color: Colors.red, fontSize: 12)),
            data: (allEvents) {
              final openEvents = allEvents.where((e) => e.status != 'closed').toList();
              if (openEvents.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    _eventsSyncing
                        ? 'Loading evacuation events…'
                        : (_eventsSyncError != null
                            ? 'Could not load evacuation events: $_eventsSyncError'
                            : 'No active evacuation events cached -- connect to the internet once to load the list.'),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
              return DropdownButtonFormField<EvacuationEvent>(
                initialValue: _selectedEvent,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Evacuation Event *', border: OutlineInputBorder()),
                items: openEvents.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                onChanged: _isReadOnly ? null : (v) => setState(() => _selectedEvent = v),
              );
            },
          ),
          if (_displacementType == 'inside_center') ...[
            const SizedBox(height: 12),
            centersAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (e, _) => const SizedBox.shrink(),
              data: (centers) => InkWell(
                onTap: _isReadOnly ? null : () => _pickCenter(centers),
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Evacuation Center *', border: OutlineInputBorder()),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedCenter == null ? 'Not assigned to a center' : _selectedCenter!.name,
                          style: _selectedCenter == null ? TextStyle(color: Colors.grey.shade600) : null,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Family Members', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              if (!_isReadOnly)
                TextButton.icon(onPressed: _addMember, icon: const Icon(Icons.add), label: const Text('Add Member')),
            ],
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < _members.length; i++)
            _MemberCard(
              key: ObjectKey(_members[i]),
              index: i,
              entry: _members[i],
              headEntry: _members.firstWhere((m) => m.isHeadOfFamily, orElse: () => _members.first),
              canRemove: _members.length > 1 && !_isReadOnly,
              readOnly: _isReadOnly,
              onChanged: () => setState(() {}),
              onRemove: () => _removeMember(_members[i]),
              onSetHead: () => _setHead(_members[i]),
            ),
          const SizedBox(height: 16),
          if (_formError != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
              child: Text(_formError!, style: TextStyle(color: Colors.red.shade800, fontSize: 12)),
            ),
          const SizedBox(height: 16),
          if (!_isReadOnly)
            FilledButton(
              onPressed: _submit,
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              child: Text(_isEditing ? 'Save Changes' : 'Save Registration'),
            ),
        ],
      ),
    );
  }
}

class _MemberCard extends ConsumerStatefulWidget {
  final int index;
  final _MemberEntry entry;
  final _MemberEntry headEntry;
  final bool canRemove;
  final bool readOnly;
  final VoidCallback onChanged;
  final VoidCallback onRemove;
  final VoidCallback onSetHead;

  const _MemberCard({
    required super.key,
    required this.index,
    required this.entry,
    required this.headEntry,
    required this.canRemove,
    required this.readOnly,
    required this.onChanged,
    required this.onRemove,
    required this.onSetHead,
  });

  @override
  ConsumerState<_MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends ConsumerState<_MemberCard> {
  Timer? _debounce;
  List<CachedEvacuee> _matches = const [];

  _MemberEntry get entry => widget.entry;
  _MemberEntry get headEntry => widget.headEntry;
  bool get readOnly => widget.readOnly;
  int get index => widget.index;
  bool get canRemove => widget.canRemove;
  VoidCallback get onChanged => widget.onChanged;
  VoidCallback get onRemove => widget.onRemove;
  VoidCallback get onSetHead => widget.onSetHead;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _pickDob(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: entry.dateOfBirth ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      entry.dateOfBirth = picked;
      onChanged();
    }
  }

  /// Fully offline -- searches whatever's already cached from the last
  /// "All Evacuees" sync, never blocks Save. Debounced so it's not
  /// re-scanning the cache on every single keystroke.
  void _scheduleDuplicateCheck() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      final first = entry.firstNameController.text.trim().toLowerCase();
      final last = entry.lastNameController.text.trim().toLowerCase();
      if (first.length < 2 || last.length < 2) {
        if (_matches.isNotEmpty && mounted) setState(() => _matches = const []);
        return;
      }
      final all = ref.read(cachedEvacueesProvider).asData?.value ?? const <CachedEvacuee>[];
      final found = all.where((e) {
        final name = e.fullName.toLowerCase();
        return name.contains(first) && name.contains(last);
      }).toList();
      if (mounted) setState(() => _matches = found);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isHead = entry.isHeadOfFamily;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isHead ? Colors.indigo.shade200 : Colors.grey.shade200, width: isHead ? 1.5 : 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text('Member ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              FilterChip(
                label: const Text('Head of Family', style: TextStyle(fontSize: 11)),
                selected: isHead,
                onSelected: readOnly ? null : (_) => onSetHead(),
                visualDensity: VisualDensity.compact,
              ),
              if (canRemove)
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                  onPressed: onRemove,
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: entry.firstNameController,
                  enabled: !readOnly,
                  decoration: const InputDecoration(labelText: 'First Name *', isDense: true),
                  onChanged: readOnly ? null : (_) => _scheduleDuplicateCheck(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: entry.lastNameController,
                  enabled: !readOnly,
                  decoration: const InputDecoration(labelText: 'Last Name *', isDense: true),
                  onChanged: readOnly ? null : (_) => _scheduleDuplicateCheck(),
                ),
              ),
            ],
          ),
          if (_matches.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 14, color: Colors.amber.shade800),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _matches.length == 1
                          ? 'Possible existing match: ${_matches.first.fullName}, Brgy. ${_matches.first.barangayName}.'
                          : '${_matches.length} possible existing matches, e.g. ${_matches.first.fullName}, Brgy. ${_matches.first.barangayName}.',
                      style: TextStyle(fontSize: 11, color: Colors.amber.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: entry.middleNameController,
                  enabled: !readOnly,
                  decoration: const InputDecoration(labelText: 'Middle Name', isDense: true),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: TextField(
                  controller: entry.suffixController,
                  enabled: !readOnly,
                  decoration: const InputDecoration(labelText: 'Suffix', isDense: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: readOnly ? null : () => _pickDob(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Date of Birth *', isDense: true),
                    child: Text(
                      entry.dateOfBirth == null
                          ? 'Select date'
                          : '${entry.dateOfBirth!.year}-${entry.dateOfBirth!.month.toString().padLeft(2, '0')}-${entry.dateOfBirth!.day.toString().padLeft(2, '0')}',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: entry.sex,
                  isExpanded: true,
                  decoration: const InputDecoration(labelText: 'Sex', isDense: true),
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('Male')),
                    DropdownMenuItem(value: 'female', child: Text('Female')),
                  ],
                  onChanged: readOnly
                      ? null
                      : (v) {
                          entry.sex = v ?? entry.sex;
                          onChanged();
                        },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            initialValue: entry.civilStatus,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Civil Status', isDense: true),
            items: _civilStatusOptions.map((s) => DropdownMenuItem(value: s, child: Text(_titleCase(s)))).toList(),
            onChanged: readOnly
                ? null
                : (v) {
                    entry.civilStatus = v ?? entry.civilStatus;
                    onChanged();
                  },
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: entry.contactController,
                  enabled: !readOnly,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Contact Number *', isDense: true, hintText: '09XXXXXXXXX'),
                ),
              ),
              if (!isHead && !readOnly) ...[
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    entry.contactController.text = headEntry.contactController.text;
                    onChanged();
                  },
                  child: const Text('Same as head', style: TextStyle(fontSize: 11)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: -8,
            children: [
              _flag('PWD', entry.isPwd, readOnly ? null : (v) {
                entry.isPwd = v;
                onChanged();
              }),
              _flag('Pregnant', entry.isPregnant, readOnly ? null : (v) {
                entry.isPregnant = v;
                onChanged();
              }),
              _flag('Lactating', entry.isLactating, readOnly ? null : (v) {
                entry.isLactating = v;
                onChanged();
              }),
              _flag('Solo Parent', entry.isSoloParent, readOnly ? null : (v) {
                entry.isSoloParent = v;
                onChanged();
              }),
              _flag('Indigenous', entry.isIndigenousPerson, readOnly ? null : (v) {
                entry.isIndigenousPerson = v;
                onChanged();
              }),
              _flag('4Ps', entry.is4psBeneficiary, readOnly ? null : (v) {
                entry.is4psBeneficiary = v;
                onChanged();
              }),
            ],
          ),
          if (entry.isPwd) ...[
            const SizedBox(height: 8),
            TextField(
              controller: entry.pwdTypeController,
              enabled: !readOnly,
              decoration: const InputDecoration(
                labelText: 'PWD Type *',
                isDense: true,
                hintText: 'e.g. Visual, Hearing, Mobility',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _flag(String label, bool value, ValueChanged<bool>? onSet) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 11)),
      selected: value,
      onSelected: onSet,
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Wraps the picker's result so "user picked 'Not assigned' (null
/// center)" is distinguishable from "user dismissed the sheet without
/// choosing anything" (a bare `null` pop result).
class _CenterPickerResult {
  final EvacuationCenter? center;

  const _CenterPickerResult(this.center);
}

/// Searchable bottom sheet for picking an evacuation center out of ALL
/// barangays -- a plain dropdown doesn't scale once centers aren't
/// restricted to the registering staff's own barangay, and centers can
/// share similar names across different barangays, so each row shows the
/// barangay as a subtitle to disambiguate at a glance.
class _CenterPickerSheet extends StatefulWidget {
  final List<EvacuationCenter> centers;
  final EvacuationCenter? current;

  const _CenterPickerSheet({required this.centers, required this.current});

  @override
  State<_CenterPickerSheet> createState() => _CenterPickerSheetState();
}

class _CenterPickerSheetState extends State<_CenterPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final filtered = query.isEmpty
        ? widget.centers
        : widget.centers.where((c) {
            final name = c.name.toLowerCase();
            final barangay = (c.barangay ?? '').toLowerCase();
            return name.contains(query) || barangay.contains(query);
          }).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Select Evacuation Center', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search by center or barangay name',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onChanged: (v) => setState(() => _query = v),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    // Always shown, regardless of the search filter -- a
                    // legitimate, unaffected state, not something being
                    // filtered away.
                    ListTile(
                      leading: const Icon(Icons.block_outlined),
                      title: const Text('Not assigned to a center'),
                      selected: widget.current == null,
                      onTap: () => Navigator.of(context).pop(const _CenterPickerResult(null)),
                    ),
                    const Divider(height: 1),
                    if (filtered.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'No centers match "${_searchController.text}".',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      )
                    else
                      for (final c in filtered)
                        ListTile(
                          title: Text(c.name),
                          subtitle: Text(c.barangay != null ? 'Brgy. ${c.barangay}' : 'No barangay on file'),
                          selected: widget.current?.id == c.id,
                          onTap: () => Navigator.of(context).pop(_CenterPickerResult(c)),
                        ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
