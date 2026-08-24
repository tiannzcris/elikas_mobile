import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/center_status.dart';
import '../../core/geo.dart';
import '../../database/database.dart';
import '../../providers/auth_providers.dart';
import '../staff/evacuation_center_form/evacuation_center_form_screen.dart';

/// Deliberately omits a Facilities section and Contact Information --
/// verified against the live /public/evacuation-centers response, neither
/// facilities nor a contact person/phone are actually returned by the
/// backend today (no per-center detail endpoint exists either), so this
/// doesn't invent fields the API doesn't send.
class EvacuationCenterDetailsScreen extends ConsumerWidget {
  final EvacuationCenter center;
  final double? userLatitude;
  final double? userLongitude;

  const EvacuationCenterDetailsScreen({
    super.key,
    required this.center,
    this.userLatitude,
    this.userLongitude,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = centerStatusColor(center.status);
    final hasLocation = center.latitude != null && center.longitude != null;
    final distance = (userLatitude != null && userLongitude != null && hasLocation)
        ? distanceKm(userLatitude!, userLongitude!, center.latitude!, center.longitude!)
        : null;
    final isStaffLoggedIn = ref.watch(staffAuthProvider).isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Evacuation Center Details'),
        actions: [
          if (isStaffLoggedIn)
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Edit (only works if you created this center)',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => EvacuationCenterFormScreen(existing: center)),
              ),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(center.name,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Text(centerStatusLabel(center.status),
                          style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '${center.address}${center.barangay != null ? ' · Brgy. ${center.barangay}' : ''}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12.5),
                ),
                if (distance != null) ...[
                  const SizedBox(height: 4),
                  Text('${distance.toStringAsFixed(1)} km away', style: const TextStyle(color: Colors.white70, fontSize: 12.5)),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _StatBox(label: 'Capacity', value: center.capacityPersons?.toString() ?? '—')),
              Expanded(child: _StatBox(label: 'Occupancy', value: center.currentOccupancy?.toString() ?? '—')),
              Expanded(
                child: _StatBox(
                  label: 'Available',
                  value: (center.capacityPersons != null)
                      ? '${(center.capacityPersons! - (center.currentOccupancy ?? 0)).clamp(0, center.capacityPersons!)}'
                      : '—',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          _DetailRow(label: 'Type', value: center.type),
          _DetailRow(label: 'Address', value: center.address),
          if (center.barangay != null) _DetailRow(label: 'Barangay', value: center.barangay!),
          if (hasLocation)
            _DetailRow(label: 'Coordinates', value: '${center.latitude!.toStringAsFixed(5)}, ${center.longitude!.toStringAsFixed(5)}'),
          const SizedBox(height: 16),
          if (hasLocation)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _openDirections(center.latitude!, center.longitude!),
                    icon: const Icon(Icons.directions_outlined),
                    label: const Text('Get Directions'),
                  ),
                ),
              ],
            )
          else
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Icon(Icons.location_off_outlined, size: 18, color: Colors.amber.shade800),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text('No map location set for this center yet.', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Facility list and on-site contact details aren\'t provided by the backend '
                    'yet, so they\'re not shown here.',
                    style: TextStyle(fontSize: 11.5, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openDirections(double lat, double lng) async {
    final uri = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 110, child: Text(label, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
