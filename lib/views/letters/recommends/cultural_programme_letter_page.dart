import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final List<String> inBehalfOf = [
    'festival'.tr,
    'function'.tr,
    'fair'.tr,
    'other'.tr,
  ];
  String? selectedInBehalfOf;
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
                      text: "cultural_programm".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(
                            controller: culturalVM.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(hintText: 'mobile'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(
                            controller: culturalVM.address.value,
                            hintText: 'address'.tr,
                          ),

                          CustomLabelText(text: 'host_detail'.tr),
                          CustomTextFormField(hintText: 'host_detail'.tr),
                          CustomLabelText(text: 'date'.tr),
                          CustomTextFormField(
                            controller: culturalVM.date.value,
                            hintText: 'date'.tr,
                          ),
                          CustomLabelText(text: 'cultural_programme_name'.tr),
                          CustomTextFormField(
                            controller: culturalVM.programName.value,
                            hintText: 'cultural_programme_name'.tr,
                          ),
                          CustomLabelText(
                            text: 'cultural_programme_owner_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: culturalVM.programOwnerName.value,
                            hintText: 'cultural_programme_owner_name'.tr,
                          ),
                          CustomLabelText(text: 'in_behalf_of'.tr),
                          //add dropdown
                          CustomDropdown(
                            items: inBehalfOf,
                            selectedValue: selectedInBehalfOf,
                            onChanged: (value) {
                              setState(() {
                                selectedInBehalfOf = value;
                              });
                            },
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: culturalVM.message.value,
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
