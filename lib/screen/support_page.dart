import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
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
                      text: "Support Page".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),
                  
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