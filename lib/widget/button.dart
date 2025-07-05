import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double borderRadius;
  final double? textSize;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.backgroundColor = AppColors.btnBgColor,
    this.onPressed,
    required this.textSize, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
