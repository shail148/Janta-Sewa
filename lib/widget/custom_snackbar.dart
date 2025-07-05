import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show({
    required String title,
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.TOP, // Default to TOP for error/info
    Duration duration = const Duration(seconds: 2),
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: textColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: 12,
      icon: icon != null
          ? Icon(icon, color: textColor)
          : null,
      duration: duration,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      snackStyle: SnackStyle.FLOATING, // Use FLOATING for better visibility
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
