import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../core/center_status.dart';
import '../../core/geo.dart';
import '../../database/database.dart';
import '../../providers/core_providers.dart';
import '../evacuation_centers/evacuation_center_details_screen.dart';

/// Fallback center point (Ligao City, Albay) used until either real cached
/// centers or the user's own location are available -- never a randomly
/// picked coordinate.
const _fallbackCenter = LatLng(13.19, 123.53);

const _hazardColors = {
  'flood': Colors.blue,
  'landslide': Colors.brown,
  'coastal_inundation': Colors.purple,
  'fire': Colors.deepOrange,
  'earthquake': Colors.grey,
};

Color _hazardColor(String type) => _hazardColors[type] ?? Colors.orange;

final _showCentersProvider = StateProvider<bool>((ref) => true);
final _showHazardsProvider = StateProvider<bool>((ref) => true);

class GisMapScreen extends ConsumerStatefulWidget {
  const GisMapScreen({super.key});

  @override
  ConsumerState<GisMapScreen> createState() => _GisMapScreenState();
}

class _GisMapScreenState extends ConsumerState<GisMapScreen> {
  final MapController _mapController = MapController();
  Position? _userPosition;
  bool _locating = false;

  Future<void> _locateMe() async {
    setState(() => _locating = true);
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied.')),
          );
        }
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );
      setState(() => _userPosition = pos);
      _mapController.move(LatLng(pos.latitude, pos.longitude), 14);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not get location: $e')));
      }
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  void _openLayersSheet(List<String> hazardTypes) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Consumer(
          builder: (ctx, ref, _) {
            final showCenters = ref.watch(_showCentersProvider);
            final showHazards = ref.watch(_showHazardsProvider);
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Map Layers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Evacuation Centers'),
                      value: showCenters,
                      onChanged: (v) => ref.read(_showCentersProvider.notifier).state = v,
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(hazardTypes.isEmpty ? 'Hazard Areas (none cached yet)' : 'Hazard Areas'),
                      value: showHazards,
                      onChanged: hazardTypes.isEmpty ? null : (v) => ref.read(_showHazardsProvider.notifier).state = v,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final centersAsync = ref.watch(evacuationCentersProvider);
    final hazardsAsync = ref.watch(hazardAreasProvider);
    final isOnline = ref.watch(isOnlineProvider).asData?.value ?? true;
    final showCenters = ref.watch(_showCentersProvider);
    final showHazards = ref.watch(_showHazardsProvider);

    final centers = centersAsync.asData?.value ?? const <EvacuationCenter>[];
    final hazards = hazardsAsync.asData?.value ?? const <HazardArea>[];
    final hazardTypes = hazards.map((h) => h.hazardType).toSet().toList();

    final initialCenter = _userPosition != null
        ? LatLng(_userPosition!.latitude, _userPosition!.longitude)
        : (centers.isNotEmpty ? LatLng(centers.first.latitude, centers.first.longitude) : _fallbackCenter);

    EvacuationCenter? nearest;
    double? nearestDistance;
    if (_userPosition != null && centers.isNotEmpty) {
      for (final c in centers) {
        final d = distanceKm(_userPosition!.latitude, _userPosition!.longitude, c.latitude, c.longitude);
        if (nearestDistance == null || d < nearestDistance) {
          nearestDistance = d;
          nearest = c;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('GIS Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.layers_outlined),
            onPressed: () => _openLayersSheet(hazardTypes),
          ),
        ],
      ),
      body: Column(
        children: [
          if (!isOnline)
            Container(
              width: double.infinity,
              color: Colors.blue.shade50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.cloud_off, color: Colors.blue.shade700, size: 16),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "You're offline — pins are cached, but map tiles need a connection.",
                      style: TextStyle(fontSize: 11.5),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(initialCenter: initialCenter, initialZoom: 13),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.elikas_mobile',
                    ),
                    if (showHazards)
                      PolygonLayer(polygons: [
                        for (final h in hazards)
                          for (final ring in _ringsFromGeoJson(h.geoJsonGeometry))
                            Polygon(
                              points: ring,
                              color: _hazardColor(h.hazardType).withValues(alpha: 0.25),
                              borderColor: _hazardColor(h.hazardType),
                              borderStrokeWidth: 2,
                            ),
                      ]),
                    if (showCenters)
                      MarkerLayer(markers: [
                        for (final c in centers)
                          Marker(
                            point: LatLng(c.latitude, c.longitude),
                            width: 36,
                            height: 36,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => EvacuationCenterDetailsScreen(
                                    center: c,
                                    userLatitude: _userPosition?.latitude,
                                    userLongitude: _userPosition?.longitude,
                                  ),
                                ),
                              ),
                              child: Icon(Icons.location_on, color: centerStatusColor(c.status), size: 36),
                            ),
                          ),
                      ]),
                    if (_userPosition != null)
                      MarkerLayer(markers: [
                        Marker(
                          point: LatLng(_userPosition!.latitude, _userPosition!.longitude),
                          width: 20,
                          height: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                          ),
                        ),
                      ]),
                  ],
                ),
                Positioned(
                  right: 12,
                  bottom: 12,
                  child: FloatingActionButton.small(
                    heroTag: 'locate-me',
                    onPressed: _locating ? null : _locateMe,
                    child: _locating
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          ),
          if (nearest != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EvacuationCenterDetailsScreen(
                      center: nearest!,
                      userLatitude: _userPosition?.latitude,
                      userLongitude: _userPosition?.longitude,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.near_me_outlined, color: centerStatusColor(nearest.status)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nearest: ${nearest.name}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          Text('${nearestDistance!.toStringAsFixed(1)} km away · ${centerStatusLabel(nearest.status)}',
                              style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Parses a cached GeoJSON geometry string into a list of polygon rings
/// (outer boundary only -- holes are ignored, not material for a hazard
/// overview map). Handles both Polygon and MultiPolygon since the backend
/// doesn't guarantee only one shape type.
List<List<LatLng>> _ringsFromGeoJson(String geoJson) {
  final geometry = jsonDecode(geoJson) as Map<String, dynamic>;
  final type = geometry['type'] as String;
  final coords = geometry['coordinates'];

  List<LatLng> ringToLatLng(List<dynamic> ring) {
    return ring.map((pt) {
      final p = pt as List<dynamic>;
      return LatLng((p[1] as num).toDouble(), (p[0] as num).toDouble());
    }).toList();
  }

  if (type == 'Polygon') {
    final rings = coords as List<dynamic>;
    if (rings.isEmpty) return [];
    return [ringToLatLng(rings.first as List<dynamic>)];
  }
  if (type == 'MultiPolygon') {
    final polygons = coords as List<dynamic>;
    return [
      for (final poly in polygons)
        if ((poly as List<dynamic>).isNotEmpty) ringToLatLng(poly.first as List<dynamic>),
    ];
  }
  return [];
}
