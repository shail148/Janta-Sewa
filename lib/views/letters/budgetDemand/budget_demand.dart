import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/view_models/controllers/budgetDemandViewModel/budget_demand_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';

class BudgetDemand extends StatefulWidget {
  const BudgetDemand({super.key});

  @override
  State<BudgetDemand> createState() => _BudgetDemandState();
}

class _BudgetDemandState extends State<BudgetDemand> {
  final _formKey = GlobalKey<FormState>();
  final budgetDemandVM = Get.put(BudgetDemandViewModel());

  final List<String> requestTypes = [
    'New Government Office'.tr,
    'New Government Major Work'.tr,
  ];

  final List<String> levelOfGovernment = [
    'National Government'.tr,
    'State Government'.tr,
  ];

  String? selectedRequestType;
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
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
                    text: "budget_demand_me".tr,
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
                        // Request For
                        CustomLabelText(
                          isRequired: true,
                          text: 'request_for'.tr,
                        ),
                        CustomDropdown(
                          items: requestTypes,
                          selectedValue: selectedRequestType,

                          onChanged: (value) {
                            setState(() {
                              selectedRequestType = value;
                              budgetDemandVM.selectedRequestFor.value =
                                  value ?? '';
                            });
                          },
                        ),
                        SizedBox(height: 10.h),

                        // Conditional: Office / Major Work Field
                        if (selectedRequestType == requestTypes[0]) ...[
                          CustomLabelText(
                            isRequired: true,
                            text: 'name_of_office_work_demanded'.tr,
                          ),
                          CustomTextFormField(
                            controller:
                                budgetDemandVM.nameOfOfficeWorkDemanded.value,
                            hintText: 'office_work_demanded'.tr,
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  'name of the office work demanded',
                                ),
                          ),
                          SizedBox(height: 8.h),
                        ] else if (selectedRequestType == requestTypes[1]) ...[
                          CustomLabelText(
                            isRequired: true,
                            text: 'name_of_major_work_demanded'.tr,
                          ),
                          CustomTextFormField(
                            controller:
                                budgetDemandVM.nameOfOfficeWorkDemanded.value,
                            hintText: 'major_work_demanded'.tr,
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  'name of major work demanded',
                                ),
                          ),
                          SizedBox(height: 8.h),
                        ],

                        // Applicant Name
                        CustomLabelText(
                          isRequired: true,
                          text: 'applicant_name'.tr,
                        ),
                        CustomTextFormField(
                          controller: budgetDemandVM.applicantName.value,
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
                          controller: budgetDemandVM.applicantMobile.value,
                          hintText: 'mobile_number'.tr,
                          keyboardType: TextInputType.phone,
                          validator: FormValidator.validatePhone,
                        ),
                        SizedBox(height: 8.h),

                        // Address
                        CustomLabelText(isRequired: true, text: 'address'.tr),
                        CustomTextFormField(
                          controller: budgetDemandVM.address.value,
                          hintText: 'address'.tr,
                          validator: FormValidator.validateAddress,
                        ),
                        SizedBox(height: 8.h),

                        // Level of Government
                        CustomLabelText(
                          isRequired: true,
                          text: 'level_of_government'.tr,
                        ),
                        CustomDropdown(
                          items: levelOfGovernment,
                          selectedValue: selectedLevel,

                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value;
                              budgetDemandVM.selectedLevelOfGovernment.value =
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
                          controller: budgetDemandVM.departmentName.value,
                          hintText: 'department_name'.tr,
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'department name',
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Message
                        CustomLabelText(isRequired: true, text: 'message'.tr),
                        CustomMessageTextFormField(
                          controller: budgetDemandVM.message.value,
                          hintText: 'enter_message'.tr,
                          validator: FormValidator.validateMessage,
                        ),
                        SizedBox(height: 8.h),

                        // File Upload
                        CustomLabelText(
                          isRequired: true,
                          text: 'upload_signed_documents'.tr,
                        ),
                        SizedBox(height: 10.h),
                        CustomFileUpload(),
                        SizedBox(height: 20.h),

                        // Submit Button
                        Obx(
                          () => CustomButton(
                            text: budgetDemandVM.isLoading.value
                                ? 'Submitting...'
                                : 'submit_btn'.tr,
                            textSize: 14.sp,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62.h,
                            width: double.infinity,
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                if (selectedRequestType == null ||
                                    selectedRequestType!.trim().isEmpty) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please select Request For',
                                  );
                                  return;
                                }

                                if (selectedLevel == null ||
                                    selectedLevel!.trim().isEmpty) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please select Level of Government',
                                  );
                                  return;
                                }

                                budgetDemandVM.selectedRequestFor.value =
                                    selectedRequestType ?? '';
                                budgetDemandVM.selectedLevelOfGovernment.value =
                                    selectedLevel ?? '';

                                budgetDemandVM.createBudgetDemandLetter();
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
