import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? leadingWidget;
  final Icon? trailingWidget;
  const CustomListTile({super.key,required this.title,required this.onTap,this.leadingWidget,this.trailingWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.formBgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.btnBgColor)
      ),
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          title,    
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: AppColors.textColor,
            fontFamily: 'Poppins', // (optional: for consistency)
          ),
        ),
        trailing:trailingWidget?? const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Color(0xFF001489), // Deep blue
        ),
        onTap: onTap,
      ),
    );
  }
}