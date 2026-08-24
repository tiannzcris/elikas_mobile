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
  static const String baseUrl = 'https://e-likasligao.online/api/v1';

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

  /// Pushes one offline-captured family registration. Endpoint and
  /// request body confirmed directly against the backend's actual routes
  /// and controller (POST /families/register, NOT /families -- that path
  /// is GET-only) -- not a guess.
  Future<void> createFamily(String token, Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/families/register'),
      headers: _authHeaders(token),
      body: jsonEncode(payload),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to submit family (HTTP ${response.statusCode}): ${response.body}');
    }
  }

  /// Confirmed against the actual EvacuationEventController: this
  /// endpoint deliberately returns ALL events (active AND closed), since
  /// it also feeds DROMIC reports/predictive analytics which need the
  /// closed ones. The registration form's picker filters to
  /// status != 'closed' client-side -- same as the web dashboard already
  /// does -- rather than expecting the server to filter this for us.
  Future<List<dynamic>> getEvacuationEvents(String token) async {
    final response = await http.get(Uri.parse('$baseUrl/evacuation-events'), headers: _authHeaders(token));
    _throwIfNotOk(response, 'evacuation events');
    return _extractList(jsonDecode(response.body));
  }

  /// One page of GET /api/v1/families -- confirmed against the real
  /// FamilyResource/index() scoping: barangay_official accounts are
  /// auto-scoped server-side to their own barangay (no param needed or
  /// useful), CSWD/admin get everything unless they pass barangay_id
  /// themselves. There's no server-side ?search=, so duplicate-detection
  /// filters client-side against whatever's been synced. Pagination
  /// envelope shape is handled defensively by _extractList either way.
  Future<List<dynamic>> getFamilies(String token, {required int page, int perPage = 100}) async {
    final uri = Uri.parse('$baseUrl/families').replace(
      queryParameters: {'page': '$page', 'per_page': '$perPage'},
    );
    final response = await http.get(uri, headers: _authHeaders(token));
    _throwIfNotOk(response, 'families');
    return _extractList(jsonDecode(response.body));
  }

  /// Staff-mode login against the SAME /auth/login endpoint the web
  /// dashboard and desktop app already use (Sanctum token auth). The
  /// exact response shape hasn't been verified against a live backend yet
  /// (it was unreachable from this dev sandbox while this was written) --
  /// this parses defensively across the shapes Laravel Sanctum commonly
  /// returns and throws with the raw body on anything unexpected, so a
  /// live test on-device immediately surfaces the real shape if this
  /// guess is wrong.
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode != 200) {
      throw Exception('Login failed (HTTP ${response.statusCode}): ${response.body}');
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final data = (body['data'] as Map<String, dynamic>?) ?? body;

    final token = data['token'] ?? data['access_token'] ?? body['token'] ?? body['access_token'];
    if (token == null) {
      throw Exception('Login succeeded but no token found in response: ${response.body}');
    }

    final user = (data['user'] as Map<String, dynamic>?) ?? (body['user'] as Map<String, dynamic>?);
    return {
      'token': token as String,
      'userId': user?['id'] as int?,
      'name': _extractLabel(user?['name']),
      'role': _extractLabel(user?['role']),
      'barangay': _extractLabel(user?['barangay']),
    };
  }

  /// Staff-authenticated list -- NOT the same as the public
  /// /public/evacuation-centers endpoint this app also calls. This one
  /// (confirmed to exist alongside the create/update endpoints at the
  /// same non-public path) returns the richer EvacuationCenterResource
  /// with creator info loaded, which "My Evacuation Centers" needs to
  /// filter by created_by. Shape not verified live yet -- parsed
  /// defensively, same pattern as every other endpoint here.
  Future<List<dynamic>> getMyEvacuationCenters(String token) async {
    final response = await http.get(Uri.parse('$baseUrl/evacuation-centers'), headers: _authHeaders(token));
    _throwIfNotOk(response, 'evacuation centers');
    return _extractList(jsonDecode(response.body));
  }

  /// Barangays for the registration form's dropdown -- real backend data
  /// (GET /barangays, staff-authenticated), not a hand-maintained list.
  /// Shape hasn't been verified live yet; parses defensively across a
  /// bare array, {data: [...]}, and Laravel's paginated {data: {data:
  /// [...]}} shape (alerts already confirmed the API uses that shape
  /// elsewhere), so this doesn't need a second guess-and-fix round trip.
  Future<List<dynamic>> getBarangays(String token) async {
    final response = await http.get(Uri.parse('$baseUrl/barangays'), headers: _authHeaders(token));
    _throwIfNotOk(response, 'barangays');
    return _extractList(jsonDecode(response.body));
  }

  /// Create/edit are online-only (no offline queue, unlike family
  /// registration), so both go straight to the server. multipart/form-data
  /// is required because the photo field is a real file upload, not
  /// base64 -- confirmed against the actual StoreEvacuationCenterRequest.
  /// `fields` should already have every value stringified and should
  /// OMIT any key you don't want sent at all (PATCH is a true partial
  /// update server-side: an omitted field is left untouched, not cleared
  /// -- so don't send e.g. an empty "photo" to mean "no change", just
  /// don't include it).
  Future<Map<String, dynamic>> createEvacuationCenter(
    String token,
    Map<String, String> fields, {
    String? photoPath,
  }) {
    return _sendEvacuationCenterMultipart('POST', '$baseUrl/evacuation-centers', token, fields, photoPath);
  }

  Future<Map<String, dynamic>> updateEvacuationCenter(
    String token,
    int id,
    Map<String, String> fields, {
    String? photoPath,
  }) {
    return _sendEvacuationCenterMultipart('PATCH', '$baseUrl/evacuation-centers/$id', token, fields, photoPath);
  }

  Future<Map<String, dynamic>> _sendEvacuationCenterMultipart(
    String method,
    String url,
    String token,
    Map<String, String> fields,
    String? photoPath,
  ) async {
    final request = http.MultipartRequest(method, Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';
    request.fields.addAll(fields);
    if (photoPath != null) {
      request.files.add(await http.MultipartFile.fromPath('photo', photoPath));
    }

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to save evacuation center (HTTP ${response.statusCode}): ${response.body}');
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Map<String, String> _authHeaders(String token) => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

  List<dynamic> _extractList(dynamic decoded) {
    if (decoded is List) return decoded;
    if (decoded is Map<String, dynamic>) {
      final data = decoded['data'];
      if (data is List) return data;
      if (data is Map<String, dynamic> && data['data'] is List) return data['data'] as List<dynamic>;
    }
    throw Exception('Unexpected list response shape: $decoded');
  }

  /// The live login response returns role/barangay as nested objects
  /// (e.g. {"id": 1, "name": "..."}), not plain strings as first guessed --
  /// confirmed by a real on-device login attempt. Handles both shapes so
  /// this doesn't crash again if a field's shape differs by account type.
  String? _extractLabel(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map<String, dynamic>) {
      final label = value['name'] ?? value['role'] ?? value['title'] ?? value['label'];
      return label?.toString();
    }
    return value.toString();
  }

  void _throwIfNotOk(http.Response response, String what) {
    if (response.statusCode != 200) {
      throw Exception('Failed to load $what (HTTP ${response.statusCode}): ${response.body}');
    }
  }
}
