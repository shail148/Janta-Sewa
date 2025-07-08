import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/auth_page/login_page.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/custom_snackbar.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';


class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                   
                    CustomLabelText(text: "new_password".tr),
                    CustomTextFormField(hintText: 'new_password'.tr),
                    CustomLabelText(text: "confirm_password".tr),
                    CustomTextFormField(hintText: 'confirm_password'.tr),
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
                        CustomButton(
                          text: 'save'.tr,
                          textSize: 14,
                          backgroundColor: AppColors.btnBgColor,
                          height: 60,
                          width: 120,
                          onPressed: () {
                            Get.to(() => LoginPage());
                            CustomSnackbar.show(
                              title: "Success",
                              message: "Password has been reset successfully",
                              backgroundColor: Colors.green,
                              icon: Icons.check_circle_outline,
                            );
                          },
                        ),
                      ],
                    )
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