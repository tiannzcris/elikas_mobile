import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const _fallbackCenter = LatLng(13.19, 123.53);

/// Minimal tap-to-place-a-marker picker -- deliberately NOT the full GIS
/// Map screen (no hazard layers, no evacuation-center markers to manage
/// here); this only needs to answer one question: where is this center.
class LocationPickerScreen extends StatefulWidget {
  final LatLng? initial;

  const LocationPickerScreen({super.key, this.initial});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  LatLng? _picked;

  @override
  void initState() {
    super.initState();
    _picked = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Location'),
        actions: [
          TextButton(
            onPressed: _picked == null ? null : () => Navigator.of(context).pop(_picked),
            child: const Text('Confirm'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.blue.shade50,
            child: const Text(
              'Tap anywhere on the map to place the marker.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: widget.initial ?? _fallbackCenter,
                initialZoom: 13,
                onTap: (tapPosition, point) => setState(() => _picked = point),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.elikas_mobile',
                ),
                if (_picked != null)
                  MarkerLayer(markers: [
                    Marker(
                      point: _picked!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                  ]),
              ],
            ),
          ),
          if (_picked != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Text(
                '${_picked!.latitude.toStringAsFixed(5)}, ${_picked!.longitude.toStringAsFixed(5)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
