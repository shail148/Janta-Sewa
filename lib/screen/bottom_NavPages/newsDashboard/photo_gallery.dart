import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class PhotoGalleryView extends StatefulWidget {
 const PhotoGalleryView({super.key});

  @override
  State<PhotoGalleryView> createState() => _PhotoGalleryViewState();
}

class _PhotoGalleryViewState extends State<PhotoGalleryView> {
  // Local JSON list
  final String speechList = '''
  [
    {
      "title": "Shri Vijay Baghel Addresses Cooperation Sector",
      "date": "16-04-2025",
      "author": "Shri Vijay Baghel",
      "imageUrl": "assets/sliderimages/1.png"
    },
    {
      "title": "Minister Talks on Rural Development",
      "date": "12-03-2025",
      "author": "Smt. XYZ",
      "imageUrl": "assets/sliderimages/3.jpg"
    },
    {
      "title": "Empowering Youth Through Innovation",
      "date": "05-03-2025",
      "author": "Dr. Nitin Rao",
      "imageUrl": "assets/sliderimages/4.jpg"
    },
    {
      "title": "Shri Vijay Baghel Addresses Cooperation Sector",
      "date": "16-04-2025",
      "author": "Shri Vijay Baghel",
      "imageUrl": "assets/sliderimages/2.jpg"
    },
    {
      "title": "Minister Talks on Rural Development",
      "date": "12-03-2025",
      "author": "Smt. XYZ",
      "imageUrl": "assets/sliderimages/3.jpg"
    },
    {
      "title": "Empowering Youth Through Innovation",
      "date": "05-03-2025",
      "author": "Dr. Nitin Rao",
      "imageUrl": "assets/sliderimages/4.jpg"
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    final List speeches = json.decode(speechList);

    return SizedBox(
      height: 240,
      child: ListView.builder(
        addRepaintBoundaries: true,
        
        scrollDirection: Axis.horizontal,
        itemCount: speeches.length,
        itemBuilder: (context, index) {
          final item = speeches[index];
          return Container(
            width: 250,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    item['imageUrl'],
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(  
                    text: '${item['title']}',
                    fontsize: 12,
                     
                  ),
                ),
                // Date
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: AppColors.btnBgColor),
                      const SizedBox(width: 4),
                      CustomTextWidget(text: '${item['date']}',fontsize: 12,)
                  
                    ],
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
