import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/models/login/login_with_email_model.dart';
import 'package:janta_sewa/repository/auth_repository/auth_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = AuthRepository();
  final _userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() async {
    try {
      isLoading.value = true;
      //  check if user entered phone number or email
      String input = emailController.value.text.trim();
      Map data;
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        //  user entered phone number
        data = {
          "mobileNumber": input,
          "password": passwordController.value.text.trim(),
        };
      } else {
        //  user entered email
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
        // saved the user data in shared preferences
        _userPreference.saveUser(
          LoginWithEmailModel(
            email: input,
            password: passwordController.value.text.trim(),
          ),
        );
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
