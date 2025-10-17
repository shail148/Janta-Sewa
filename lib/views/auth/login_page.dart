import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/views/forgotPassword/reset_password_page.dart';
import 'package:janta_sewa/views/auth/select_category_register_page.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/view_models/controllers/auth_view_model/login_view_model.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/password_visibility.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final loginVM = Get.put(LoginViewModel());
  final passwordCtrl = Get.put(PasswordVisibility());

  @override
  void initState() {
    super.initState();

    // Restore last used credentials
    UserPreference().getUser().then((value) {
      if (value.email.isNotEmpty) {
        loginVM.emailController.value.text = value.email;
        loginVM.passwordController.value.text = value.password;
      }
    });
  }

  @override
  void dispose() {
    // Cleanup password visibility controller to prevent leaks
    if (Get.isRegistered<PasswordVisibility>()) {
      Get.delete<PasswordVisibility>();
    }
    super.dispose();
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
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
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
                  const SizedBox(height: 20),
                  Center(
                    child: CustomTextWidget(
                      text: "login_btn".tr,
                      fontsize: 30,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email / Phone Field
                  CustomLabelText(
                    text: "enter_email_phone".tr,
                    isRequired: true,
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    hintText: 'enter_email_phone'.tr,
                    controller: loginVM.emailController.value,
                    validator: FormValidator.validateEmailOrPhone,
                  ),

                  // Password Field
                  CustomLabelText(text: "password".tr, isRequired: true),
                  const SizedBox(height: 5),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'enter_password'.tr,
                      controller: loginVM.passwordController.value,
                      obscureText: !passwordCtrl.isPasswordVisible.value,
                      suffixIcon: passwordCtrl.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixTap: passwordCtrl.toggleVisibility,
                      validator: (value) =>
                          FormValidator.validateRequired(value, 'password'.tr),
                    ),
                  ),

                  // Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const ResetPassword()),
                        child: CustomTextWidget(
                          text: 'forgot_password'.tr,
                          color: AppColors.btnBgColor,
                          fontsize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  Obx(
                    () => CustomButton(
                      text: 'login_btn'.tr,
                      textSize: 18.sp,
                      backgroundColor: AppColors.btnBgColor,
                      height: 50.h,
                      width: double.infinity,
                      isLoading: loginVM.isLoading.value,
                      onPressed: loginVM.isLoading.value
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                loginVM.loginApi();
                              }
                            },
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: 'dont_have_account'.tr,
                        fontsize: 12,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => Get.to(() => const MainRegisterPage()),
                        child: CustomTextWidget(
                          text: 'register_here'.tr,
                          fontsize: 12,
                          color: AppColors.btnBgColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
