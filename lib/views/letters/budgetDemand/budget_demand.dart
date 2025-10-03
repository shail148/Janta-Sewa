import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/views/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class BudgetDemand extends StatefulWidget {
  const BudgetDemand({super.key});

  @override
  State<BudgetDemand> createState() => _BudgetDemandState();
}

class _BudgetDemandState extends State<BudgetDemand> {
  final List<String> requestTypes = [
    'new government office'.tr,
    'new government major work'.tr,
  ];
  String? selectedRequestType;
    final List<String>levelOfGovernment=[
    'National Government',
    'State Government',
  ];
  String? selectedLevelOfGovernment;
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "budget_demand_me".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'requested for'.tr),
                          CustomDropdown(
                            items: requestTypes,
                            selectedValue: selectedRequestType,
                            onChanged: (value) {
                              setState(() {
                                selectedRequestType = value;
                              });
                            },
                          ),
                          if (selectedRequestType == requestTypes[0]) ...[
                            CustomLabelText(text: 'Name of the Office Work Demanded'.tr),
                            CustomTextFormField(hintText: 'office work demanded'.tr),
                          ],
                          if (selectedRequestType == requestTypes[1]) ...[
                           CustomLabelText(text: 'name of the major Work Demanded'.tr),
                            CustomTextFormField(hintText: 'major work demanded'.tr),
                          ],
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(hintText: 'mobile_number'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'address'.tr),
                          CustomLabelText(text: 'level_of_government'.tr),
                         //add dropdown here
                         CustomDropdown(items: levelOfGovernment, selectedValue: selectedLevelOfGovernment, onChanged: (value){
                            setState(() {
                              selectedLevelOfGovernment = value;
                            });
                          }),
                          CustomLabelText(text: 'department_name'.tr),
                          CustomTextFormField(hintText: 'department_name'.tr),
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
                              //add a login logic
                              Get.to(() => BottomNav());
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
