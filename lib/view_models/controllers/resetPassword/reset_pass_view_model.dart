import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/auth_repository/auth_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/auth/login_page.dart';
import 'package:janta_sewa/views/forgotPassword/create_new_password_page.dart';
import 'package:janta_sewa/views/forgotPassword/forgot_otp_verification_page.dart';

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
      Utils.showErrorSnackBar("Error", error.toString());
    }
  }

  void verifyOtpApi() async {
    try {
      isLoading.value = true;

      // validate input first
      final otp = otpController.value.text.trim();
      final email = emailController.value.text.trim();
      if (otp.isEmpty) {
        isLoading.value = false;
        Utils.showErrorSnackBar("Validation", "Please enter the OTP");
        return;
      }

      Map data = {"email": email, "otp": otp};

      final value = await _api.verifyForgotPasswordApi(data);
      // normalize loading/state handling
      isLoading.value = false;

      // handle normalized error response from network layer
      if (value is Map) {
        // explicit server-declared failure
        final bool success = value['success'] == true;
        final int? status = value['status'] is int
            ? value['status'] as int
            : (value['status'] != null
                  ? int.tryParse(value['status'].toString())
                  : null);
        final String? msg =
            value['message']?.toString() ?? value['error']?.toString();

        if (!success || (status != null && status >= 400)) {
          Utils.showErrorSnackBar(
            "Verification Failed",
            msg ?? "Invalid OTP or request failed",
          );
          return;
        }

        // Some APIs may return error key even with success true; handle conservatively
        if (value['error'] != null) {
          Utils.showErrorSnackBar(
            "Verification Failed",
            value['error'].toString(),
          );
          return;
        }

        // If server returned a specific verified flag or data, you can check it here as well.
      } else {
        // unexpected non-map response
        Utils.showErrorSnackBar(
          "Verification Failed",
          "Invalid server response",
        );
        return;
      }

      // If reached here, verification succeeded
      Utils.showSuccessSnackBar(
        "Reset Password",
        "Otp Verified Successfully 🎉",
      );
      Get.to(() => const CreateNewPassword());
    } catch (error) {
      isLoading.value = false;
      Utils.showErrorSnackBar("Error", error.toString());
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
        // Clear controller texts before navigating (safe)
        emailController.value.text = '';
        otpController.value.text = '';
        passwordController.value.text = '';
        confirmPasswordController.value.text = '';

        Get.offAll(() => const LoginPage());
      }
    } catch (error) {
      isLoading.value = false;
      Utils.showErrorSnackBar("Error", error.toString());
    }
  }

  @override
  void onClose() {
    // Do not dispose controllers here to avoid "used after disposed" errors
    // Widgets might still reference these controllers during navigation.
    // If you want to fully clean up, dispose controllers in the widget that
    // creates them or ensure navigation happens after disposal.
    super.onClose();
  }
}
