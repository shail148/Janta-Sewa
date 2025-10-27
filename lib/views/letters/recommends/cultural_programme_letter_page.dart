import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/cultural_programme_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class CulturalProgrammeLetter extends StatefulWidget {
  const CulturalProgrammeLetter({super.key});

  @override
  State<CulturalProgrammeLetter> createState() =>
      _CulturalProgrammeLetterState();
}
class _CulturalProgrammeLetterState extends State<CulturalProgrammeLetter> {
  final culturalVM = Get.put(CulturalProgrammeViewModel());
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "cultural_program".tr,
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
                            text: 'applicant_name'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateName,
                            controller: culturalVM.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'mobile'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validatePhone,
                            keyboardType: TextInputType.phone,
                            controller: culturalVM.applicantMobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'address'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateAddress,
                            controller: culturalVM.address.value,
                            hintText: 'address'.tr,
                          ),

                          CustomLabelText(
                            isRequired: true,
                            text: 'host_detail'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: culturalVM.hostDetail.value,
                            hintText: 'host_detail'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'date'.tr),
                          CustomTextFormField(
                            validator: (value) =>
                                FormValidator.validateRequired(value, "Date"),
                            controller: culturalVM.date.value,
                            hintText: 'date'.tr,
                          ),
                          CustomLabelText(text: 'cultural_programme_name'.tr),
                          CustomTextFormField(
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  "Cultural Programme Name",
                                ),
                            controller: culturalVM.programName.value,
                            hintText: 'cultural_programme_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'cultural_programme_owner_name'.tr,
                          ),
                          CustomTextFormField(
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  "Cultural Programme Owner Name",
                                ),
                            controller: culturalVM.programOwnerName.value,
                            hintText: 'cultural_programme_owner_name'.tr,
                          ),
                          CustomLabelText(text: 'in_behalf_of'.tr),
                          //add dropdown
                          Obx(
                            () => CustomDropdown(
                              items: culturalVM.inBehalfOf,
                              selectedValue:
                                  culturalVM.selectedInBehalfOf.value.isEmpty
                                  ? null
                                  : culturalVM.selectedInBehalfOf.value,
                              onChanged: (value) {
                                culturalVM.selectedInBehalfOf(value!);
                              },
                            ),
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: culturalVM.message.value,
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
                              isLoading: culturalVM.isLoading.value,
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
                                culturalVM.culturalProgrammeApi();
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
