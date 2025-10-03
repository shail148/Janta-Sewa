import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_list_tile.dart';
import 'package:janta_sewa/views/letters/suggestions/suggestion_gov_department.dart';
import 'package:janta_sewa/views/letters/suggestions/suggestion_gov_scheme.dart';
import 'package:janta_sewa/views/letters/suggestions/suggestion_mp_office.dart';
import 'package:janta_sewa/views/letters/suggestions/suggestion_people.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class SuggestionMenu extends StatelessWidget {
  const SuggestionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor, size: 20.sp),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          radius: Radius.circular(10.r),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "suggestion_letter_menu".tr,
                    color: AppColors.textColor,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 16.h),
                  CustomListTile(
                    title: 'suggestion_for_people'.tr,
                    onTap: () {
                      Get.to(() => SuggestionForPeople());
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomListTile(
                    title: 'suggestion_for_government_schemes'.tr,
                    onTap: () {
                      Get.to(() => SuggestionForGovScheme());
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomListTile(
                    title: 'suggestion_for_government_department'.tr,
                    onTap: () {
                      Get.to(() => SuggestionForGovDepartment());
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomListTile(
                    title: 'suggestion_for_mp_office'.tr,
                    onTap: () {
                      Get.to(() => SuggestionForMPOffice());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

