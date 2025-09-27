import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/login_repository/login_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final _userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() async {
    try {
      isLoading.value = true;
      String input = emailController.value.text.trim();
      Map data;
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        // 📱 user entered phone number
        data = {
          "phone": input,
          "password": passwordController.value.text.trim(),
        };
      } else {
        // 📧 user entered email
        data = {
          "email": input,
          "password": passwordController.value.text.trim(),
        };
      }

      final value = await _api.loginApi(data);
      isLoading.value = false;

      if (value['error'] != null) {
        Utils.showSnackBar("Login Failed", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Login", "Login Successful 🎉");
        Get.offAll(() => const BottomNav());
      }
    } catch (error) {
      isLoading.value = false;
      Utils.showSnackBar("Error", error.toString());
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
