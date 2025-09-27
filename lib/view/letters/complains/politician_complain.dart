import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
class PoliticianComplain extends StatefulWidget {
  const PoliticianComplain({super.key});

  @override
  State<PoliticianComplain> createState() => _PoliticianComplainState();
}

class _PoliticianComplainState extends State<PoliticianComplain> {
  final List<String>complainTypes=[
    'National'.tr,
    'State'.tr,
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
                      text: "compain_of_politician".tr,
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
                          //compalain type
                          CustomLabelText(text: 'complain_type'.tr),
                          //add dropdown here
                          CustomDropdown(items: complainTypes, selectedValue: selectedType, onChanged: (value){
                            setState(() {
                              selectedType = value;
                            });
                          }),

                          CustomLabelText(text: 'politician_name'.tr),
                          CustomTextFormField(hintText: 'politician_name'.tr),
                          
                          CustomLabelText(
                            text: 'designation'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'designation'.tr,
                          ),
                          CustomLabelText(text: 'brief_detail_of_complain'.tr),
                          CustomTextFormField(hintText: 'brief_detail_of_complain'.tr),
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