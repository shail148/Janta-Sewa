import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';

class CustomServiceCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color borderColor;
  /* final double imageScale;
  final double imageZoom; */
  final double imageBoxFactor; // default 0.41

  const CustomServiceCard({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
    this.width,
    this.height,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.bgLight,
    /* this.imageScale = 1.0,
    this.imageZoom = 1.0, */
    this.imageBoxFactor = 0.45,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = width ?? screenWidth * 0.60;
    final cardHeight = height ?? screenHeight * 0.14;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.90), //0.0 to 1.0 values
          border: Border.all(color: const Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Text at top-left with padding
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Image at bottom-right
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                /* width: cardWidth * 0.45,
                height: cardHeight * 0.45, */
                width: cardWidth * imageBoxFactor, // i made factor a parameter
                height: cardHeight * imageBoxFactor,
                child: Image.asset(
                  imagePath,
                  //scale: imageScale,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
