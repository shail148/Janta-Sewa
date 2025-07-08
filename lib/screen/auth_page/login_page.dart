import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/controllers/auth_controller.dart';
import 'package:janta_sewa/screen/forgotPassword/reset_password.dart';
import 'package:janta_sewa/screen/registrationPages/main_register_page.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:janta_sewa/widget/custom_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  void dispose() {
    emailPhoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      Get.focusScope?.unfocus();
      CustomSnackbar.show(
        title: 'Please wait',
        message: 'Logging in...',
        backgroundColor: Colors.blue,
        icon: Icons.info_outline,
        duration: Duration(milliseconds: 800),
      );
      final result = await _authController.login(
        email: emailPhoneController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (result['success'] == true) {
        CustomSnackbar.show(
          title: 'Success',
          message: 'Login successful',
          backgroundColor: Colors.green,
          icon: Icons.check_circle_outline,
        );
        Get.offAll(() => BottomNav());
      } else {
        CustomSnackbar.show(
          title: 'Error',
          message: result['message']?.toString() ?? 'Login failed',
          backgroundColor: Colors.red,
          icon: Icons.error_outline,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomTextWidget(
          text: "Janta Sewa",
          fontsize: 24,
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/indialogo.png',
                    height: 150,
                    width: 100,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: CustomTextWidget(
                    text: "login_btn".tr,
                    fontsize: 30,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabelText(text: "enter_email_phone".tr),
                      SizedBox(height: 5),
                      CustomTextFormField(
                        hintText: 'enter_email_phone'.tr,
                        controller: emailPhoneController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email or phone is required';
                          }
                          return null;
                        },
                      ),
                      CustomLabelText(text: "password".tr),
                      SizedBox(height: 5),
                      CustomTextFormField(
                        hintText: 'enter_password'.tr,
                        controller: passwordController,
                        obscureText: true,
                        suffixIcon: Icon(Icons.password, color: AppColors.btnBgColor),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Forgot Password Logic Here
                              Get.to(() => ResetPassword());
                            },
                            child: CustomTextWidget(
                              text: 'forgot_password'.tr,
                              color: AppColors.btnBgColor,
                              fontsize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: 'login_btn'.tr,
                        textSize: 14,
                        backgroundColor: AppColors.btnBgColor,
                        height: 62,
                        width: double.infinity,
                        onPressed: _login,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(text: 'dont_have_account'.tr, fontsize: 12),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        //add ontap Btn
                        Get.to(() => MainRegisterPage());
                      },
                      child: CustomTextWidget(
                        text: 'register_here'.tr,
                        fontsize: 12,
                        color: AppColors.btnBgColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
