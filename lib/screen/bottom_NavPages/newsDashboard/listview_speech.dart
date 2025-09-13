import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/data/speech_data.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class SpeechListView extends StatefulWidget {
  const SpeechListView({super.key});

  @override
  State<SpeechListView> createState() => _SpeechListViewState();
}

class _SpeechListViewState extends State<SpeechListView> {
  // Local JSON list
  final LanguageController languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    
    final List speeches =languageController.isHindi?json.decode(speechListHindi):json.decode(speechList); 


    return SizedBox(
      height: 280,
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
              border: Border.all(color:AppColors.galleryBdColors),
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
                    height: 140,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                    fit: BoxFit.fill, //changed
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        '${item['title']}',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                        // optional style
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
                // Author
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.btnBgColor,
                      ),
                      const SizedBox(width: 4),
                      CustomTextWidget(text: '${item['author']}', fontsize: 12),
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

class DetailsViewSpeech extends StatefulWidget {
  const DetailsViewSpeech({super.key});

  @override
  State<DetailsViewSpeech> createState() => _DetailsViewSpeechState();
}

class _DetailsViewSpeechState extends State<DetailsViewSpeech> {
  final LanguageController languageController = Get.put(LanguageController());
    
  @override
  Widget build(BuildContext context) {
    final List speeches =languageController.isHindi?json.decode(speechListHindi):json.decode(speechList); 

    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: speeches.length,
                itemBuilder: (context, index) {
                  final item = speeches[index];
                  return Container(
                    width: 250,
            
                    margin: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color:AppColors.galleryBdColors),
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
                            height: 200,
                            width: double.infinity,
                            //fit: BoxFit.cover,
                            fit: BoxFit.fill //changed to fill
                          ),
                        ),
                        // Title
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${item['title']}',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                            // optional style
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
                              CustomTextWidget(
                                text: '${item['date']}',
                                fontsize: 12,
                              ),
                            ],
                          ),
                        ),
                        // Author
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 16,
                                color: AppColors.btnBgColor,
                              ),
                              const SizedBox(width: 4),
                              CustomTextWidget(
                                text: '${item['author']}',
                                fontsize: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
