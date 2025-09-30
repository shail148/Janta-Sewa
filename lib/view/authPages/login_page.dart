import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:janta_sewa/view/forgotPassword/reset_password_page.dart';
import 'package:janta_sewa/view/authPages/registrationPages/select_category_register_page.dart';
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

  final PasswordVisibility passwordCtrl = Get.put(PasswordVisibility());

  @override
  void initState() {
    super.initState();
    //store language in shared preferences
    UserPreference().getUser().then((value) {
      if (value.email.isNotEmpty) {
        loginVM.emailController.value.text = value.email;
        loginVM.passwordController.value.text = value.password;
      }
    });
  }

  @override
  void dispose() {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      CustomLabelText(
                        text: "enter_email_phone".tr,
                        isRequired: true,
                      ),
                      SizedBox(height: 5),
                      CustomTextFormField(
                        hintText: 'enter_email_phone'.tr,
                        controller: loginVM.emailController.value,
                        focusNode: loginVM.emailFocusNode.value,
                        validator: FormValidator.validateEmailOrPhone,
                      ),
                      CustomLabelText(text: "password".tr, isRequired: true),
                      SizedBox(height: 5),
                      Obx(
                        () => CustomTextFormField(
                          hintText: 'enter_password'.tr,
                          focusNode: loginVM.passwordFocusNode.value,
                          controller: loginVM.passwordController.value,
                          obscureText: !passwordCtrl
                              .isPasswordVisible
                              .value, // 👁 hide/show password
                          suffixIcon: passwordCtrl.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onSuffixTap: () {
                            passwordCtrl
                                .toggleVisibility(); // 🔄 toggle visibility
                          },
                          validator: (value) => FormValidator.validateRequired(
                            value,
                            'password'.tr,
                          ),
                        ),
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
                      Obx(
                        () => CustomButton(
                          text: 'login_btn'.tr,
                          textSize: 18.sp,
                          backgroundColor: AppColors.btnBgColor,
                          height: 50.h,
                          isLoading: loginVM.isLoading.value,
                          width: double.infinity,
                          // onPressed: _login,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginVM.loginApi();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: 'dont_have_account'.tr,
                      fontsize: 12,
                    ),
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
