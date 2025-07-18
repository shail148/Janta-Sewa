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

class CulturalProgrammeLetter extends StatefulWidget {
  const CulturalProgrammeLetter({super.key});

  @override
  State<CulturalProgrammeLetter> createState() => _CulturalProgrammeLetterState();
}

class _CulturalProgrammeLetterState extends State<CulturalProgrammeLetter> {
  final List<String> inBehalfOf = [
    'festival'.tr,
    'function'.tr,
    'fair'.tr,
    'other'.tr,
  ];  
  String? selectedInBehalfOf;
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
                      text: "cultural_programm".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'address'.tr),
                         
                          CustomLabelText(text: 'host_detail'.tr),
                          CustomTextFormField(hintText: 'host_detail'.tr),
                           CustomLabelText(text: 'date'.tr),
                          CustomTextFormField(hintText: 'date'.tr),
                           CustomLabelText(text: 'cultural_programme_name'.tr),
                          CustomTextFormField(hintText: 'cultural_programme_name'.tr),
                           CustomLabelText(text: 'cultural_programme_owner_name'.tr),
                          CustomTextFormField(hintText: 'cultural_programme_owner_name'.tr),
                           CustomLabelText(text: 'in_behalf_of'.tr),
                         //add dropdown
                          CustomDropdown(
                            items: inBehalfOf,
                            selectedValue: selectedInBehalfOf,
                            onChanged: (value) {
                              setState(() {
                                selectedInBehalfOf = value;
                              });
                            },
                          ),
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