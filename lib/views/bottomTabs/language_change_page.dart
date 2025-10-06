import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/language_toggle_switch.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_main_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class LanguageChangePage extends StatefulWidget {
  const LanguageChangePage({super.key});

  @override
  State<LanguageChangePage> createState() => _LanguageChangePageState();
}

class _LanguageChangePageState extends State<LanguageChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
         leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.offAll(() => BottomNav());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 10,),
            CustomTextWidget(
              text: 'Change Language',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),

            SizedBox(height: 20,),
            LanguageToggleSwitch(),
          ],
        ),
      ),
    );
  }
}
