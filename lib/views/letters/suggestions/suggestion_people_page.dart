import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/suggestionViewModel/suggestion_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionForPeople extends StatefulWidget {
  const SuggestionForPeople({super.key});

  @override
  State<SuggestionForPeople> createState() => _SuggestionForPeopleState();
}

class _SuggestionForPeopleState extends State<SuggestionForPeople> {
  final _formKey = GlobalKey<FormState>();
  final suggestionVM = Get.put(SuggestionViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.btnBgColor,
          size: 20.sp,
        ),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          radius: Radius.circular(10.r),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "suggestion_for_people".tr,
                    color: AppColors.textColor,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelText(
                          isRequired: true,
                          text: 'applicant_name'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.applicantName.value,
                          hintText: 'applicant_name'.tr,
                        ),
                        SizedBox(height: 8.h),
                        CustomLabelText(
                          isRequired: true,
                          text: 'mobile_number'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.applicantMobile.value,
                          hintText: 'mobile_number'.tr,
                        ),
                        SizedBox(height: 8.h),
                        CustomLabelText(isRequired: true, text: 'address'.tr),
                        CustomTextFormField(
                          controller: suggestionVM.address.value,
                          hintText: 'address'.tr,
                        ),
                        SizedBox(height: 8.h),
                        CustomLabelText(
                          isRequired: true,
                          text: 'brief_detail_of_suggestion'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.briefDetails.value,
                          hintText: 'brief_detail_of_suggestion'.tr,
                        ),
                        SizedBox(height: 8.h),
                        CustomLabelText(isRequired: true, text: 'message'.tr),
                        CustomMessageTextFormField(
                          controller: suggestionVM.message.value,
                          hintText: 'enter_message'.tr,
                        ),
                        SizedBox(height: 8.h),
                        CustomLabelText(text: 'upload_signed_documents'.tr),
                        SizedBox(height: 10.h),
                        CustomFileUpload(),
                        SizedBox(height: 10.h),
                        CustomButton(
                          text: 'submit_btn'.tr,
                          textSize: 14.sp,
                          backgroundColor: AppColors.btnBgColor,
                          height: 62.h,
                          width: double.infinity,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //call the api functions
                            }
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
    );
  }
}
