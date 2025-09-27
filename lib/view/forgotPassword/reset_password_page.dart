import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/authPages/login_page.dart';
import 'package:janta_sewa/view/forgotPassword/forgot_otp_verification_page.dart';
import 'package:janta_sewa/view/register_page.dart';
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/indialogo.png',
                  height: 150,
                  width: 100,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: CustomTextWidget(
                  text: "forgot_password".tr,
                  fontsize: 20,
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
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontsize: 12,
                      color: AppColors.textGrey,
                    ),
                    SizedBox(height: 20),
                    CustomLabelText(text: "enter_email_phone".tr),
                    SizedBox(height: 5),
                    CustomTextFormField(hintText: 'enter_email_phone'.tr),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'send_otp'.tr,
                      textSize: 14,
                      backgroundColor: AppColors.btnBgColor,
                      height: 62,
                      width: double.infinity,
                      onPressed: () {
                        Get.to(()=>ForgotOtpVerification());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back,size: 30,color: Colors.black,),
                  SizedBox(width: 5),
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
