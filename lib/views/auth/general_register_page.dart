import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/view_models/controllers/auth_view_model/register_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/date_picker.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class GeneralRegister extends StatefulWidget {
  const GeneralRegister({super.key});

  @override
  State<GeneralRegister> createState() => _GeneralRegisterState();
}

class _GeneralRegisterState extends State<GeneralRegister> {
  final registerVM = Get.put(RegisterViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        title: "User Register".tr,

        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          // thickness: 5,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'personal_details'.tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'full_name'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateName,
                            controller: registerVM.fullNameController.value,
                            hintText: 'enter_full_name'.tr,
                          ),
                          CustomLabelText(
                            text: 'mobile_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validatePhone,
                            controller: registerVM.mobileController.value,
                            hintText: 'enter_mobile_number'.tr,
                          ),
                          CustomLabelText(
                            text: 'whatsapp_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validatePhone,
                            controller: registerVM.whatsappController.value,
                            hintText: 'enter_whatsapp_number'.tr,
                          ),
                          CustomLabelText(
                            text: 'email_id'.tr,
                            isRequired: true,
                          ),

                          CustomTextFormField(
                            validator: FormValidator.validateEmail,
                            controller: registerVM.emailController.value,
                            hintText: 'enter_email_id',
                          ),

                          CustomLabelText(text: 'date_of_birth'.tr),
                          CustomTextFormField(
                            validator: FormValidator.validateDob,
                            controller: registerVM.dobController.value,
                            hintText: 'dob_hint'.tr,
                            suffixIconColor: AppColors.btnBgColor,
                            suffixIcon: Icons.calendar_month,

                            onSuffixTap: () {
                              showCustomCalendarDialog(
                                context: context,
                                controller: registerVM.dobController.value,
                              );
                            },
                          ),

                          CustomLabelText(text: 'blood_group'.tr),
                          CustomTextFormField(
                            controller: registerVM.bloodGroupController.value,
                            hintText: 'enter_blood_group'.tr,
                          ),
                          CustomLabelText(
                            text: 'aadhar_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            validator: FormValidator.validateAadhaar,
                            controller: registerVM.aadharController.value,
                            hintText: 'enter_aadhar_number'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomTextWidget(
                            text: 'location_details'.tr,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 16,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'address'.tr, isRequired: true),
                          CustomTextFormField(
                            controller: registerVM.addressController.value,
                            hintText: 'enter_address'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'state'.tr, isRequired: true),
                          CustomTextFormField(
                            controller: registerVM.stateController.value,
                            hintText: 'enter_state'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'district'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            controller: registerVM.districtController.value,
                            hintText: 'enter_district'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'block'.tr, isRequired: true),
                          CustomTextFormField(
                            controller: registerVM.blockController.value,
                            hintText: 'enter_block'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'vidhansabha'.tr),
                          CustomTextFormField(
                            controller: registerVM.vidhansabhaController.value,
                            hintText: 'enter_vidhansabha'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'city_village'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            controller: registerVM.cityVillageController.value,
                            hintText: 'enter_city_village'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'ward_number'.tr),
                          CustomTextFormField(
                            controller: registerVM.wardNumberController.value,
                            hintText: 'enter_ward_number'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'pincode'.tr, isRequired: true),
                          CustomTextFormField(
                            controller: registerVM.pincodeController.value,
                            hintText: 'enter_pincode'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'password'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            controller: registerVM.passwordController.value,
                            hintText: 'enter_password'.tr,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              CustomTextWidget(
                                text: 'information'.tr,
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 240, 240),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomTextWidget(
                                text: 'after_register_info'.tr,
                                fontsize: 14,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => CustomButton(
                              text: 'submit_btn'.tr,
                              textSize: 14,
                              backgroundColor: AppColors.btnBgColor,
                              height: 62,
                              isLoading: registerVM.isLoading.value,
                              width: double.infinity,
                              onPressed: registerVM.isLoading.value
                                  ? null
                                  : () {
                                      //check if all fields are validate using validator
                                      if (_formKey.currentState!.validate()) {
                                        registerVM.registerApi();
                                      }
                                    },
                            ),
                          ),
                          SizedBox(height: 40),
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
