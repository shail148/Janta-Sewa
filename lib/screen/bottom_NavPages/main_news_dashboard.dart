import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/listview_speech.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/photo_gallery.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class MainNewsDashboard extends StatefulWidget {
  const MainNewsDashboard({super.key});
  @override
  State<MainNewsDashboard> createState() => _MainNewsDashboardState();
}
class _MainNewsDashboardState extends State<MainNewsDashboard> {
  final List<Map<String, dynamic>> imageList = [
    {'id': 1, 'image': 'assets/sliderimages/1.png'},
    {'id': 2, 'image': 'assets/sliderimages/2.jpg'},
    {'id': 3, 'image': 'assets/sliderimages/3.jpg'},
    {'id': 4, 'image': 'assets/sliderimages/3.jpg'},
  ];

  int currentIndex = 0;
  // controller type changed for v5
  final CarouselSliderController sliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ─────── Carousel ───────
                CarouselSlider(
                  carouselController: sliderController, // 👈 matches new type
                  items: imageList.map((item) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    aspectRatio: 2,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (index, _) =>
                        setState(() => currentIndex = index),
                  ),
                ),

                const SizedBox(height: 8),

                /// ─────── Dot indicators ───────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    final bool isActive = currentIndex == entry.key;
                    return GestureDetector(
                      onTap: () => sliderController.animateToPage(entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isActive ? 12 : 8,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? AppColors.btnBgColor : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Speech',
                      fontWeight: FontWeight.bold,
                      color: AppColors.btnBgColor,
                    ),
                    GestureDetector(
                      onTap: (){
                          Get.to(()=>DetailsViewSpeech());
                      },
                      child: CustomTextWidget(
                        text: 'View All',
                        fontWeight: FontWeight.bold,
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SpeechListView(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Photo Gallery',
                      fontWeight: FontWeight.bold,
                      color: AppColors.btnBgColor,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>DetailsViewSpeech());
                      },
                      child: CustomTextWidget(
                        text: 'View All',
                        fontWeight: FontWeight.bold,
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                        
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                PhotoGalleryView(),
                SizedBox(height: 16),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   CustomButton(
                  text: 'Join BJP',
                  textSize: 12,
                  height: 80,
                  width: 120,
                  backgroundColor: AppColors.bgLight,
                  textColor: Colors.orange,
                  borderColor: Colors.orange,
                  onPressed: (){},
                ),
                CustomButton(
                  text: 'Join as Valunteer',
                  textSize: 12,
                  height: 80,
                  width: 120,
                  
                  backgroundColor: AppColors.bgLight,
                  textColor: AppColors.btnBgColor,
                  borderColor: AppColors.btnBgColor,
                  onPressed: (){},
                ),
                ],
               ) 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
