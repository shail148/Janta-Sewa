import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/auth_view_model/register_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/custom_snackbar.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class SamajikSansathaRegister extends StatefulWidget {
  const SamajikSansathaRegister({super.key});

  @override
  State<SamajikSansathaRegister> createState() =>
      _SamajikSansathaRegisterState();
}

class _SamajikSansathaRegisterState extends State<SamajikSansathaRegister> {
  final registerVM = Get.put(RegisterViewModel());
  final List<String> organisationTypes = [
    'NGO',
    'Trust',
    'Society',
    'Self-help Group',
  ];
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        title: "Organization Register".tr,

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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          CustomLabelText(
                            isRequired: true,
                            text: 'oragnization_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: registerVM.fullNameController.value,
                            hintText: 'enter_oragnization_name'.tr,
                          ),
                          CustomLabelText(text: 'types_of_oragnization'.tr),
                          CustomDropdown(
                            items: organisationTypes,
                            selectedValue: registerVM.selectedType.value.isEmpty
                                ? null
                                : registerVM.selectedType.value,
                            onChanged: (value) {
                              setState(() {
                                registerVM.selectedType.value = value ?? "";
                                registerVM.isOrgnization.value = true;
                               
                              });
                            },

                            label: 'types_of_oragnization'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'date_of_establish'.tr),
                          CustomTextFormField(
                            controller: registerVM.dobController.value,
                            hintText: 'enter_date_of_establish'.tr,
                          ),
                          CustomLabelText(text: 'contact_number'.tr),
                          CustomTextFormField(
                            controller: registerVM.mobileController.value,
                            hintText: 'enter_contact_number'.tr,
                          ),
                          CustomLabelText(text: 'whatsapp_number'.tr),
                          CustomTextFormField(
                            controller: registerVM.whatsappController.value,
                            hintText: 'enter_whatsapp_number'.tr,
                          ),
                          CustomLabelText(text: 'email_id'.tr),
                          CustomTextFormField(
                            controller: registerVM.emailController.value,
                            hintText: 'enter_email_id'.tr,
                          ),

                          SizedBox(height: 10),
                          CustomTextWidget(
                            text: 'location_details'.tr,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 16,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(
                            controller: registerVM.addressController.value,
                            hintText: 'enter_address'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'state'.tr),
                          CustomTextFormField(
                            controller: registerVM.stateController.value,
                            hintText: 'enter_state'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'district'.tr),
                          CustomTextFormField(
                            controller: registerVM.districtController.value,
                            hintText: 'enter_district'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'block'.tr),
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
                          CustomLabelText(text: 'city_village'.tr),
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
                          CustomLabelText(text: 'pincode'.tr),
                          CustomTextFormField(
                            controller: registerVM.pincodeController.value,
                            hintText: 'enter_pincode'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'password'.tr),
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
                              onPressed: () {
                                //add a login logic
                                if (registerVM.isOrgnization.value == true) {
                                  registerVM.registerApi();
                                } else {
                                  CustomSnackbar.showError(
                                    title: "Error",
                                    message:
                                        "Please select type of Organization",
                                  );
                                }
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
