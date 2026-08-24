import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import '../../../database/database.dart';
import '../../../providers/auth_providers.dart';
import '../../../providers/core_providers.dart';
import '../../../providers/registration_providers.dart';
import 'location_picker_screen.dart';

const _typeOptions = {
  'school': 'School',
  'covered_court': 'Covered Court',
  'church': 'Church',
  'barangay_hall': 'Barangay Hall',
  'gymnasium': 'Gymnasium',
  'other': 'Other',
};

const _statusOptions = {
  'active': 'Active',
  'on_standby': 'On Standby',
  'full': 'Full',
  'closed': 'Closed',
};

/// Online-only, unlike family registration -- no offline queue. Reuses
/// the real POST/PATCH /api/v1/evacuation-centers endpoints (confirmed
/// field names, multipart photo upload, and partial-update-on-PATCH
/// behavior directly against the actual FormRequest/controller code).
///
/// Editing only pre-fills what the PUBLIC cache actually has (name,
/// type, address, status, coordinates, capacity_persons) -- capacity_
/// families, camp manager info, and the existing photo aren't visible
/// through any endpoint this app calls, so they start blank on edit.
/// That's safe: fields left blank are simply omitted from the PATCH
/// request, and the backend's partial-update behavior leaves whatever
/// is already stored on those fields untouched.
class EvacuationCenterFormScreen extends ConsumerStatefulWidget {
  final EvacuationCenter? existing;

  const EvacuationCenterFormScreen({super.key, this.existing});

  @override
  ConsumerState<EvacuationCenterFormScreen> createState() => _EvacuationCenterFormScreenState();
}

class _EvacuationCenterFormScreenState extends ConsumerState<EvacuationCenterFormScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _capacityFamiliesController = TextEditingController();
  final _capacityPersonsController = TextEditingController();
  final _campManagerNameController = TextEditingController();
  final _campManagerContactController = TextEditingController();

  Barangay? _selectedBarangay;
  String _type = 'other';
  String _status = 'on_standby';
  LatLng? _location;
  String? _photoPath;

  bool _submitting = false;
  String? _formError;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    if (existing != null) {
      _nameController.text = existing.name;
      _addressController.text = existing.address;
      _type = _typeOptions.containsKey(existing.type) ? existing.type : 'other';
      _status = _statusOptions.containsKey(existing.status) ? existing.status : 'on_standby';
      if (existing.capacityPersons != null) _capacityPersonsController.text = '${existing.capacityPersons}';
      if (existing.latitude != null && existing.longitude != null) {
        _location = LatLng(existing.latitude!, existing.longitude!);
      }
      if (existing.barangay != null) {
        final list = ref.read(barangaysProvider).asData?.value ?? const <Barangay>[];
        for (final b in list) {
          if (b.name == existing.barangay) _selectedBarangay = b;
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _capacityFamiliesController.dispose();
    _capacityPersonsController.dispose();
    _campManagerNameController.dispose();
    _campManagerContactController.dispose();
    super.dispose();
  }

  Future<void> _pickLocation() async {
    final picked = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(builder: (_) => LocationPickerScreen(initial: _location)),
    );
    if (picked != null) setState(() => _location = picked);
  }

  Future<void> _pickPhoto() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 1600, imageQuality: 85);
    if (picked != null) setState(() => _photoPath = picked.path);
  }

  String? _validate() {
    if (_nameController.text.trim().isEmpty) return 'Enter the center\'s name.';
    if (_addressController.text.trim().isEmpty) return 'Enter the center\'s address.';
    if (_selectedBarangay == null) return 'Select the barangay.';
    return null;
  }

  Future<void> _submit() async {
    final error = _validate();
    if (error != null) {
      setState(() => _formError = error);
      return;
    }
    setState(() {
      _formError = null;
      _submitting = true;
    });

    final fields = <String, String>{
      'barangay_id': '${_selectedBarangay!.id}',
      'name': _nameController.text.trim(),
      'type': _type,
      'address': _addressController.text.trim(),
      'status': _status,
    };
    if (_location != null) {
      fields['latitude'] = '${_location!.latitude}';
      fields['longitude'] = '${_location!.longitude}';
    }
    if (_capacityFamiliesController.text.trim().isNotEmpty) {
      fields['capacity_families'] = _capacityFamiliesController.text.trim();
    }
    if (_capacityPersonsController.text.trim().isNotEmpty) {
      fields['capacity_persons'] = _capacityPersonsController.text.trim();
    }
    if (_campManagerNameController.text.trim().isNotEmpty) {
      fields['camp_manager_name'] = _campManagerNameController.text.trim();
    }
    if (_campManagerContactController.text.trim().isNotEmpty) {
      fields['camp_manager_contact'] = _campManagerContactController.text.trim();
    }

    try {
      final api = ref.read(apiServiceProvider);
      final token = ref.read(staffAuthProvider).session!.token;
      if (_isEditing) {
        await api.updateEvacuationCenter(token, widget.existing!.id, fields, photoPath: _photoPath);
      } else {
        await api.createEvacuationCenter(token, fields, photoPath: _photoPath);
      }
      // Refresh the public cache so the GIS map and the registration
      // form's center picker reflect this change immediately.
      await ref.read(syncServiceProvider).syncEvacuationCenters();

      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(_isEditing ? 'Center Updated' : 'Center Created'),
          content: Text(_isEditing
              ? 'Changes have been saved to the server.'
              : 'The new evacuation center has been saved to the server.'),
          actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK'))],
        ),
      );
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _formError = e.toString());
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;
    final barangaysAsync = ref.watch(barangaysProvider);

    if (!isOnline) {
      return Scaffold(
        appBar: AppBar(title: Text(_isEditing ? 'Edit Evacuation Center' : 'Add Evacuation Center')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.cloud_off, size: 40, color: Colors.grey.shade400),
                const SizedBox(height: 12),
                Text(
                  'This needs an internet connection. Unlike family registration, evacuation centers '
                  'aren\'t queued for later -- connect and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Edit Evacuation Center' : 'Add Evacuation Center')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_isEditing)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'You can only edit centers you created -- editing someone else\'s center will be rejected by the server. '
                'Camp manager info and the existing photo aren\'t shown here; leaving them blank keeps whatever is already saved.',
                style: TextStyle(fontSize: 11.5),
              ),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name *', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _type,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Type *', border: OutlineInputBorder()),
            items: _typeOptions.entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
            onChanged: (v) => setState(() => _type = v ?? _type),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Address *', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          barangaysAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Text('Could not load barangays: $e', style: const TextStyle(color: Colors.red, fontSize: 12)),
            data: (barangays) => DropdownButtonFormField<Barangay>(
              initialValue: _selectedBarangay,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Barangay *', border: OutlineInputBorder()),
              items: barangays.map((b) => DropdownMenuItem(value: b, child: Text(b.name))).toList(),
              onChanged: (v) => setState(() => _selectedBarangay = v),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'For barangay officials, the server always uses your own barangay regardless of this selection.',
              style: TextStyle(fontSize: 10.5, color: Colors.grey.shade500),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _status,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Status *', border: OutlineInputBorder()),
            items: _statusOptions.entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _capacityFamiliesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Capacity (families)', border: OutlineInputBorder(), isDense: true),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _capacityPersonsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Capacity (persons)', border: OutlineInputBorder(), isDense: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _campManagerNameController,
            decoration: const InputDecoration(labelText: 'Camp Manager Name (optional)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _campManagerContactController,
            decoration: const InputDecoration(labelText: 'Camp Manager Contact (optional)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: _pickLocation,
            child: InputDecorator(
              decoration: const InputDecoration(labelText: 'Location (optional)', border: OutlineInputBorder()),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _location == null
                          ? 'Not set'
                          : '${_location!.latitude.toStringAsFixed(5)}, ${_location!.longitude.toStringAsFixed(5)}',
                      style: _location == null ? TextStyle(color: Colors.grey.shade600) : null,
                    ),
                  ),
                  const Icon(Icons.map_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: _pickPhoto,
            icon: const Icon(Icons.photo_outlined),
            label: Text(_photoPath == null ? 'Add Photo (optional)' : 'Change Photo'),
          ),
          if (_photoPath != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(File(_photoPath!), height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
          ],
          const SizedBox(height: 16),
          if (_formError != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
              child: Text(_formError!, style: TextStyle(color: Colors.red.shade800, fontSize: 12)),
            ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _submitting ? null : _submit,
            style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
            child: _submitting
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : Text(_isEditing ? 'Save Changes' : 'Create Center'),
          ),
        ],
      ),
    );
  }
}
