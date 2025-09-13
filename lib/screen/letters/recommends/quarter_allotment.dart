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
class QuarterAllotment extends StatefulWidget {
  const QuarterAllotment({super.key});

  @override
  State<QuarterAllotment> createState() => _QuarterAllotmentState();
}
class _QuarterAllotmentState extends State<QuarterAllotment> {
  final List<String>typesOfQuarter=[
    'new'.tr,
    'existing'.tr,
  ];
  String? selectedType;
   final List<String>optedQuarter=[
    'bsp'.tr,
    'state govt'.tr,
    'central govt'.tr,
    'private'.tr,
  ];
  String? selectedQuarter;
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
                      text: "quarter_allotment".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_allotment'.tr),
                          CustomDropdown(items: typesOfQuarter, selectedValue: selectedType, onChanged: (value){

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
                          CustomLabelText(text: 'opted_quarter_department'.tr),
                         //add dropdown
                         CustomDropdown(items: optedQuarter, selectedValue: selectedQuarter, onChanged: (value){
                          setState(() {
                            
                            selectedQuarter = value;
                          });
                         }),
                          CustomLabelText(text: 'from_whom_to_opted'.tr),
                          CustomTextFormField(hintText: 'from_whom_to_opted'.tr),
                          CustomLabelText(text: 'opted_quarter_address'.tr),
                          CustomTextFormField(hintText: 'opted_quarter_address'.tr),
                           CustomLabelText(text: 'reason_for_quarter_allotment'.tr),
                          CustomTextFormField(hintText: 'reason_for_quarter_allotment'.tr),
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