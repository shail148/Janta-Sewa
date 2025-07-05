import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  const CustomServiceCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.width = 120,
    this.height = 120,
    this.iconColor = Colors.black,
    this.backgroundColor = const Color(0xFFF5F7FF),
    this.borderColor = const Color(0xFFB3D1FF),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(top: 12,bottom: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
           Container(
           // margin: EdgeInsets.only(top: 10,),
            //padding: EdgeInsets.only(bottom: 40),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFFB3D1FF),
              borderRadius: BorderRadius.circular(10)
            ),
             child: Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                  
                ),
           ),
            Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
