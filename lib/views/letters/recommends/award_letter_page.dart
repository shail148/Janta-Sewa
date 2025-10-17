import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/award_letter_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class AwardLetter extends StatefulWidget {
  const AwardLetter({super.key});

  @override
  State<AwardLetter> createState() => _AwardLetterState();
}

class _AwardLetterState extends State<AwardLetter> {
  final awardVM = Get.put(AwardLetterViewModel());

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
                      text: "award".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_award'.tr),
                          Obx(
                            () => CustomDropdown(
                              items: awardVM.typesOfAward,
                              selectedValue:
                                  awardVM.selectedAwardType.value.isEmpty
                                  ? null
                                  : awardVM.selectedAwardType.value,
                              onChanged: (value) {
                                awardVM.selectedAwardType(value!);
                              },
                            ),
                          ),
                          // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(
                            isRequired: true,
                            text: 'full_name'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateName,
                            controller: awardVM.fullName.value,
                            hintText: 'full_name'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'mobile'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validatePhone,
                            controller: awardVM.mobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'address'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateAddress,
                            controller: awardVM.address.value,
                            hintText: 'address'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'career_achievement'.tr,
                          ),
                          CustomTextFormField(
                            validator: (value) =>
                                FormValidator.validateRequired(
                                  value,
                                  "Career Achievement",
                                ),
                            controller: awardVM.careerAchievement.value,
                            hintText: 'career_achievement'.tr,
                          ),
                          CustomLabelText(text: 'award_name'.tr),
                          CustomTextFormField(
                            controller: awardVM.awardName.value,
                            hintText: 'award_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'brief_details'.tr,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: awardVM.reason.value,
                            hintText: 'brief_details'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            validator: FormValidator.validateMessage,
                            controller: awardVM.message.value,
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
                              isLoading: awardVM.isLoading.value,
                              backgroundColor: AppColors.btnBgColor,
                              height: 62,
                              width: double.infinity,
                              onPressed: () {
                                awardVM.awardLetterApi();
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
