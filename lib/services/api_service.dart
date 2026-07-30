import 'dart:convert';
import 'package:http/http.dart' as http;

/// Wraps every call to elikas-backend's public API -- none of these
/// endpoints need a login/token, matching Chapter 1's scope (residents use
/// this app with no account).
class ApiService {
  /// IMPORTANT: replace with the elikas-backend machine's actual local
  /// network IP address, NOT 127.0.0.1 -- this Flutter app runs on a
  /// separate laptop from the one running `php artisan serve`, so
  /// 127.0.0.1 would only ever point back at THIS device, not the server.
  /// Both machines need to be on the same Wi-Fi/network. Confirm Windows
  /// Firewall on the elikas-backend machine allows inbound connections on
  /// port 8000 too.
  static const String baseUrl = 'http://10.233.51.141:8000/api/v1';

  Future<List<dynamic>> getEvacuationCenters() async {
    final response = await http.get(Uri.parse('$baseUrl/public/evacuation-centers'));
    _throwIfNotOk(response, 'evacuation centers');
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['data'] as List<dynamic>;
  }

  Future<List<dynamic>> getNearestEvacuationCenters(double latitude, double longitude) async {
    final uri = Uri.parse('$baseUrl/public/evacuation-centers/nearest')
        .replace(queryParameters: {'latitude': '$latitude', 'longitude': '$longitude'});
    final response = await http.get(uri);
    _throwIfNotOk(response, 'nearest evacuation centers');
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['data'] as List<dynamic>;
  }

  /// Alerts come back paginated (Laravel's standard pagination shape),
  /// unlike the other endpoints -- confirmed against the actual
  /// PublicController code, not assumed. This is why the array is nested
  /// one level deeper here (data.data) than the other methods.
  Future<List<dynamic>> getAlerts() async {
    final response = await http.get(Uri.parse('$baseUrl/public/alerts'));
    _throwIfNotOk(response, 'alerts');
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['data']['data'] as List<dynamic>;
  }

  /// Returns the raw decoded map with two keys, confirmed directly against
  /// GisController's actual code: evacuation_centers and hazard_areas,
  /// each a GeoJSON FeatureCollection ({type, features}).
  Future<Map<String, dynamic>> getMapData() async {
    final response = await http.get(Uri.parse('$baseUrl/public/gis/map-data'));
    _throwIfNotOk(response, 'map data');
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['data'] as Map<String, dynamic>;
  }

  void _throwIfNotOk(http.Response response, String what) {
    if (response.statusCode != 200) {
      throw Exception('Failed to load $what (HTTP ${response.statusCode}): ${response.body}');
    }
  }
}
