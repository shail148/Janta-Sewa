import 'package:flutter/material.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool enabled;
  final FocusNode? focusNode;
  final bool readOnly;
  final TextInputType keyboardType;
  final Color fillColor;
  final double fontSize;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.fillColor = const Color(0xFFF5F6FA),
    this.fontSize = 14,
    this.controller,
    this.suffixIcon,
    this.suffixIconColor,
    this.validator,
    this.enabled = true,
    this.onSuffixTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        enabled: enabled,
        readOnly: readOnly,
        style: const TextStyle(
          // height: 1,
          fontFamily: 'Inter',
          color: AppColors.textGrey,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,

          hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixTap,
                  behavior: HitTestBehavior.translucent,
                  child: Icon(suffixIcon, color: suffixIconColor),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.btnBgColor, width: 1),
          ),
        ),
      ),
    );
  }
}
