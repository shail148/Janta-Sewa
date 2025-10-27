import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/models/login/login_with_email_model.dart';
import 'package:janta_sewa/repository/auth_repository/auth_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  final _api = AuthRepository();
  final _userPreference = UserPreference();
  final _secureStorage = const FlutterSecureStorage();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  /// Handles the login flow safely with timeouts and snackbar feedback
  void loginApi() async {
    isLoading.value = true;
    try {
      print("🟢 [Login] Started");

      final input = emailController.value.text.trim();
      final password = passwordController.value.text.trim();

      if (input.isEmpty || password.isEmpty) {
        Utils.showErrorSnackBar(
          "Error",
          "Please enter your email and password",
        );
        return;
      }

      // Detect if login is with mobile or email
      final Map<String, dynamic> data = RegExp(r'^[0-9]+$').hasMatch(input)
          ? {"mobileNumber": input, "password": password}
          : {"email": input, "password": password};

      print("🟢 Sending login request with payload: $data");

      // --- ✅ API Call with timeout ---
      final value = await _api
          .loginApi(data)
          .timeout(
            const Duration(seconds: 100),
            onTimeout: () => {'success': false, 'message': 'Request timed out'},
          );

      print("🟢 Login API returned: $value");

      // --- Handle errors from network layer ---
      if (value is Map && value['success'] == false) {
        final msg = value['message'] ?? 'Login failed';
        Utils.showErrorSnackBar('Error', msg.toString());
        return;
      }

      // --- Successful login ---
      Utils.showSuccessSnackBar("Login", "Login Successful 🎉");

      // Save basic user info for persistence
      await _userPreference.saveUser(
        LoginWithEmailModel(email: input, password: password),
      );

      // Optional debug info for tokens / cookies
      try {
        final token = await _secureStorage.read(key: 'token');
        debugPrint('Saved auth token: $token');
      } catch (e) {
        debugPrint('Token read error: $e');
      }

      try {
        final prefs = await SharedPreferences.getInstance();
        final cookies = prefs.getStringList('cookies') ?? [];
        debugPrint('Saved cookies: $cookies');
      } catch (e) {
        debugPrint('Cookies read error: $e');
      }

      // Navigate to main app screen
      Get.offAll(() => const BottomNav());
    } on TimeoutException catch (e) {
      Utils.showErrorSnackBar("Timeout", e.message ?? "Server not responding");
    } catch (error) {
      Utils.showErrorSnackBar("Error", error.toString());
    } finally {
      isLoading.value = false; // ✅ always stops loader
      print("🟢 [Login] Finished");
    }
  }

  @override
  void onClose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    super.onClose();
  }
}
