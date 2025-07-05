import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class RoleToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE7EAFF) : const Color(0xFFF3F5FF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(text: text,fontsize: 14,color: AppColors.textGrey,),
            Spacer(),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
