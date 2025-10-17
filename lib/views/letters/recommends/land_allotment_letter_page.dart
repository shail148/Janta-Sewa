import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/land_allotment_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class LandAllotmentLetter extends StatefulWidget {
  const LandAllotmentLetter({super.key});

  @override
  State<LandAllotmentLetter> createState() => _LandAllotmentLetterState();
}

class _LandAllotmentLetterState extends State<LandAllotmentLetter> {
  final landAllotmentVM = Get.put(LandAllotmentViewModel());
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
                      text: "land_allotment".tr,
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
                            controller: landAllotmentVM.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'mobile'.tr),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            validator: FormValidator.validatePhone,
                            controller: landAllotmentVM.applicantMobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'address'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateAddress,
                            controller: landAllotmentVM.address.value,
                            hintText: 'address'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'opted_quarter_department'.tr,
                          ),
                          //add dropdown
                          Obx(
                            () => CustomDropdown(
                              items: landAllotmentVM.quarterDepartments,
                              selectedValue:
                                  landAllotmentVM
                                      .selectedOptedDepartment
                                      .value
                                      .isEmpty
                                  ? null
                                  : landAllotmentVM
                                        .selectedOptedDepartment
                                        .value,
                              onChanged: (value) {
                                if (value != null) {
                                  landAllotmentVM.setOptedDepartment(value);
                                }
                              },
                            ),
                          ),

                          SizedBox(height: 10),
                          CustomLabelText(
                            isRequired: true,
                            text: 'opted_land_address'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateAddress,
                            controller: landAllotmentVM.optedLandAddress.value,
                            hintText: 'opted_land_address'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'reason_for_land_allotment'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: landAllotmentVM.reason.value,
                            hintText: 'reason_for_land_allotment'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: landAllotmentVM.message.value,
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
                              isLoading: landAllotmentVM.isLoading.value,
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
                                landAllotmentVM.landAllotmentApi();
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
