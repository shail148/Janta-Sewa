import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/forgotPassword/create_new_password.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ForgotOtpVerification extends StatefulWidget {
  const ForgotOtpVerification({super.key});

  @override
  State<ForgotOtpVerification> createState() => _ForgotOtpVerificationState();
}

class _ForgotOtpVerificationState extends State<ForgotOtpVerification> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  
  // ignore: unused_field
  Timer? _timer;
  int _start = 59;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 59;
    _timer?.cancel(); // Cancel existing timer if any
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() {
      _start = 59;
    });
    startTimer();
  }

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _timer?.cancel(); // Cancel timer on back
    super.dispose();
  }

  String getOtp() {
    return _otpControllers.map((e) => e.text).join();
  }

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

                    /// OTP Input Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.btnBgColor,
                              width: 1.5,
                            ),
                            color: Color(0xFFF5F7FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          
                          alignment: Alignment.center,
                          child: TextField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(fontSize: 20, color: AppColors.textColor,fontFamily: 'Poppins'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                              }
                              if (value.isEmpty && index > 0) {
                                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                              }
                            },
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 20),

                    /// Timer and Resend Text
                    Row(
                      children: [
                        CustomTextWidget(
                          text: 'remaining_time'.tr,
                          fontsize: 10,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: 8),
                        CustomTextWidget(
                          text: '00:${_start.toString().padLeft(2, '0')}',
                          fontsize: 10,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
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

                    /// Verify Button
                    CustomButton(
                      text: 'verify_otp'.tr,
                      textSize: 14,
                      backgroundColor: AppColors.btnBgColor,
                      height: 62,
                      width: double.infinity,
                      onPressed: () {
                      //  String otp = getOtp();
                     //   print("Entered OTP: $otp");
                        // Navigate for now
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
