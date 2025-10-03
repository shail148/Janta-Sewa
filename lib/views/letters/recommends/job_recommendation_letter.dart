import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/job_recommendation_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class JobRecommendationLetter extends StatefulWidget {
  const JobRecommendationLetter({super.key});

  @override
  State<JobRecommendationLetter> createState() =>
      _JobRecommendationLetterState();
}

class _JobRecommendationLetterState extends State<JobRecommendationLetter> {
  final jobVm = Get.put(JobRecommendationViewModel());
  final List<String> recommendationType = [
    'Government'.tr,
    'Private'.tr,
    'autonomous_body'.tr,
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
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "job_recommendation".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'job_recommendation_type'.tr),
                          CustomDropdown(
                            items: recommendationType,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(
                            controller: jobVm.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(
                            controller: jobVm.applicantMobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(
                            controller: jobVm.address.value,
                            hintText: 'address'.tr,
                          ),
                          CustomLabelText(text: 'post_name'.tr),
                          CustomTextFormField(
                            controller: jobVm.postName.value,
                            hintText: 'post_name'.tr,
                          ),
                          CustomLabelText(text: 'department'.tr),
                          //add dropdown
                          CustomDropdown(
                            items: recommendationType,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: jobVm.message.value,
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
                            onPressed: () {},
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
