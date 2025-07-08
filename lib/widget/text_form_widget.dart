import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color fillColor;
  final double fontSize;
  final Icon? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.fillColor = const Color(0xFFF5F6FA),
    this.fontSize = 12,
    this.controller,
    this.suffixIcon,
    this.suffixIconColor,
    this.validator,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.textGrey,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          suffixIcon: suffixIcon,
        
          suffixIconColor: suffixIconColor,
          hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          //contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.btnBgColor, // Thin blue border when focused
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
