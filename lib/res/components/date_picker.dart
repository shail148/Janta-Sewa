import 'package:flutter/material.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  // ignore: use_super_parameters
  const CustomDatePicker({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  // Call this method to show the date picker and set the value in the controller.
  static Future<void> showCustomDatePicker({
    required BuildContext context,
    required TextEditingController controller,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.btnBgColor,
              onPrimary: Colors.white,
              onSurface: AppColors.textColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      controller.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.btnBgColor,
              onPrimary: Colors.white,
              onSurface: AppColors.textColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      controller.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: Icon(Icons.calendar_month, color: AppColors.btnBgColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: const Color(0xFFF5F6FA),
          ),
        ),
      ),
    );
  }
}
