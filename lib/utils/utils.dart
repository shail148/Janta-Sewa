import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //error snackbar
  static showErrorSnackBar(String title, String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      icon: Icon(Icons.error_outline, color: Colors.white, size: 30),
      colorText: Colors.white,
    );
  }

  //create success snackbar
  static showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline, color: Colors.white, size: 30),
      colorText: Colors.white,
    );
  }
}
