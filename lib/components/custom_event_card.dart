import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:share_plus/share_plus.dart';

class CustomEventCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String date;
  const CustomEventCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: AppColors.galleryBdColors,width: 1)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 290,
              width: 200,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
          ),
         
          // TEXT CONTENT
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: description, textAlign: TextAlign.justify,fontsize: 12,),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: AppColors.btnBgColor,size: 16,
                    ),
                    const SizedBox(width: 5),
                    CustomTextWidget(text: date,fontsize: 12,),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1,color: AppColors.galleryBdColors,),
          // SHARE SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                Image.asset(
                  'assets/images/instagram.png',
                  height: 20,
                  width: 20,
                ),
                Image.asset('assets/images/twitter.png', height: 20, width: 20),
                Image.asset(
                  'assets/images/facebook.png',
                  height: 20,
                  width: 20,
                ),
                // Spacer(),
                IconButton(
                  icon: const Icon(Icons.share,color: AppColors.btnBgColor,),
                  onPressed: () {
                    // Share the event description and date
                    Share.share('$description\n📅 $date');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
