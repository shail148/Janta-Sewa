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
class SuggestionForGovDepartment extends StatefulWidget {
  const SuggestionForGovDepartment({super.key});

  @override
  State<SuggestionForGovDepartment> createState() => _SuggestionForGovDepartmentState();
}

class _SuggestionForGovDepartmentState extends State<SuggestionForGovDepartment> {
   final List<String>suggestionForDepartment =[
    'national government'.tr,
    'state government'.tr,
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
                      text: "suggestion_for_government_department".tr,
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
                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(hintText: 'mobile_number'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'address'.tr),
                          CustomLabelText(text: 'suggestion_for'.tr),
                          CustomDropdown(items: suggestionForDepartment, selectedValue: selectedType, onChanged: (value){
                            setState(() {
                              selectedType = value;
                            });
                          }),
                          CustomLabelText(text: 'department_name'.tr),
                          CustomTextFormField(hintText: 'department_name'.tr),
                          CustomLabelText(text: 'brief_detail_of_suggestion'.tr),
                          CustomTextFormField(
                            hintText: 'brief_detail_of_suggestion'.tr,
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