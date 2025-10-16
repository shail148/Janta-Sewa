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
  final _secureStorage = const FlutterSecureStorage(); // <-- added

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() async {
    try {
      isLoading.value = true;
      String input = emailController.value.text.trim();
      Map<String, dynamic> data;

      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        data = {
          "mobileNumber": input,
          "password": passwordController.value.text.trim(),
        };
      } else {
        data = {
          "email": input,
          "password": passwordController.value.text.trim(),
        };
      }

      
      final value = await _api.loginApi(data);
      isLoading.value = false;

      
      if (value is Map && value['success'] == false) {
        Utils.showErrorSnackBar('Error', value['message'] ?? 'Login failed');
        return;
      }

      Utils.showSuccessSnackBar("Login", "Login Successful 🎉");

      // ✅ Save login info
      await _userPreference.saveUser(
        LoginWithEmailModel(
          email: input,
          password: passwordController.value.text.trim(),
        ),
      );

      // ✅ Debug token/cookies
      final token = await _secureStorage.read(key: 'token');
      debugPrint('Saved auth token: $token');

      final prefs = await SharedPreferences.getInstance();
      final cookies = prefs.getStringList('cookies') ?? [];
      debugPrint('Saved cookies: $cookies');

      // ✅ Navigate
      Get.offAll(() => const BottomNav());
    } catch (error) {
      isLoading.value = false;
      Utils.showErrorSnackBar("Error", error.toString());
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
