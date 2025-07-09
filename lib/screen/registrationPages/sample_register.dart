import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/controllers/auth_controller.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:janta_sewa/widget/custom_snackbar.dart';

class SampleRegister extends StatefulWidget {
  const SampleRegister({super.key});

  @override
  State<SampleRegister> createState() => _SampleRegisterState();
}

class _SampleRegisterState extends State<SampleRegister> {
  // Add controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      Get.focusScope?.unfocus();
      CustomSnackbar.show(
        title: 'Please wait',
        message: 'Registering...',
        backgroundColor: Colors.blue,
        icon: Icons.info_outline,
        duration: Duration(milliseconds: 800),
      );
      final result = await _authController.register(
        fullName: fullNameController.text.trim(),
        mobile: mobileController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // print('Registration result: $result');
      if (result['success'] == true) {
        CustomSnackbar.show(
          title: 'Success',
          message: 'Registration successful',
          backgroundColor: Colors.green,
          icon: Icons.check_circle_outline,
        );
        Get.offAll(() => BottomNav());
      } else {
        CustomSnackbar.show(
          title: 'Error',
          message: result['message']?.toString() ?? 'Registration failed',
          backgroundColor: Colors.red,
          icon: Icons.error_outline,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(Icons.arrow_back_ios_new_outlined,
                                color: AppColors.btnBgColor, size: 24)),
                        SizedBox(
                          width: 12,
                        ),
                        CustomTextWidget(
                          text: "registration".tr,
                          color: AppColors.textColor,
                          fontsize: 16,
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
                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(
                            hintText: 'enter_full_name'.tr,
                            controller: fullNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Full name is required';
                              }
                              return null;
                            },
                          ),
                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_mobile_number'.tr,
                            controller: mobileController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Mobile number is required';
                              }
                              return null;
                            },
                          ),
                          CustomLabelText(text: 'email_id'.tr),
                          CustomTextFormField(
                            hintText: 'enter_email_id'.tr,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          CustomLabelText(text: 'password'.tr),
                          CustomTextFormField(
                            hintText: 'enter_password'.tr,
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
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
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text: 'after_register_info'.tr,
                                fontsize: 12,
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
                            onPressed: _register,
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

// Add validator to CustomTextFormField if not present:
// You may need to update CustomTextFormField to accept a validator parameter and pass it to TextFormField.
// Example usage in the above code:
/*
CustomTextFormField(
  hintText: 'enter_full_name'.tr,
  controller: fullNameController,
  validator: (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    return null;
  },
),
*/