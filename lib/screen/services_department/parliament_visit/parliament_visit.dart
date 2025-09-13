import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/file_upload.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/message_text_form_widget.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ParliamentVisit extends StatefulWidget {
  const ParliamentVisit({super.key});

  @override
  State<ParliamentVisit> createState() => _ParliamentVisitState();
}

class _ParliamentVisitState extends State<ParliamentVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(leftIcon: Icon(Icons.arrow_back_ios,color: AppColors.btnBgColor,),onLeftTap: () {
        Get.back();
        
      },),
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
                      text: "parliament_visit_menu".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'headed_person_name'.tr,isRequired: true,),
                          CustomTextFormField(
                            hintText: 'headed_person_name'.tr,
                          ),
                          CustomLabelText(
                            text: 'headed_person_mobile_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            hintText: 'headed_person_mobile_number'.tr,
                          ),

                          CustomLabelText(text: 'state'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'enter_state'.tr),

                          CustomLabelText(text: 'district'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'enter_district'.tr),

                          CustomLabelText(text: 'block'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'enter_block'.tr),

                          CustomLabelText(text: 'city_village'.tr),
                          CustomTextFormField(
                            hintText: 'enter_city_village'.tr,
                          ),

                          CustomLabelText(text: 'ward_number'.tr),
                          CustomTextFormField(hintText: 'enter_ward_number'.tr),

                          CustomLabelText(text: 'pincode'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'enter_pincode'.tr),

                          CustomLabelText(text: 'constituency'.tr),
                          CustomTextFormField(hintText: 'constituency'.tr),
                          CustomLabelText(text: 'date_of_visit'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'date_of_visit'.tr),
                          CustomLabelText(text: 'time_of_visit'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'time_of_visit'.tr),
                          CustomLabelText(text: 'total_number_of_members'.tr),
                          CustomTextFormField(
                            hintText: 'total_number_of_members'.tr,
                          ),

                          CustomLabelText(text: 'parliament_name'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'parliament_name'.tr),

                          CustomLabelText(text: 'parliament_mobile_number'.tr,isRequired: true,),
                          CustomTextFormField(
                            hintText: 'parliament_mobile_number'.tr,
                          ),

                           CustomLabelText(text: 'message'.tr),
                           CustomMessageTextFormField(
                          hintText: 'enter_message'.tr,
                          ),

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
