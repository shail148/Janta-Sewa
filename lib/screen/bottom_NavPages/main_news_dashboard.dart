import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/join_bjp_volunteer.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/listview_speech.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/photo_gallery.dart';
import 'package:janta_sewa/screen/bottom_NavPages/services_home_screen2.dart';
import 'package:janta_sewa/screen/bottom_NavPages/sevices_home_screen.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/services_home_list_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  // controller type changed for v
  final CarouselSliderController sliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.3;
    final buttonHeight = screenWidth * 0.21;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 0),
                CarouselSlider(
                  carouselController: sliderController,
                  items: imageList.map((item) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        item['image'],
                        // fit: BoxFit.cover, //changed to fill from cover
                        fit: BoxFit.fill,
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
                    //aspectRatio: 2,
                    aspectRatio: 1.6,

                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (index, _) =>
                        setState(() => currentIndex = index),
                  ),
                ),

                const SizedBox(height: 8),

                //DOT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: imageList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 6,
                        expansionFactor: 2,
                        activeDotColor: AppColors.btnBgColor,
                        dotColor: Colors.grey.shade400,
                      ),
                      onDotClicked: (index) {
                        sliderController.animateToPage(index);
                      },
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: imageList.asMap().entries.map((entry) {
                //     final bool isActive = currentIndex == entry.key;
                //     return GestureDetector(
                //       onTap: () => sliderController.animateToPage(entry.key),
                //       child: AnimatedContainer(
                //         duration: const Duration(milliseconds: 300),
                //         width: isActive ? 12 : 8,
                //         height: 10,
                //         margin: const EdgeInsets.symmetric(horizontal: 4),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: isActive ? AppColors.btnBgColor : Colors.grey,
                //         ),
                //       ),
                //     );
                //   }).toList(),
                // ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Services'.tr,
                      fontWeight: FontWeight.bold,
                      color: AppColors.btnBgColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ServicesHomeScreen2());
                      },
                      child: CustomTextWidget(
                        text: 'view_more'.tr,
                        fontWeight: FontWeight.w400,
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const ServicesHomeListWidget(),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'speech'.tr,
                      fontWeight: FontWeight.bold,
                      color: AppColors.btnBgColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DetailsViewSpeech());
                      },
                      child: CustomTextWidget(
                        text: 'view_more'.tr,
                        fontWeight: FontWeight.w400,
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                SpeechListView(),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'photo_gallery'.tr,
                      fontWeight: FontWeight.bold,
                      color: AppColors.btnBgColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DetailsViewSpeech());
                      },
                      child: CustomTextWidget(
                        text: 'view_more'.tr,
                        fontWeight: FontWeight.w400,
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                PhotoGalleryView(),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      CustomButton(
                        text: 'join_bjp'.tr,
                        textSize: 12,
                        height: buttonHeight,
                        width: buttonWidth,
                        backgroundColor: AppColors.bgLight,
                        textColor: Colors.orange,
                        borderColor: Colors.orange,
                        onPressed: () {
                          Get.to(() => JoinBjpVolunteerPage());
                        },
                      ),
                      CustomButton(
                        text: 'join_volunteer'.tr,
                        textSize: 12,
                        height: buttonHeight,
                        width: buttonWidth,
                        backgroundColor: AppColors.bgLight,
                        textColor: AppColors.btnBgColor,
                        borderColor: AppColors.btnBgColor,
                        onPressed: () {
                          Get.to(() => JoinBjpVolunteerPage());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
