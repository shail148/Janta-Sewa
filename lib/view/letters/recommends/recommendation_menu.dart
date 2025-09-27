import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_list_tile.dart';
import 'package:janta_sewa/view/letters/recommends/admission_letter.dart';
import 'package:janta_sewa/view/letters/recommends/award_letter.dart';
import 'package:janta_sewa/view/letters/recommends/cultural_programme_letter.dart';
import 'package:janta_sewa/view/letters/recommends/financial_recommendation_letter.dart';
import 'package:janta_sewa/view/letters/recommends/job_recommendation_letter.dart';
import 'package:janta_sewa/view/letters/recommends/land_allotment_letter.dart';
import 'package:janta_sewa/view/letters/recommends/other_recommendation_letter.dart';
import 'package:janta_sewa/view/letters/recommends/posting_letter.dart';
import 'package:janta_sewa/view/letters/recommends/quarter_allotment.dart';
import 'package:janta_sewa/view/letters/recommends/transfer_letter.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';


class RecommendationMenu extends StatelessWidget {
  const RecommendationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          // thickness: 5,
          radius: const Radius.circular(10),                            
          child: SingleChildScrollView(
            child: SafeArea(  
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "recommendation_letter".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),
                   CustomListTile(title: 'Transfer'.tr, onTap: (){
                    Get.to(()=>TransferLetter());
                   }),
                   CustomListTile(title: 'Posting'.tr, onTap: (){
                    Get.to(()=>PostingLetter());
                   }),
                   CustomListTile(title: 'Quarter Allotment'.tr, onTap: (){
                    Get.to(()=>QuarterAllotment());
                   }),
                   CustomListTile(title: 'Award'.tr, onTap: (){
                    Get.to(()=>AwardLetter());
                   }),
                   CustomListTile(title: 'Admission'.tr, onTap: (){
                    Get.to(()=>AdmissionLetter());
                   }),
                   CustomListTile(title: 'Land Allotment'.tr, onTap: (){
                    Get.to(()=>LandAllotmentLetter());
                   }),
                    CustomListTile(title: 'Job Recommendation'.tr, onTap: (){
                     Get.to(()=>JobRecommendationLetter());

                   }),
                   CustomListTile(title: 'Financial Recommendation'.tr, onTap: (){
                  Get.to(()=>FinancialRecommendationLetter());

                    
                   }),
                   CustomListTile(title: 'Cultural Programme'.tr, onTap: (){
                    Get.to(()=>CulturalProgrammeLetter());
                    
                   }),
                   CustomListTile(title: 'Other Recommendation'.tr, onTap: (){
                    Get.to(()=>OtherRecommendationLetter());
                   }),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}