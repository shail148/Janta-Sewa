import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/data/our_journey.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OurJourneyPage extends StatefulWidget {
  const OurJourneyPage({super.key});

  @override
  State<OurJourneyPage> createState() => _OurJourneyPageState();
}

class _OurJourneyPageState extends State<OurJourneyPage> {
  final PageController _pageController = PageController(viewportFraction: 0.95);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
   
    return Scaffold(
      appBar: CustomTopAppBar(
        title: 'Our Journey',
        leftIcon: const Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () => Get.back(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.6,
            child: PageView.builder(
              controller: _pageController,
              itemCount: languageController.isHindi? journeyListHindi.length:  journeyList.length,
              itemBuilder: (context, index) {
                 final journey =languageController.isHindi? journeyListHindi[index]:  journeyList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFE9E5BC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.galleryBdColors),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          journey['image'] ?? '',
                          width: double.infinity,
                          height: screenHeight * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              journey['year'] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.btnBgColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            CustomTextWidget(
                              text: journey['name'] ?? '',
                              fontsize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.btnBgColor,
                            ),
                            // const SizedBox(height: 4),
                            CustomTextWidget(
                              text: journey['party'] ?? '',
                              fontsize: 13,
                              color: Colors.black87,
                            ),
                            const SizedBox(height: 12),
                            CustomTextWidget(
                              text: journey['position'] ?? '',
                              fontsize: 13,
                              textAlign: TextAlign.center,
                              color: Colors.black54,
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
          // Circle Page Indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: journeyList.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.btnBgColor,
              dotColor: Colors.grey.shade300,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
            ),
          ),

          const SizedBox(height: 24),

          // Quote
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: CustomTextWidget(
                text: 'journey_quotes'.tr,

                color: Colors.black54,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
