import 'dart:math';

/// Great-circle distance in kilometers -- used to show "X km away" and to
/// find the nearest cached center client-side, without needing a network
/// round-trip to /public/evacuation-centers/nearest.
double distanceKm(double lat1, double lon1, double lat2, double lon2) {
  const earthRadiusKm = 6371.0;
  final dLat = _deg2rad(lat2 - lat1);
  final dLon = _deg2rad(lon2 - lon1);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadiusKm * c;
}

double _deg2rad(double deg) => deg * (pi / 180);
