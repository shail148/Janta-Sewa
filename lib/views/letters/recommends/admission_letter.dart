import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/admission_letter_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class AdmissionLetter extends StatefulWidget {
  const AdmissionLetter({super.key});

  @override
  State<AdmissionLetter> createState() => _AdmissionLetterState();
}

class _AdmissionLetterState extends State<AdmissionLetter> {
  final admissionVM = Get.put(AdmissionLetterViewModel());
  final _formKey = GlobalKey<FormState>();
  final List<String> typesOfAdmission = [
    'school'.tr,
    'college'.tr,
    'institute'.tr,
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
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "admission".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_admission'.tr),
                          CustomDropdown(
                            items: typesOfAdmission,
                            selectedValue: admissionVM.typeOfAdmission.value
                                .toString(),
                            onChanged: (value) {
                              setState(() {
                                admissionVM.typeOfAdmission.value =
                                    value as TextEditingController;
                              });
                            },
                          ),
                          // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'applicant_name'.tr),
                          CustomTextFormField(
                            controller: admissionVM.applicantName.value,
                            hintText: 'full_name'.tr,
                          ),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(
                            controller: admissionVM.applicantMobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(
                            controller: admissionVM.address.value,
                            hintText: 'address'.tr,
                          ),
                          CustomLabelText(text: 'student_name'.tr),
                          CustomTextFormField(
                            controller: admissionVM.studentName.value,
                            hintText: 'student_name'.tr,
                          ),
                          CustomLabelText(text: 'class/Course_name'.tr),
                          CustomTextFormField(
                            controller: admissionVM.courseName.value,
                            hintText: 'class/Course_name'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: admissionVM.message.value,
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
                            onPressed: () {
                              //add a login logic
                              if (_formKey.currentState!.validate()) {
                                //implement the api call here
                              }
                            },
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
