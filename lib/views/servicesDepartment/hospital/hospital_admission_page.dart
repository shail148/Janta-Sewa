import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/servicesDepartment/hospital_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class HospitalAdmission extends StatelessWidget {
  HospitalAdmission({super.key});

  final hospitalVM = Get.put(HospitalViewModel());
  final _formKey = GlobalKey<FormState>();

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
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Form(
                key: _formKey,
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

                    /// ✅ Patient Name
                    CustomLabelText(text: 'patient_name'.tr, isRequired: true),
                    CustomTextFormField(
                      validator: FormValidator.validateName,
                      controller: hospitalVM.patientName.value,
                      hintText: 'enter_patient_name'.tr,
                    ),

                    /// ✅ Attendant Name
                    CustomLabelText(
                      text: 'name_of_attendent'.tr,
                      isRequired: true,
                    ),
                    CustomTextFormField(
                      controller: hospitalVM.nameOfAttendant.value,
                      hintText: 'name_of_attendent'.tr,
                    ),

                    /// ✅ Relation With Patient (Dropdown)
                    CustomLabelText(
                      text: 'relation_with_patient'.tr,
                      isRequired: true,
                    ),
                    Obx(
                      () => CustomDropdown(
                        items: hospitalVM.relationOptions,
                        selectedValue: hospitalVM.selectedRelation.value.isEmpty
                            ? null
                            : hospitalVM.selectedRelation.value,
                        onChanged: (value) {
                          hospitalVM.setRelation(value!);
                        },
                      ),
                    ),

                    /// ✅ Disease
                    CustomLabelText(isRequired: true, text: 'disease'.tr),
                    CustomTextFormField(
                      controller: hospitalVM.disease.value,
                      hintText: 'disease'.tr,
                    ),

                    /// ✅ Admission Type (Dropdown)
                    CustomLabelText(
                      isRequired: true,
                      text: 'admission_type'.tr,
                    ),
                    Obx(
                      () => CustomDropdown(
                        items: hospitalVM.admissionTypes,
                        selectedValue:
                            hospitalVM.selectedAdmissionType.value.isEmpty
                            ? null
                            : hospitalVM.selectedAdmissionType.value,
                        onChanged: (value) {
                          hospitalVM.setAdmissionType(value!);
                        },
                      ),
                    ),

                    /// ✅ Hospital Name
                    CustomLabelText(text: 'hospital_name'.tr, isRequired: true),
                    CustomTextFormField(
                      controller: hospitalVM.hospitalName.value,
                      hintText: 'hospital_name'.tr,
                    ),

                    /// ✅ Hospital Address
                    CustomLabelText(
                      text: 'hospital_address'.tr,
                      isRequired: true,
                    ),
                    CustomTextFormField(
                      controller: hospitalVM.hospitalAddress.value,
                      hintText: 'hospital_address'.tr,
                    ),

                    SizedBox(height: 16),
                    CustomTextWidget(
                      text: "reference/sourc_of_request".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16),

                    /// ✅ Reference Source
                    CustomLabelText(
                      text: 'name_of_reference'.tr,
                      isRequired: true,
                    ),
                    CustomTextFormField(
                      controller: hospitalVM.referenceSource.value,
                      hintText: 'name_of_reference'.tr,
                    ),

                    /// ✅ Reference Designation
                    CustomLabelText(
                      isRequired: true,
                      text: 'post/designation_of_reference'.tr,
                    ),
                    CustomTextFormField(
                      controller: hospitalVM.designationReference.value,
                      hintText: 'post/designation_of_reference'.tr,
                    ),

                    /// ✅ Reference Mobile
                    CustomLabelText(
                      text: 'mobile_number_of_reference'.tr,
                      isRequired: true,
                    ),
                    CustomTextFormField(
                      controller: hospitalVM.mobileNumberReference.value,
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

                    /// ✅ Hospital Contact Person Name
                    CustomLabelText(isRequired: true, text: 'name'.tr),
                    CustomTextFormField(
                      controller: hospitalVM.hospitalContactPersonName.value,
                      hintText: 'full_name'.tr,
                    ),

                    /// ✅ Hospital Contact Designation
                    CustomLabelText(text: 'desigantion'.tr, isRequired: true),
                    CustomTextFormField(
                      controller: hospitalVM.hospitalDesignation.value,
                      hintText: 'desigantion'.tr,
                    ),

                    /// ✅ Mobile Number
                    CustomLabelText(text: 'mobile_number'.tr, isRequired: true),
                    CustomTextFormField(
                      controller: hospitalVM.hospitalMobileNumber.value,
                      hintText: 'enter_mobile_number'.tr,
                    ),

                    /// ✅ Message
                    CustomLabelText(isRequired: true, text: 'message'.tr),
                    CustomMessageTextFormField(
                      controller: hospitalVM.message.value,
                      hintText: 'enter_message'.tr,
                    ),

                    SizedBox(height: 10),

                    CustomButton(
                      isLoading: hospitalVM.isLoading.value,
                      text: 'submit_btn'.tr,
                      textSize: 14,
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
                        hospitalVM.hospitalAdmissionApi();
                      },
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
