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
  Future<void> loginApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      debugPrint("🟢 [Login] Started");

      final input = emailController.value.text.trim();
      final password = passwordController.value.text.trim();

      if (input.isEmpty || password.isEmpty) {
        Utils.showErrorSnackBar(
          "Error",
          "Please enter your email and password",
        );
        isLoading.value = false;
        return;
      }
      // Determine whether it's email or mobile login
      final Map<String, dynamic> data = RegExp(r'^[0-9]+$').hasMatch(input)
          ? {"mobileNumber": input, "password": password}
          : {"email": input, "password": password};

      debugPrint("🟢 Sending login payload: $data");

      // Timeout protected API call
      final value = await _api
          .loginApi(data)
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => {
              'success': false,
              'message': 'Server timeout. Please try again later.',
            },
          );

      debugPrint("🟢 Login API Response: $value");
      if (value is! Map || value['success'] != true) {
        final msg = value['message'] ?? 'Invalid credentials';
        Utils.showErrorSnackBar('Login Failed', msg.toString());
        isLoading.value = false;
        return;
      }
      // Save credentials locally
      await _userPreference.saveUser(
        LoginWithEmailModel(email: input, password: password),
      );
      // Optional debug info
      try {
        final token = await _secureStorage.read(key: 'token');
        debugPrint('📦 Token saved: $token');
        final prefs = await SharedPreferences.getInstance();
        final cookies = prefs.getStringList('cookies') ?? [];
        debugPrint('🍪 Cookies: $cookies');
      } catch (e) {
        debugPrint('⚠️ Storage read error: $e');
      }
      // Navigate to main app screen safely
      Future.delayed(const Duration(milliseconds: 300), () {
        if (Get.isOverlaysOpen || Get.context != null) {
          Get.offAll(() => const BottomNav());
        } else {
          debugPrint("⚠️ Context not ready, retrying navigation...");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAll(() => const BottomNav());
          });
        }
      });
    } on TimeoutException catch (e) {
      //Utils.showErrorSnackBar("Timeout", e.message ?? "Server not responding");
    } catch (error, st) {
      debugPrint('❌ Login Exception: $error\n$st');
      // Utils.showErrorSnackBar("Error", error.toString());
    } finally {
      isLoading.value = false;
      debugPrint("🟢 [Login] Finished");
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
