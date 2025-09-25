import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/auth_page/otp_verification.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/date_picker.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class GeneralRegister extends StatefulWidget {
  const GeneralRegister({super.key});

  @override
  State<GeneralRegister> createState() => _GeneralRegisterState();
}

class _GeneralRegisterState extends State<GeneralRegister> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController vidhansabhaController = TextEditingController();
  final TextEditingController cityVillageController = TextEditingController();
  final TextEditingController wardNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: AppColors.btnBgColor,
                            size: 22,
                          ),
                        ),
                        SizedBox(width: 8),
                        CustomTextWidget(
                          text: "registration".tr,
                          color: AppColors.textColor,
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
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
                          CustomTextFormField(hintText: 'enter_full_name'.tr),
                          CustomLabelText(
                            text: 'mobile_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            hintText: 'enter_mobile_number'.tr,
                          ),
                          CustomLabelText(
                            text: 'whatsapp_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            hintText: 'enter_whatsapp_number'.tr,
                          ),
                          CustomLabelText(
                            text: 'email_id'.tr,
                            isRequired: true,
                          ),

                          CustomTextFormField(hintText: 'enter_email_id'),
                          CustomTextFormField(
                            hintText: 'enter_email_id'.tr,
                           
                          ),
                          CustomLabelText(text: 'date_of_birth'.tr),
                          CustomTextFormField(
                            controller: dobController,
                            hintText: 'dob_hint'.tr,
                            suffixIconColor: AppColors.btnBgColor,
                            suffixIcon: Icons.calendar_month,

                            onSuffixTap: () {
                              showCustomCalendarDialog(
                                context: context,
                                controller: dobController,
                              );
                            },
                          ),

                          CustomLabelText(text: 'blood_group'.tr),
                          CustomTextFormField(hintText: 'enter_blood_group'.tr),
                          CustomLabelText(
                            text: 'aadhar_number'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
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
                          CustomTextFormField(hintText: 'enter_address'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'state'.tr, isRequired: true),
                          CustomTextFormField(hintText: 'enter_state'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'district'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(hintText: 'enter_district'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'block'.tr, isRequired: true),
                          CustomTextFormField(hintText: 'enter_block'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'vidhansabha'.tr),
                          CustomTextFormField(hintText: 'enter_vidhansabha'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(
                            text: 'city_village'.tr,
                            isRequired: true,
                          ),
                          CustomTextFormField(
                            hintText: 'enter_city_village'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'ward_number'.tr),
                          CustomTextFormField(hintText: 'enter_ward_number'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'pincode'.tr, isRequired: true),
                          CustomTextFormField(hintText: 'enter_pincode'.tr),
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
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              //add a login logic
                              Get.to(() => OtpVerification());
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
