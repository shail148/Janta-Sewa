import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class AdmissionLetter extends StatefulWidget {
  const AdmissionLetter({super.key});

  @override
  State<AdmissionLetter> createState() => _AdmissionLetterState();
}

class _AdmissionLetterState extends State<AdmissionLetter> {
  final List<String>typesOfAdmission=[
    'school'.tr,
    'college'.tr,
    'institute'.tr,
  ];
  String? selectedType;
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
                      text: "admission".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_admission'.tr),
                          CustomDropdown(items: typesOfAdmission, selectedValue: selectedType, onChanged: (value){

                            setState(() {
                              selectedType = value;
                            });
                          }),
                         // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(hintText: 'full_name'.tr),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'address'.tr),
                          CustomLabelText(text: 'student_name'.tr),
                          CustomTextFormField(hintText: 'student_name'.tr),                    
                          CustomLabelText(text: 'class/Course_name'.tr),
                          CustomTextFormField(hintText: 'class/Course_name'.tr),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                          hintText: 'enter_message'.tr,
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