import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/auth_repository/auth_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view/authPages/login_page.dart';
import 'package:janta_sewa/view/forgotPassword/create_new_password_page.dart';
import 'package:janta_sewa/view/forgotPassword/forgot_otp_verification_page.dart';

class ResetPassViewModel extends GetxController {
  final _api = AuthRepository();

  final emailController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  RxBool isLoading = false.obs;

  void forgotPasswordApi() async {
    try {
      isLoading.value = true;
      //  check if user entered phone number or email
      String input = emailController.value.text.trim();
      Map data;
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        // 📱 user entered phone number
        data = {"mobileNumber": input};
      } else {
        //  user entered email
        data = {"email": input};
      }
      final value = await _api.forgotPasswordApi(data);
      isLoading.value = false;

      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Reset Password", "OTP Sent Successfully 🎉");
        Get.to(() => const ForgotOtpVerification());
      }
    } catch (error) {
      isLoading.value = false;
      Utils.showSnackBar("Error", error.toString());
    }
  }

  void verifyOtpApi() async {
    try {
      isLoading.value = true;
      //  check if user entered phone number or email
      String input = emailController.value.text.trim();
      Map data;
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        // 📱 user entered phone number
        data = {
          "email": emailController.value.text.trim(),
          "otp": otpController.value.text.trim(),
        };
      } else {
        //  user entered email
        data = {
          "email": emailController.value.text.trim(),
          "otp": otpController.value.text.trim(),
        };
      }
      final value = await _api.verifyForgotPasswordApi(data);
      isLoading.value = false;

      if (value['error'] != null) {
        Utils.showErrorSnackBar("Login Failed", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar(
          "Reset Password",
          "Otp Verified Successfully 🎉",
        );
        Get.to(() => const CreateNewPassword());
      }
    } catch (error) {
      isLoading.value = false;
      Utils.showSnackBar("Error", error.toString());
    }
  }

  void createNewPasswordApi() async {
    try {
      isLoading.value = true;
      //  check if user entered phone number or email
      String input = emailController.value.text.trim();
      Map data;
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        // 📱 user entered phone number
        data = {
          "email": emailController.value.text.trim(),
          "password": passwordController.value.text.trim(),
        };
      } else {
        //  user entered email
        data = {
          "email": emailController.value.text.trim(),
          "newPassword": passwordController.value.text.trim(),
        };
      }
      final value = await _api.resetPasswordApi(data);
      isLoading.value = false;

      if (value['error'] != null) {
        Utils.showErrorSnackBar("Login Failed", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar(
          "Reset Password",
          "Password Reset Successfully 🎉",
        );
        Get.offAll(() => const LoginPage());
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
    super.onClose();
  }
}
