import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';



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
                   CustomListTile(title: 'Transfer', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Posting', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Quarter Allotment', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Award', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Admission', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Land Allotment', onTap: (){
                    
                   }),
                    CustomListTile(title: 'Job Recommendation', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Financial Recommendation', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Cultural Programme', onTap: (){
                    
                   }),
                   CustomListTile(title: 'Other Recommendation', onTap: (){
                    
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