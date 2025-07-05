import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_dropdown.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class HospitalAdmission extends StatefulWidget {
  const HospitalAdmission({super.key});

  @override
  State<HospitalAdmission> createState() => _HospitalAdmissionState();
}

class _HospitalAdmissionState extends State<HospitalAdmission> {
  final List<String>relationWithPatient =[
    'father'.tr,
    'mother'.tr,
    'brother'.tr,
    'wife'.tr
  ];
   String? selectedRelationWithPatient; 
   final List<String>admissionTypes =[
    'government_hospital',
    'private_hospital',
  ];
   String? selectedAdmissionType; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "patient_information".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 24),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'patient_name'.tr),
                          CustomTextFormField(
                            hintText: 'enter_patient_name'.tr,
                          ),
                          CustomLabelText(text: 'name_of_attendent'.tr),
                          CustomTextFormField(hintText: 'name_of_attendent'.tr),
                          CustomLabelText(text: 'relation_with_patient'.tr),
                          CustomDropdown(
                            items: relationWithPatient,
                            selectedValue: selectedRelationWithPatient,
                            onChanged: (value) {
                              setState(() {
                                selectedRelationWithPatient = value;
                              });
                            },
                          ),
                          CustomLabelText(text: 'disease'.tr),
                          CustomTextFormField(hintText: 'disease'.tr),
                          CustomLabelText(text: 'admission_type'.tr),
                          CustomDropdown(
                            items: admissionTypes,
                            selectedValue: selectedAdmissionType,
                            onChanged: (value) {
                              setState(() {
                                selectedAdmissionType = value;
                              });
                            },
                          ),
                          CustomLabelText(text: 'hospital_name'.tr),
                          CustomTextFormField(hintText: 'hospital_name'.tr),
                          CustomLabelText(text: 'hospital_address'.tr),
                          CustomTextFormField(hintText: 'hospital_address'.tr),
                          CustomTextWidget(
                            text: "reference/sourc_of_request".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          CustomLabelText(text: 'name_of_reference'.tr),
                          CustomTextFormField(hintText: 'name_of_reference'.tr),
                          CustomLabelText(
                            text: 'post/designation_of_reference'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'post/designation_of_reference'.tr,
                          ),
                          CustomLabelText(
                            text: 'mobile_number_of_reference'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'mobile_number_of_reference'.tr,
                          ),
                          CustomTextWidget(
                            text: "hospital_contact_person(s)".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          CustomLabelText(text: 'name'.tr),
                          CustomTextFormField(hintText: 'full_name'.tr),

                          CustomLabelText(text: 'desigantion'.tr),
                          CustomTextFormField(hintText: 'desigantion'.tr),

                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_mobile_number'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              //add a login logic
                              Get.to(() => BottomNav());
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
