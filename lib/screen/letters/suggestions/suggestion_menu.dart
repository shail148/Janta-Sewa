import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_gov_department.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_gov_scheme.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_mp_office.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_people.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class SuggestionMenu extends StatelessWidget {
  const SuggestionMenu({super.key});

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
                      text: "suggestion_letter_menu".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),
                   CustomListTile(title: 'suggestion_for_people'.tr, onTap: (){
                    Get.to(()=>SuggestionForPeople());

                    
                   }),
                   CustomListTile(title: 'suggestion_for_government_schemes'.tr, onTap: (){
                    Get.to(()=>SuggestionForGovScheme());
                    
                   }),
                   CustomListTile(title: 'suggestion_for_government_department'.tr, onTap: (){
                    Get.to(()=>SuggestionForGovDepartment());
                    
                   }),
                   CustomListTile(title: 'suggestion_for_mp_office'.tr, onTap: (){
                    Get.to(()=>SuggestionForMPOffice());
                    
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