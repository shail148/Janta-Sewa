import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/resetPassword/reset_pass_view_model.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final resetPassVM = Get.put(ResetPassViewModel());
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
                  text: "create_a_new_password".tr,
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
                    CustomLabelText(isRequired: true, text: "new_password".tr),
                    CustomTextFormField(
                      controller: resetPassVM.passwordController.value,
                      hintText: 'new_password'.tr,
                    ),
                    CustomLabelText(
                      isRequired: true,
                      text: "confirm_password".tr,
                    ),
                    CustomTextFormField(
                      controller: resetPassVM.confirmPasswordController.value,
                      hintText: 'confirm_password'.tr,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          text: 'cancel'.tr,
                          textSize: 14,
                          textColor: AppColors.btnBgColor,
                          backgroundColor: AppColors.bgLight,
                          borderColor: AppColors.btnBgColor,
                          borderWidth: 1,
                          height: 60,
                          width: 120,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Obx(
                          () => CustomButton(
                            text: 'save'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 60,
                            width: 120,
                            isLoading: resetPassVM.isLoading.value,
                            onPressed: () {
                              resetPassVM.createNewPasswordApi();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
