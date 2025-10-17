import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
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
  final _formKey = GlobalKey<FormState>();
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(
                            isRequired: true,
                            text: 'job_recommendation_type'.tr,
                          ),
                          Obx(
                            () => CustomDropdown(
                              items: jobVm.recommendationTypes,
                              selectedValue:
                                  jobVm.selectedRecommendationType.value.isEmpty
                                  ? null
                                  : jobVm.selectedRecommendationType.value,
                              onChanged: (value) {
                                if (value != null) {
                                  jobVm.selectedRecommendationType(value);
                                }
                              },
                            ),
                          ),

                          CustomLabelText(
                            isRequired: true,
                            text: 'applicant_name'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateName,
                            controller: jobVm.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'mobile'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validatePhone,
                            controller: jobVm.applicantMobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'address'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateAddress,
                            controller: jobVm.address.value,
                            hintText: 'address'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'post_name'.tr,
                          ),
                          CustomTextFormField(
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  "Post Name",
                                ),
                            controller: jobVm.postName.value,
                            hintText: 'post_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'department'.tr,
                          ),
                          //add dropdown
                          Obx(
                            () => CustomDropdown(
                              items: jobVm.departmentTypes,
                              selectedValue:
                                  jobVm.selectedDepartment.value.isEmpty
                                  ? null
                                  : jobVm.selectedDepartment.value,
                              onChanged: (value) {
                                if (value != null) {
                                  jobVm.selectedDepartment(value);
                                }
                              },
                            ),
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: jobVm.message.value,
                            hintText: 'enter_message'.tr,
                          ),
                          CustomLabelText(text: 'upload_signed_documents'.tr),
                          SizedBox(height: 10),
                          CustomFileUpload(),
                          SizedBox(height: 10),
                          Obx(
                            () => CustomButton(
                              text: jobVm.isLoading.value
                                  ? 'Submitting...'
                                  : 'submit_btn'.tr,
                              textSize: 14,
                              isLoading: jobVm.isLoading.value,
                              backgroundColor: AppColors.btnBgColor,
                              height: 62,
                              width: double.infinity,
                              onPressed: () {
                                final valid =
                                    _formKey.currentState?.validate() ?? false;
                                if (!valid) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please fix the Errors in the Form',
                                  );
                                  return;
                                }
                                jobVm.jobRecommendationApi();
                              },
                            ),
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
