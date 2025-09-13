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

class PostingLetter extends StatefulWidget {
  const PostingLetter({super.key});

  @override
  State<PostingLetter> createState() => _PostingLetterState();
}

class _PostingLetterState extends State<PostingLetter> {
  final List<String>typesOfPosting=[
    'new'.tr,
    'revised'.tr,
  ];
  final List<String>department=[
    'bsp'.tr,
    'state govt'.tr,
    'central govt'.tr,
    'private'.tr,
  ];
  String? selectedType;
  String? seletedDepartment;
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
                      text: "posting".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_posting'.tr),
                          CustomDropdown(items: typesOfPosting, selectedValue: selectedType, onChanged: (value){

                            setState(() {
                              selectedType = value;
                            });
                          }),
                         // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(hintText: 'full_name'.tr),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                          CustomLabelText(text: 'designation'.tr),
                          CustomTextFormField(hintText: 'designation'.tr),
                          CustomLabelText(text: 'department'.tr),
                         //add dropdown
                         CustomDropdown(items: department, selectedValue: seletedDepartment, onChanged: (value){
                          setState(() {
                            seletedDepartment = value;
                          });
                         }),
                          CustomLabelText(text: 'posted_office'.tr),
                          CustomTextFormField(hintText: 'posted_office'.tr),
                           CustomLabelText(text: 'opted_office'.tr),
                          CustomTextFormField(hintText: 'opted_office'.tr),
                           CustomLabelText(text: 'reason_for_transfer'.tr),
                          CustomTextFormField(hintText: 'reason_for_transfer'.tr),
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