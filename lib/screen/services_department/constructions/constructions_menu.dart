import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/screen/services_department/constructions/beneficiary_oriented.dart';
import 'package:janta_sewa/screen/services_department/constructions/new_work_demand.dart';
import 'package:janta_sewa/screen/services_department/constructions/pending_work_demand.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ConstructionsMenu extends StatelessWidget {
  const ConstructionsMenu({super.key});

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
                      text: "construction_work_menu".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),
                   CustomListTile(title: 'new_work_demand'.tr, onTap: (){
                    Get.to(()=>NewWorkDemand());
                    
                   }),
                   CustomListTile(title: 'pending_work_completion'.tr, onTap: (){
                    Get.to(()=>PendingWorkDemand());
                    
                   }),
                   CustomListTile(title: 'beneficiary_oriented'.tr, onTap: (){
                    Get.to(()=>BeneficiaryOriented());
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