import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/forgotPassword/create_new_password.dart';
import 'package:janta_sewa/screen/register_page.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ForgotOtpVerification extends StatefulWidget {
  const ForgotOtpVerification({super.key});

  @override
  State<ForgotOtpVerification> createState() => _ForgotOtpVerificationState();
}

class _ForgotOtpVerificationState extends State<ForgotOtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
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
                  text: "otp_verification".tr,
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
                      text: 'verification_message'.tr,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontsize: 12,
                      color: AppColors.textGrey,
                    ),
                    SizedBox(height: 20),
                    // OTP Input Field
                    //ADDING REMAINING TIME
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'remaining_time'.tr,
                          fontsize: 10,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: 8),
                        CustomTextWidget(
                          text: '00:59',
                          fontsize: 10,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Didn’t_get_the_code?'.tr,
                          fontsize: 10,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: 8),
                        CustomTextWidget(
                          text: 'resend_otp'.tr,
                          fontsize: 10,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'verify_otp'.tr,
                      textSize: 14,
                      backgroundColor: AppColors.btnBgColor,
                      height: 62,
                      width: double.infinity,
                      onPressed: () {
                        Get.to(() => CreateNewPassword());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
