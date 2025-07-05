import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final String baseUrl =
      'https://appbackend-1-wpge.onrender.com'; // Change to your API base URL

  // Signup method
  Future<Map<String, dynamic>> register({
    required String fullName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/register');
    // print('Register API URL: $url');
    // print('Register Payload: ${jsonEncode({
    //   'fullName': fullName,
    //   'mobile': mobile,
    //   'email': email,
    //   'password': password,
    // })}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName,
        'mobile': mobile,
        'email': email,
        'password': password,
      }),
    );
    // print('Register Status Code: ${response.statusCode}');
    // print('Register Response Body: ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {'success': true, 'data': jsonDecode(response.body)};
    } else {
      return {'success': false, 'message': response.body};
    }
  }

  // Login method
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/login');
    // print('Login API URL: $url');
    // print('Login Payload: ${jsonEncode({'email': email, 'password': password})}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    // print('Login Status Code: ${response.statusCode}');
    // print('Login Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return {'success': true, 'data': jsonDecode(response.body)};
    } else {
      return {'success': false, 'message': response.body};
    }
  }
}
