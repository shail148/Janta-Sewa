import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class PendingWorkDemand extends StatefulWidget {
  const PendingWorkDemand({super.key});

  @override
  State<PendingWorkDemand> createState() => _PendingWorkDemandState();
}

class _PendingWorkDemandState extends State<PendingWorkDemand> {
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
                 padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "pending_work_completion-demand".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 16),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'work_name'.tr),
                          CustomTextFormField(hintText: 'work_name'.tr),
                          CustomLabelText(text: 'work_detail'.tr),
                          CustomTextFormField(hintText: 'work_detail'.tr),
                          CustomLabelText(text: 'actual_amount'.tr),
                          CustomTextFormField(hintText: 'actual_amount'.tr),
                          CustomLabelText(text: 'remark'.tr),
                          CustomTextFormField(hintText: 'remark'.tr),
                          CustomLabelText(text: 'demanded_person'.tr),
                          CustomTextFormField(hintText: 'demanded_person'.tr),
                          CustomLabelText(
                            text: 'demanded_person_mobile_number'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'demanded_person_mobile_number'.tr,
                          ), SizedBox(height: 16,),
                          CustomTextWidget(
                            text: 'Location Details',
                            fontsize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                          SizedBox(height: 16,),
                          // CustomLabelText(text: 'pincode'.tr),
                          // CustomTextFormField(hintText: 'enter_pincode'.tr),
                          CustomLabelText(text: 'district'.tr),
                          CustomTextFormField(hintText: 'district'.tr),
                          CustomLabelText(text: 'block'.tr),
                          CustomTextFormField(hintText: 'block'.tr),
                          CustomLabelText(text: 'village'.tr),
                          CustomTextFormField(hintText: 'village'.tr),
                          CustomLabelText(text: 'constituency'.tr),
                          CustomTextFormField(hintText: 'constituency'.tr),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                          hintText: 'enter_message'.tr
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