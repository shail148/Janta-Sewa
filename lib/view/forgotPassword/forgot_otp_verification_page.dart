import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/resetPassword/reset_pass_view_model.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class ForgotOtpVerification extends StatefulWidget {
  const ForgotOtpVerification({super.key});

  @override
  State<ForgotOtpVerification> createState() => _ForgotOtpVerificationState();
}

class _ForgotOtpVerificationState extends State<ForgotOtpVerification> {
  final resetPassVM = Get.put(ResetPassViewModel());

  // 6 controllers for OTP digits
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  // 6 focus nodes for OTP boxes
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _start = 59;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (final c in _otpControllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  /// Combine all 6 digits
  String getOtp() {
    return _otpControllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
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
              Center(
                child: Image.asset(
                  'assets/images/indialogo.png',
                  height: 98.h,
                  width: 312.w,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomTextWidget(
                  text: "otp_verification".tr,
                  fontsize: 20,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              /// Instructions
              CustomTextWidget(
                text: 'verification_message'.tr,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontsize: 12,
                color: AppColors.textGrey,
              ),
              const SizedBox(height: 20),

              /// OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.btnBgColor,
                        width: 1.5,
                      ),
                      color: const Color(0xFFF5F7FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.textColor,
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index + 1]);
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index - 1]);
                        }

                        // Auto-submit if last digit filled
                        if (index == 5 && value.isNotEmpty) {
                          resetPassVM.otpController.value.text = getOtp();
                          resetPassVM.verifyOtpApi();
                        }
                      },
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// Timer
              Row(
                children: [
                  CustomTextWidget(
                    text: 'remaining_time'.tr,
                    fontsize: 10,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 8),
                  CustomTextWidget(
                    text: '00:${_start.toString().padLeft(2, '0')}',
                    fontsize: 10,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              /// Resend
              Row(
                children: [
                  CustomTextWidget(
                    text: 'Didn’t_get_the_code?'.tr,
                    fontsize: 10,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      resetTimer();
                      resetPassVM.forgotPasswordApi(); // resend OTP
                    },
                    child: CustomTextWidget(
                      text: 'resend_otp'.tr,
                      fontsize: 10,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Verify Button
              CustomButton(
                text: 'verify_otp'.tr,
                textSize: 14,
                backgroundColor: AppColors.btnBgColor,
                height: 62,
                width: double.infinity,
                onPressed: () {
                  resetPassVM.otpController.value.text = getOtp();
                  resetPassVM.verifyOtpApi();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetTimer() {
    setState(() {
      _start = 59;
    });
    startTimer();
  }
}
