import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:janta_sewa/data/network/base_api_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkApiServices extends BaseApiServices {
  final _storage = const FlutterSecureStorage(); // secure storage
  String? _authToken; // in-memory token

  NetworkApiServices() {
    // Defer loading stored token/cookies to avoid platform channel on sync init
    Future.microtask(() async {
      try {
        await _loadToken();
        await _loadCookies(); // optional: keep if you persist cookies too
      } catch (e) {
        if (kDebugMode) print('Init load error: $e');
      }
    });
  }

  // Save token securely and keep in-memory
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: 'token', value: token);
      _authToken = token;
      if (kDebugMode) print('Token saved');
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

  // Optional cookie persistence (kept for compatibility)
  Future<void> _loadCookies() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? savedCookies = prefs.getStringList('cookies');
      if (savedCookies != null && savedCookies.isNotEmpty) {
        if (kDebugMode) print('Loaded ${savedCookies.length} saved cookies');
      }
    } catch (e) {
      if (kDebugMode) print('Error loading saved cookies: $e');
    }
  }

  Future<void> _saveCookies(List<String> cookiesStrings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('cookies', cookiesStrings);
    } catch (e) {
      if (kDebugMode) print('Failed to persist cookies: $e');
    }
  }

  // Helper: attach Authorization header if token exists
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

  // Merge headers: defaults + provided (provided overrides defaults)
  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    final merged = Map<String, String>.from(_defaultHeaders());
    if (headers != null) merged.addAll(headers);
    return merged;
  }

  // Extract token from Set-Cookie header and persist it
  Future<void> _extractAndSaveTokenFromHeaders(
    Map<String, String> headers,
  ) async {
    try {
      final setCookie = headers['set-cookie'] ?? headers['Set-Cookie'];
      if (setCookie != null && setCookie.isNotEmpty) {
        // Find token=<value> before the next semicolon
        final reg = RegExp(r'token=([^;]+)', caseSensitive: false);
        final match = reg.firstMatch(setCookie);
        if (match != null && match.groupCount >= 1) {
          final token = match.group(1);
          if (token != null && token.isNotEmpty) {
            await saveToken(token);
          }
        }
        // Persist raw cookie header
        await _saveCookies([setCookie]);
      }
    } catch (e) {
      if (kDebugMode) print('Failed to extract/save token from headers: $e');
    }
  }

  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) print('GET $url');
    try {
      final response = await http
          .get(Uri.parse(url), headers: _mergeHeaders(headers))
          .timeout(const Duration(seconds: 30));
      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } on SocketException {
      if (kDebugMode) print('getApi - No internet');
      return {
        'success': false,
        'status': null,
        'message': 'No internet connection',
      };
    } on TimeoutException {
      if (kDebugMode) print('getApi - Timeout');
      return {'success': false, 'status': null, 'message': 'Request timed out'};
    } catch (e) {
      if (kDebugMode) print('getApi error: $e');
      return {'success': false, 'status': null, 'message': e.toString()};
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
      print(data);
    }
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: _mergeHeaders(headers),
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));
      await _extractAndSaveTokenFromHeaders(response.headers);
      return returnResponse(response);
    } on SocketException {
      if (kDebugMode) print('postApi - No internet');
      return {
        'success': false,
        'status': null,
        'message': 'No internet connection',
      };
    } on TimeoutException {
      if (kDebugMode) print('postApi - Timeout');
      return {'success': false, 'status': null, 'message': 'Request timed out'};
    } catch (e) {
      if (kDebugMode) print('postApi error: $e');
      return {'success': false, 'status': null, 'message': e.toString()};
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
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http
          .put(
            Uri.parse(url),
            headers: _mergeHeaders(headers),
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));
      await _extractAndSaveTokenFromHeaders(response.headers);
      responseJson = returnResponse(response);
    } on SocketException {
      if (kDebugMode) print('putApi - No internet');
      return {
        'success': false,
        'status': null,
        'message': 'No internet connection',
      };
    } on TimeoutException {
      if (kDebugMode) print('putApi - Timeout');
      return {'success': false, 'status': null, 'message': 'Request timed out'};
    } catch (e) {
      if (kDebugMode) print('putApi error: $e');
      return {'success': false, 'status': null, 'message': e.toString()};
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) print('DELETE $url');
    dynamic responseJson;
    try {
      final response = await http
          .delete(Uri.parse(url), headers: _mergeHeaders(headers))
          .timeout(const Duration(seconds: 30));
      await _extractAndSaveTokenFromHeaders(response.headers);
      responseJson = returnResponse(response);
    } on SocketException {
      if (kDebugMode) print('deleteApi - No internet');
      return {
        'success': false,
        'status': null,
        'message': 'No internet connection',
      };
    } on TimeoutException {
      if (kDebugMode) print('deleteApi - Timeout');
      return {'success': false, 'status': null, 'message': 'Request timed out'};
    } catch (e) {
      if (kDebugMode) print('deleteApi error: $e');
      return {'success': false, 'status': null, 'message': e.toString()};
    }
    return responseJson;
  }

  @override
  Future<dynamic> postMultipart(
    String url,
    Map<String, String> fields,
    List<PlatformFile> files, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);

      // ✅ merge headers, but remove content-type (auto handled)
      final mergedHeaders = _mergeHeaders(headers);
      mergedHeaders.remove('Content-Type');
      request.headers.addAll(mergedHeaders);

      // ✅ add form fields
      request.fields.addAll(fields);

      // ✅ add multiple files
      for (var file in files) {
        if (file.path != null && file.path!.isNotEmpty) {
          final mimeType = lookupMimeType(file.path!)?.split('/');
          final multipartFile = await http.MultipartFile.fromPath(
            'files', // 👈 must match backend multer field name
            file.path!,
            filename: file.name,
            contentType: mimeType != null
                ? MediaType(mimeType[0], mimeType[1])
                : MediaType('application', 'octet-stream'),
          );
          request.files.add(multipartFile);
          if (kDebugMode) {
            print(
              '📤 Added file: ${file.name} (${lookupMimeType(file.path!)})',
            );
          }
        }
      }

      // ✅ send request
      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 120),
      );

      final response = await http.Response.fromStream(streamedResponse);
      return returnResponse(response);
    } on SocketException {
      if (kDebugMode) print('postMultipart - No internet');
      return {
        'success': false,
        'status': null,
        'message': 'No internet connection',
      };
    } on TimeoutException {
      if (kDebugMode) print('postMultipart - Timeout');
      return {'success': false, 'status': null, 'message': 'Request timed out'};
    } catch (e) {
      if (kDebugMode) print('postMultipart error: $e');
      return {'success': false, 'status': null, 'message': e.toString()};
    }
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print('status: ${response.statusCode}, body: ${response.body}');
    }
    final int status = response.statusCode;
    final String bodyStr = response.body ?? '';
    dynamic decodedBody;
    try {
      decodedBody = bodyStr.isNotEmpty ? jsonDecode(bodyStr) : null;
    } catch (e) {
      decodedBody = bodyStr;
    }

    if (status == 200 || status == 201) {
      return decodedBody ?? {'success': true, 'status': status};
    }

    // For any non-2xx return a normalized map instead of throwing
    String message = 'Request failed';
    if (decodedBody is Map) {
      message =
          decodedBody['message']?.toString() ??
          decodedBody['error']?.toString() ??
          decodedBody.toString();
    } else if (decodedBody is String && decodedBody.isNotEmpty) {
      message = decodedBody;
    } else {
      message = 'Server returned status $status';
    }

    return {
      'success': false,
      'status': status,
      'message': message,
      'body': decodedBody,
    };
  }
}
