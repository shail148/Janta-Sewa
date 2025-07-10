import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/auth_page/login_page.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isHindi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: "Janta Sewa".tr,
          fontsize: 24,
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset('assets/images/indialogo.png', height: 300, width: 150),
            SizedBox(height: 40),
            CustomTextWidget(
              text: 'Select Your Langauge',
              fontsize: 14,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: 'अपनी भाषा का चयन करें',
              fontsize: 14,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 30),

            /// Language Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'English',
                  fontsize: 14,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 10),
                Transform.scale(
                  scale: 1.2, // Adjust the scale factor as needed
                  child: Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeTrackColor: AppColors.btnBgColor,
                    trackOutlineColor: WidgetStateProperty.all(
                      AppColors.btnBgColor,
                    ),
                    inactiveThumbColor: Colors.grey,
                    value: isHindi,
                    onChanged: (value) {
                      setState(() {
                        isHindi = value;
                        if (isHindi) {
                          Get.updateLocale(Locale('hi', 'IN'));
                        } else {
                          Get.updateLocale(Locale('en', 'US'));
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                CustomTextWidget(
                  text: 'हिंदी',
                  fontsize: 14,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 30),
            Image.asset('assets/images/bjp.png', height: 150, width: 150),
          Spacer(),
            CustomButton(
              text: 'next'.tr,
              textSize: 16,
              width: double.infinity,
              height: 50,
              onPressed: () {
                
                Get.to(() => LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
