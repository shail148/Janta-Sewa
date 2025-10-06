import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_list_tile.dart';
import 'package:janta_sewa/views/letters/complaint/government_employee_page.dart';
import 'package:janta_sewa/views/letters/complaint/mpoffice_complaint_page.dart';
import 'package:janta_sewa/views/letters/complaint/national_complaint_page.dart';
import 'package:janta_sewa/views/letters/complaint/politician_complaint_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';


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
                padding: const EdgeInsets.symmetric(horizontal: 16),
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