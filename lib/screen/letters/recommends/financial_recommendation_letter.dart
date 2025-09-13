import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_dropdown.dart';
import 'package:janta_sewa/components/file_upload.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/message_text_form_widget.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class FinancialRecommendationLetter extends StatefulWidget {
  const FinancialRecommendationLetter({super.key});

  @override
  State<FinancialRecommendationLetter> createState() => _FinancialRecommendationLetterState();
}

class _FinancialRecommendationLetterState extends State<FinancialRecommendationLetter> {
  final List<String>department=[
   'state govt'.tr,
    'National Government'.tr,
    'private'.tr,
  ];
  String? selectedDepartment;
  final List<String>reasonOfProblem=[
    'health'.tr,
    'education'.tr,
    'employment'.tr,
    'samiti'.tr,
    'sports'.tr,
    'other'.tr,
  ];
  String? selectedProblem;
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
                      text: "financial_recommendation".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'department'.tr),
                          CustomDropdown(items: department, selectedValue: selectedDepartment, onChanged: (value){

                            setState(() {
                              selectedDepartment = value;
                            });
                          }),
                          CustomLabelText(text: 'applicant_name'.tr),
                         CustomTextFormField(hintText: 'applicant_name'.tr),
                          
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                         
                          CustomLabelText(text: 'reason_of_problem'.tr),
                         
                         CustomDropdown(items: reasonOfProblem, selectedValue: selectedProblem, onChanged: (value){
                          setState(() {
                            selectedProblem = value;
                          });
                         }),
                        
                           CustomLabelText(text: 'tentative_amount'.tr),
                          CustomTextFormField(hintText: 'tentative_amount'.tr),
                           CustomLabelText(text: 'remarks'.tr),
                          CustomTextFormField(hintText: 'remarks'.tr),
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