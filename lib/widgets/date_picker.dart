import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

Future<void> showCustomCalendarDialog({
  required BuildContext context,
  required TextEditingController controller,
  DateTime? firstDate, // 👈 optional
  DateTime? lastDate, // 👈 optional
  DateTime? initialDate, // 👈 optional for flexibility
}) async {
  DateTime selectedDate = initialDate ?? DateTime.now();

  await Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Date",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Poppins',
                color: AppColors.btnBgColor,
              ),
            ),
            const SizedBox(height: 20),
            Theme(
              data: ThemeData.light().copyWith(
                primaryColor: AppColors.btnBgColor,
                hintColor: AppColors.btnBgColor,
                colorScheme: ColorScheme.light(primary: AppColors.btnBgColor),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  bodySmall: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  titleSmall: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate:
                    firstDate ??
                    DateTime(1950), // ✅ use passed value or default
                lastDate:
                    lastDate ?? DateTime(2100), // ✅ use passed value or default
                onDateChanged: (date) {
                  selectedDate = date;
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnBgColor,
                  ),
                  onPressed: () {
                    controller.text = DateFormat(
                      'dd/MM/yyyy',
                    ).format(selectedDate);
                    Get.back();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
