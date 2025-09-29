import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/language_toggle_switch.dart';
import 'package:janta_sewa/localization/language_controller.dart';
import 'package:janta_sewa/view/authPages/login_page.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class LanguageSwitch extends StatefulWidget {

const  LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();

}
class _LanguageSwitchState extends State<LanguageSwitch> {
  final LanguageController languageController = Get.put(LanguageController());

  @override
  void initState(){
    super.initState();
    //store language in shared preferences
    languageController.currentLocale.listen((locale) {
      if (locale.languageCode == 'hi') {
        languageController.toggleLanguage(true);
      } else {
        languageController.toggleLanguage(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: "Janta Sewa".tr,
          fontsize: 18.sp,
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Image.asset(
              'assets/images/indialogo.png',
              height: 98.h,
              width: 62.w,
            ),
            SizedBox(height: 40.h),
            CustomTextWidget(
              text: 'Select Your Langauge',
              fontsize: 16,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: 'अपनी भाषा का चयन करें',
              fontsize: 20.sp,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageToggleSwitch(),
              ],
            ),
            SizedBox(height: 28.h),
            Image.asset('assets/images/bjp.png', height: 100.h, width: 100.w),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomButton(
                text: 'next'.tr,
                textSize: 16,
                width: double.infinity,
                height: 50,
                onPressed: () {
                  Get.to(() => LoginPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
