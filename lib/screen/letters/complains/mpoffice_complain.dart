import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_dropdown.dart';
import 'package:janta_sewa/components/file_upload.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class MpofficeComplain extends StatefulWidget {
  const MpofficeComplain({super.key});

  @override
  State<MpofficeComplain> createState() => _MpofficeComplainState();
}

class _MpofficeComplainState extends State<MpofficeComplain> {
 final List<String>complainTypes=[
    'arrangement'.tr,
    'Staff'.tr,
    'other'.tr  ];
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
                      text: "compain_of_mp_office".tr,
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
                              if (selectedType == 'other') {

                                 
                                // Optionally, you can trigger a rebuild or set a flag if needed
                              }
                            });
                          }),
                          CustomLabelText(text: 'brief_detail_of_complain'.tr),
                          CustomTextFormField(
                            hintText: 'brief_detail_of_complain'.tr,
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