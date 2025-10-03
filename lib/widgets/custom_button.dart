import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/res/colors/app_color.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double borderRadius;
  final double? textSize;
  final double borderWidth; // Default border width
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.borderRadius = 5,
    this.backgroundColor,
    this.onPressed,
    required this.textSize,
    this.textColor = AppColors.white,
    this.borderWidth = 1.0,
    this.borderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.btnBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
            color: borderColor ?? AppColors.btnBgColor,
            width: borderWidth,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
                ),
              ),
      ),
    );
  }
}
