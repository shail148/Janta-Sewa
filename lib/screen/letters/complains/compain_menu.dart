import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/screen/letters/complains/government_employee.dart';
import 'package:janta_sewa/screen/letters/complains/mpoffice_complain.dart';
import 'package:janta_sewa/screen/letters/complains/national_complain.dart';
import 'package:janta_sewa/screen/letters/complains/politician_complain.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';


class CompainMenu extends StatelessWidget {
  const CompainMenu({super.key});

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
                      text: "complain_letter_m".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),
                   CustomListTile(title: 'complain_gov_emp'.tr, onTap: (){
                    Get.to(()=> GovernmentEmployeeComplain());
                    
                   }),
                   CustomListTile(title: 'complain_of_politician'.tr, onTap: (){
                    Get.to(()=>PoliticianComplain());
                    
                   }),
                   CustomListTile(title: 'complain_of_national'.tr, onTap: (){
                    Get.to(()=> NationalComplain());
                    
                   }),
                   CustomListTile(title: 'complain_of_mp_office'.tr, onTap: (){
                    Get.to(()=> MpofficeComplain());
                    
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