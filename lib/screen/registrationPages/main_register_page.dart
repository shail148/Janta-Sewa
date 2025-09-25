import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/screen/registrationPages/general_register.dart';
import 'package:janta_sewa/screen/registrationPages/samajik_sansatha_register.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class MainRegisterPage extends StatelessWidget {
  const MainRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 85.h),

               

                    Center(
                      child: Image.asset(
                        'assets/images/indialogo.png',
                        height: 98.h,
                        width: 62.w,
                      ),
                    ),
                    SizedBox(height: 80),
                    CustomTextWidget(
                      text: "select_your_category".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 24),
                    CustomListTile(
                      title: 'general'.tr,
                      onTap: () {
                        Get.to(() => GeneralRegister());
                      },
                    ),

                    // CustomListTile(
                    //   title: 'sangthan'.tr,
                    //   onTap: () {
                    //     Get.to(() => SangthanRegistration());
                    //   },
                    // ),
                    // CustomListTile(
                    //   title: 'mediator'.tr,
                    //   onTap: () {
                    //     Get.to(() => GeneralRegister());
                    //   },
                    // ),
                    CustomListTile(
                      title: 'organization'.tr,
                      onTap: () {
                        Get.to(() => SamajikSansathaRegister());
                      },
                    ),
                    // CustomListTile(
                    //   title: 'sample register'.tr,
                    //   onTap: () {
                    //     Get.to(() => SampleRegister());
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
