import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/views/authPages/login_page.dart';
import 'package:janta_sewa/views/register_page.dart';
import 'package:janta_sewa/view_models/controllers/resetPassword/reset_pass_view_model.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final resetPassVM = Get.put(ResetPassViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back(result: LoginPage());
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.btnBgColor,
            size: 26,
          ),
        ),
        centerTitle: true,
        title: CustomTextWidget(
          text: "Janta Sewa",
          fontsize: 24,
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Image.asset(
                  'assets/images/indialogo.png',
                  height: 98.h,
                  width: 312.w,
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: CustomTextWidget(
                  text: "forgot_password".tr,
                  fontsize: 20.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'forgot_message'.tr,
                      textAlign: TextAlign.justify,
                      fontWeight: FontWeight.bold,
                      fontsize: 12.sp,
                      color: AppColors.textGrey,
                    ),
                    SizedBox(height: 20.h),
                    CustomLabelText(text: "enter_email_phone".tr),
                    SizedBox(height: 5.h),
                    CustomTextFormField(
                      controller: resetPassVM.emailController.value,
                      hintText: 'enter_email_phone'.tr,
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => CustomButton(
                        text: 'send_otp'.tr,
                        textSize: 18.sp,
                        backgroundColor: const Color.fromARGB(255, 20, 1, 102),
                        height: 62,
                        isLoading: resetPassVM.isLoading.value,
                        width: double.infinity,
                        onPressed: () {
                          resetPassVM.forgotPasswordApi();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, size: 30.h, color: Colors.black),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {
                      //add ontap Btn
                      Get.to(() => RegisterPage());
                    },
                    child: CustomTextWidget(
                      text: 'back_to_login'.tr,
                      fontsize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
