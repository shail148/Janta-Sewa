import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

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
    'government_hospital'.tr,
    'private_hospital'.tr,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "patient_information".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 16),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'patient_name'.tr,isRequired: true,),
                          CustomTextFormField(
                            hintText: 'enter_patient_name'.tr,
                          ),
                          CustomLabelText(text: 'name_of_attendent'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'name_of_attendent'.tr),
                          CustomLabelText(text: 'relation_with_patient'.tr,isRequired: true,),
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
                          CustomLabelText(text: 'hospital_name'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'hospital_name'.tr),
                          CustomLabelText(text: 'hospital_address'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'hospital_address'.tr),
                          SizedBox(height: 16),
                          CustomTextWidget(
                            text: "reference/sourc_of_request".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          CustomLabelText(text: 'name_of_reference'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'name_of_reference'.tr),
                          CustomLabelText(
                            text: 'post/designation_of_reference'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'post/designation_of_reference'.tr,
                          ),
                          CustomLabelText(
                            text: 'mobile_number_of_reference'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            hintText: 'mobile_number_of_reference'.tr,
                          ),
                             SizedBox(height: 16),
                          CustomTextWidget(
                            text: "hospital_contact_person(s)".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          CustomLabelText(text: 'name'.tr),
                          CustomTextFormField(hintText: 'full_name'.tr),

                          CustomLabelText(text: 'desigantion'.tr,isRequired: true,),
                          CustomTextFormField(hintText: 'desigantion'.tr),

                          CustomLabelText(text: 'mobile_number'.tr,isRequired: true,),
                          CustomTextFormField(
                            hintText: 'enter_mobile_number'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                          hintText: 'enter_message'.tr,
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
