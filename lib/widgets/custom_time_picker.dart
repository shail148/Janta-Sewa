// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

Future<void> showCustomTimeDialog({
  required BuildContext context,
  required TextEditingController controller,
}) async {
  TimeOfDay selectedTime = TimeOfDay.now();

  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    builder: (context, child) {
      // Optional: customize the dialog colors
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primary, // header background
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedTime != null) {
    // Format time as HH:MM AM/PM
    final formattedTime = pickedTime.format(context);
    controller.text = formattedTime;
  }
}
