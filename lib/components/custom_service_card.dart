import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  const CustomServiceCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.iconColor = Colors.black,
    this.backgroundColor = const Color(0xFFF5F7FF),
    this.borderColor = const Color(0xFFB3D1FF),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = width ?? screenWidth * 0.28;
    final cardHeight = height ?? screenHeight * 0.14;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: cardHeight * 0.4,
              width: cardWidth * 0.4,
              decoration: BoxDecoration(
                color: const Color(0xFFB3D1FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: cardWidth * 0.25, color: iconColor),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: cardWidth * 0.8,
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
