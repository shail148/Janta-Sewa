import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/suggestionViewModel/suggestion_gov_scheme_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';

class SuggestionForGovScheme extends StatefulWidget {
  const SuggestionForGovScheme({super.key});

  @override
  State<SuggestionForGovScheme> createState() => _SuggestionForGovSchemeState();
}

class _SuggestionForGovSchemeState extends State<SuggestionForGovScheme> {
  final _formKey = GlobalKey<FormState>();
  final suggestionVM = Get.put(GovtSchemeSuggestionViewModel());

  final List<String> suggestionForScheme = [
    'New Scheme Suggestion'.tr,
    'Existing Scheme Improvement'.tr,
    'Other'.tr,
  ];

  String? selectedSuggestionType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.btnBgColor,
          size: 20.sp,
        ),
        onLeftTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          radius: Radius.circular(10.r),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "suggestion_for_Gov_scheme".tr,
                    color: AppColors.textColor,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h),

                  /// FORM START
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Applicant Name
                        CustomLabelText(
                          isRequired: true,
                          text: 'applicant_name'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.applicantName.value,
                          hintText: 'applicant_name'.tr,
                          validator: FormValidator.validateName,
                        ),
                        SizedBox(height: 8.h),

                        // Mobile Number
                        CustomLabelText(
                          isRequired: true,
                          text: 'mobile_number'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.mobileNumber.value,
                          hintText: 'mobile_number'.tr,
                          keyboardType: TextInputType.phone,
                          validator: FormValidator.validatePhone,
                        ),
                        SizedBox(height: 8.h),

                        // Address
                        CustomLabelText(isRequired: true, text: 'address'.tr),
                        CustomTextFormField(
                          controller: suggestionVM.address.value,
                          hintText: 'address'.tr,
                          validator: FormValidator.validateAddress,
                        ),
                        SizedBox(height: 8.h),

                        // Suggestion For Dropdown
                        CustomLabelText(
                          isRequired: true,
                          text: 'suggestion_for'.tr,
                        ),
                        CustomDropdown(
                          items: suggestionForScheme,
                          selectedValue: selectedSuggestionType,

                          onChanged: (value) {
                            setState(() {
                              selectedSuggestionType = value;
                              suggestionVM.selectedSuggestionFor.value =
                                  value ?? '';
                            });
                          },
                        ),
                        SizedBox(height: 8.h),

                        // Department Name
                        CustomLabelText(
                          isRequired: true,
                          text: 'department_name'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.departmentName.value,
                          hintText: 'department_name'.tr,
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'department name',
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Scheme Name
                        CustomLabelText(
                          isRequired: true,
                          text: 'scheme_name'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.schemeName.value,
                          hintText: 'scheme_name'.tr,
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'scheme name',
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Brief Detail
                        CustomLabelText(
                          isRequired: true,
                          text: 'brief_detail_of_suggestion'.tr,
                        ),
                        CustomTextFormField(
                          controller: suggestionVM.briefDetail.value,
                          hintText: 'brief_detail_of_suggestion'.tr,
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'brief detail',
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Message
                        CustomLabelText(isRequired: true, text: 'message'.tr),
                        CustomMessageTextFormField(
                          controller: suggestionVM.message.value,
                          hintText: 'enter_message'.tr,
                          validator: FormValidator.validateMessage,
                        ),
                        SizedBox(height: 8.h),
                        // File Upload
                        CustomLabelText(text: 'upload_signed_documents'.tr),
                        SizedBox(height: 10.h),
                        CustomFileUpload(),
                        SizedBox(height: 20.h),

                        // Submit Button
                        Obx(
                          () => CustomButton(
                            text: suggestionVM.isLoading.value
                                ? 'Submitting...'
                                : 'submit_btn'.tr,
                            textSize: 14.sp,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62.h,
                            width: double.infinity,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                if (selectedSuggestionType == null ||
                                    selectedSuggestionType!.trim().isEmpty) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please select suggestion type',
                                  );
                                  return;
                                }
                                suggestionVM.selectedSuggestionFor.value =
                                    selectedSuggestionType ?? '';
                                suggestionVM.submitGovtSchemeSuggestion();
                              }
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
    );
  }
}
