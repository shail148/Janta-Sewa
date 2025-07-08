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

class LandAllotmentLetter extends StatefulWidget {
  const LandAllotmentLetter({super.key});

  @override
  State<LandAllotmentLetter> createState() => _LandAllotmentLetterState();
}

class _LandAllotmentLetterState extends State<LandAllotmentLetter> {
  final List<String>quarterDepartment=[
    'bsp',
     'bsp'.tr,
    'state govt'.tr,
    'central govt'.tr,
    'private'.tr,
  ];
  String? selectedDepartment;
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
                      text: "land_allotment".tr,
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
                          CustomLabelText(text: 'opted_quarter_department'.tr),
                         //add dropdown
                         CustomDropdown(items: quarterDepartment, selectedValue: selectedDepartment, onChanged: (value){
                          setState(() {
                            selectedDepartment = value;
                          });
                         }),
                          CustomLabelText(text: 'opted_land_adress'.tr),
                          CustomTextFormField(hintText: 'opted_land_adress'.tr),
                          CustomLabelText(text: 'reason_for_land_allotment'.tr),
                          CustomTextFormField(hintText: 'reason_for_land_allotment'.tr),
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