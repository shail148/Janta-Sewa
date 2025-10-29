import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/suggestionViewModel/mp_office_suggestion_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
import 'package:janta_sewa/utils/form_validator.dart'; // optional shared validator

class SuggestionForMPOffice extends StatefulWidget {
  const SuggestionForMPOffice({super.key});

  @override
  State<SuggestionForMPOffice> createState() => _SuggestionForMPOfficeState();
}

class _SuggestionForMPOfficeState extends State<SuggestionForMPOffice> {
  final _formKey = GlobalKey<FormState>();
  final suggestionVM = Get.put(MpOfficeSuggestionViewModel());

  final List<String> suggestionType = [
    'Public Issue'.tr,
    'Constituency Work'.tr,
    'Development Request'.tr,
    'Other'.tr,
  ];

  String? selectedType;

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
                    text: "suggestion_for_mp_office".tr,
                    color: AppColors.textColor,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h),

                  /// FORM
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
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'applicant name',
                          ),
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
                          validator: (value) =>
                              FormValidator.validateRequired(value, 'address'),
                        ),
                        SizedBox(height: 8.h),

                        // Suggestion Type
                        CustomLabelText(
                          isRequired: true,
                          text: 'suggestion_type'.tr,
                        ),
                        CustomDropdown(
                          items: suggestionType,
                          selectedValue: selectedType,

                          onChanged: (value) {
                            setState(() {
                              selectedType = value;
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
                                if (selectedType == null ||
                                    selectedType!.trim().isEmpty) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please select suggestion type',
                                  );
                                  return;
                                }
                                suggestionVM.selectedSuggestionFor.value =
                                    selectedType ?? '';
                                suggestionVM.submitMpOfficeSuggestion();
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
