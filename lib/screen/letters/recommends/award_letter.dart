import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_dropdown.dart';
import 'package:janta_sewa/components/file_upload.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class AwardLetter extends StatefulWidget {
  const AwardLetter({super.key});

  @override
  State<AwardLetter> createState() => _AwardLetterState();
}

class _AwardLetterState extends State<AwardLetter> {
  final List<String>typesOfAward=[
    'national'.tr,
    'state'.tr,
  ];
  String? selectedType ;
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "award".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_award'.tr),
                          CustomDropdown(items: typesOfAward, selectedValue: selectedType, onChanged: (value){

                           setState(() {
                              selectedType = value;
                           });
                          }),
                         // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(hintText: 'full_name'.tr),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                           CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'address'.tr),      
                          CustomLabelText(text: 'career_achievement'.tr),
                          CustomTextFormField(hintText: 'career_achievement'.tr),          
                          CustomLabelText(text: 'award_name'.tr),
                          CustomTextFormField(hintText: 'award_name'.tr),
                           CustomLabelText(text: 'brief_details'.tr),
                          CustomTextFormField(hintText: 'brief_details'.tr),
                          CustomLabelText(text: 'upload_signed_documents'.tr),
                          SizedBox(height: 10),
                          CustomFileUpload(),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
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