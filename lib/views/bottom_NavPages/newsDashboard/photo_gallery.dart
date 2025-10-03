import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/localization/language_controller.dart';
import 'package:janta_sewa/data/photo_gallery.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class PhotoGalleryView extends StatefulWidget {
  const PhotoGalleryView({super.key});
  @override
  State<PhotoGalleryView> createState() => _PhotoGalleryViewState();
}

class _PhotoGalleryViewState extends State<PhotoGalleryView> {
  // Local JSON list
  final LanguageController languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    final List speeches = languageController.isHindi
        ? json.decode(photoGalleryHindi)
        : json.decode(photoGallery);

    return SizedBox(
      height: 250,
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
              border: Border.all(color: AppColors.galleryBdColors),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    item['imageUrl'],
                    height: 175, //changed from 140
                    width: double.infinity,
                    //fit: BoxFit.cover,
                    fit: BoxFit.fill, //changed to fill
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
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColors.btnBgColor,
                      ),
                      const SizedBox(width: 4),
                      CustomTextWidget(text: '${item['date']}', fontsize: 12),
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
