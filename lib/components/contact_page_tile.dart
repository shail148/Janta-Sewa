import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';

class ContactPageTile extends StatelessWidget {
  final String title;
  final IconData icons;
  final VoidCallback onTap;
  const ContactPageTile({super.key,
    required this.title,
    required this.icons,
    required this.onTap,
  });

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
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: AppColors.textColor,
            fontFamily: 'Inter', // (optional: for consistency)
          ),
        ),
       leading: Icon(icons,color: AppColors.btnBgColor,size: 30,),
        onTap: onTap,
      ),
    );
  }
}