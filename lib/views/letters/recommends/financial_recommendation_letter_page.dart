import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/financial_recommendation_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class FinancialRecommendationLetter extends StatefulWidget {
  const FinancialRecommendationLetter({super.key});

  @override
  State<FinancialRecommendationLetter> createState() =>
      _FinancialRecommendationLetterState();
}

class _FinancialRecommendationLetterState
    extends State<FinancialRecommendationLetter> {
  final financialVM = Get.put(FinancialRecommendationViewModel());
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
                      text: "financial_recommendation".tr,
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
                            text: 'department'.tr,
                          ),
                          Obx(
                            () => CustomDropdown(
                              items: financialVM.department,
                              selectedValue:
                                  financialVM.selectedDepartment.value.isEmpty
                                  ? null
                                  : financialVM.selectedDepartment.value,

                              onChanged: (value) {
                                if (value != null) {
                                  financialVM.selectedDepartment(value);
                                }
                              },
                            ),
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'applicant_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: financialVM.applicantName.value,
                            validator: FormValidator.validateName,
                            hintText: 'applicant_name'.tr,
                          ),

                          CustomLabelText(isRequired: true, text: 'mobile'.tr),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,  
                            controller: financialVM.applicantMobile.value,
                            validator: FormValidator.validatePhone,
                            hintText: 'mobile'.tr,
                          ),

                          CustomLabelText(
                            isRequired: true,
                            text: 'reason_of_problem'.tr,
                          ),

                          Obx(
                            () => CustomDropdown(
                              items: financialVM.reasonOfProblem,
                              selectedValue:
                                  financialVM
                                      .selectedReasonOfProblem
                                      .value
                                      .isEmpty
                                  ? null
                                  : financialVM.selectedReasonOfProblem.value,

                              onChanged: (value) {
                                if (value != null) {
                                  financialVM.selectedReasonOfProblem(value);
                                }
                              },
                            ),
                          ),

                          CustomLabelText(
                            isRequired: true,
                            text: 'tentative_amount'.tr,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.number,
                            controller: financialVM.tentativeAmount.value,
                            hintText: 'tentative_amount'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'remarks'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: financialVM.remarks.value,
                            hintText: 'remarks'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: financialVM.message.value,
                            hintText: 'enter_message'.tr,
                          ),
                          CustomLabelText(text: 'upload_signed_documents'.tr),
                          SizedBox(height: 10),
                          CustomFileUpload(),
                          SizedBox(height: 10),
                          Obx(
                            () => CustomButton(
                              text: 'submit_btn'.tr,
                              textSize: 14,
                              isLoading: financialVM.isLoading.value,
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
                                financialVM.financialRecommendationApi();
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
