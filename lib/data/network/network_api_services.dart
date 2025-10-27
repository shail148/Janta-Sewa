import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:janta_sewa/data/network/base_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkApiServices extends BaseApiServices {
  final _storage = const FlutterSecureStorage();
  String? _authToken;

  NetworkApiServices();

  /// Must be called once before first API call
  Future<void> initialize() async {
    try {
      await _loadToken();
      await _loadCookies();
    } catch (e) {
      if (kDebugMode) print('Init load error: $e');
    }
  }

  // --------------------------------------------------------------------------
  // 🔐 TOKEN MANAGEMENT
  // --------------------------------------------------------------------------
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: 'token', value: token);
      _authToken = token;
      if (kDebugMode) print('Token saved successfully');
    } catch (e) {
      if (kDebugMode) print('Failed to save token: $e');
    }
  }

  Future<void> _loadToken() async {
    try {
      _authToken = await _storage.read(key: 'token');
      if (kDebugMode) print('Loaded token: ${_authToken != null}');
    } catch (e) {
      if (kDebugMode) print('Failed to load token: $e');
      _authToken = null;
    }
  }

  Future<void> _loadCookies() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? savedCookies = prefs.getStringList('cookies');
      if (savedCookies != null && savedCookies.isNotEmpty) {
        if (kDebugMode) print('Loaded ${savedCookies.length} cookies');
      }
    } catch (e) {
      if (kDebugMode) print('Error loading cookies: $e');
    }
  }

  Future<void> _saveCookies(List<String> cookiesStrings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('cookies', cookiesStrings);
    } catch (e) {
      if (kDebugMode) print('Failed to save cookies: $e');
    }
  }

  // --------------------------------------------------------------------------
  // 🧩 HEADER HELPERS
  // --------------------------------------------------------------------------
  Map<String, String> _defaultHeaders() {
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    if (_authToken != null && _authToken!.isNotEmpty) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    final merged = Map<String, String>.from(_defaultHeaders());
    if (headers != null) merged.addAll(headers);
    return merged;
  }

  Future<void> _extractAndSaveTokenFromHeaders(
    Map<String, String> headers,
  ) async {
    try {
      final setCookie = headers['set-cookie'] ?? headers['Set-Cookie'];
      if (setCookie != null && setCookie.isNotEmpty) {
        final reg = RegExp(r'token=([^;]+)', caseSensitive: false);
        final match = reg.firstMatch(setCookie);
        if (match != null && match.groupCount >= 1) {
          final token = match.group(1);
          if (token != null && token.isNotEmpty) {
            await saveToken(token);
          }
        }
        await _saveCookies([setCookie]);
      }
    } catch (e) {
      if (kDebugMode) print('Failed to extract token: $e');
    }
  }

  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) print('GET $url');
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _mergeHeaders(headers),
      );

      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } catch (e) {
      return _handleError(e, 'GET');
    }
  }

  @override
  Future<dynamic> postApi(
    String url,
    var data, {
    Map<String, String>? headers,
  }) async {
    if (kDebugMode) {
      print('POST $url');
      print('📦 $data');
    }
    try {
      // ✅ Use IOClient to prevent SSL hang issues
      final ioClient = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;
      final client = IOClient(ioClient);
      print("🟢 Sending POST request...");
      final response = await client.post(
        Uri.parse(url),
        headers: _mergeHeaders(headers),
        body: jsonEncode(data),
      );
      print("🟢 Response received (${response.statusCode})");

      client.close();

      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } catch (e) {
      return _handleError(e, 'POST');
    }
  }

  @override
  Future<dynamic> putApi(
    String url,
    var data, {
    Map<String, String>? headers,
  }) async {
    if (kDebugMode) {
      print('PUT $url');
      print('📦 $data');
    }
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: _mergeHeaders(headers),
        body: jsonEncode(data),
      );
      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } catch (e) {
      return _handleError(e, 'PUT');
    }
  }

  @override
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) print('DELETE $url');
    try {
      final response = await http
          .delete(Uri.parse(url), headers: _mergeHeaders(headers))
          .timeout(const Duration(seconds: 30));
      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } catch (e) {
      return _handleError(e, 'DELETE');
    }
  }

  // --------------------------------------------------------------------------
  // 📤 MULTIPART UPLOAD (FILES)
  // --------------------------------------------------------------------------
  Future<dynamic> postMultipart(
    String url,
    Map<String, String> fields,
    List<PlatformFile> files, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);
      final mergedHeaders = _mergeHeaders(headers);
      mergedHeaders.remove('Content-Type');
      request.headers.addAll(mergedHeaders);
      request.fields.addAll(fields);

      for (var file in files) {
        if (file.path != null && file.path!.isNotEmpty) {
          final mimeType = lookupMimeType(file.path!)?.split('/');
          final multipartFile = await http.MultipartFile.fromPath(
            'files',
            file.path!,
            filename: file.name,
            contentType: mimeType != null
                ? MediaType(mimeType[0], mimeType[1])
                : MediaType('application', 'octet-stream'),
          );
          request.files.add(multipartFile);
          if (kDebugMode) {
            print('📤 Added file: ${file.name}');
          }
        }
      }

      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 120),
      );
      final response = await http.Response.fromStream(streamedResponse);
      return returnResponse(response);
    } catch (e) {
      return _handleError(e, 'MULTIPART');
    }
  }

  // --------------------------------------------------------------------------
  // 🧱 RESPONSE HANDLER
  // --------------------------------------------------------------------------
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print('📨 Response: [${response.statusCode}] ${response.body}');
    }
    try {
      if (response.body.isEmpty) {
        return {
          'success': false,
          'status': response.statusCode,
          'message': 'Empty response body',
        };
      }

      final decoded = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return decoded;
      }

      String message = 'Request failed';
      if (decoded is Map) {
        message =
            decoded['message']?.toString() ??
            decoded['error']?.toString() ??
            'Unexpected error';
      }

      return {
        'success': false,
        'status': response.statusCode,
        'message': message,
        'body': decoded,
      };
    } catch (e) {
      if (kDebugMode) print('💥 returnResponse error: $e');
      return {
        'success': false,
        'status': response.statusCode,
        'message': 'Invalid JSON format or decode error',
      };
    }
  }

  // --------------------------------------------------------------------------
  // ⚠️ GENERIC ERROR HANDLER
  // --------------------------------------------------------------------------
  Map<String, dynamic> _handleError(Object e, String method) {
    if (e is SocketException) {
      if (kDebugMode) print('$method - No internet');
      return {'success': false, 'message': 'No internet connection'};
    } else if (e is TimeoutException) {
      if (kDebugMode) print('$method - Timeout');
      return {'success': false, 'message': 'Request timed out'};
    } else {
      if (kDebugMode) print('$method error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }
}
