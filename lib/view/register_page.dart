import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          // thickness: 5,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "registration".tr,
                      color: AppColors.textColor,
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 5),
                    CustomTextWidget(
                      text: "provide_info".tr,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w600,
                      fontsize: 11,
                    ),
        
                    
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'personal_details'.tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(hintText: 'enter_full_name'.tr),
                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(hintText: 'enter_mobile_number'.tr),
                          CustomLabelText(text: 'whatsapp_number'.tr),
                          CustomTextFormField(hintText: 'enter_whatsapp_number'.tr),
                          CustomLabelText(text: 'email_id'.tr),
                          CustomTextFormField(hintText: 'enter_email_id'.tr),
                          CustomLabelText(text: 'date_of_birth'.tr),
                          CustomTextFormField(
                            hintText: 'dob_hint'.tr,
                            suffixIcon:Icons.calendar_month ,
                          ),
                          CustomLabelText(text: 'blood_group'.tr),
                          CustomTextFormField(hintText: 'enter_blood_group'.tr),
                          CustomLabelText(text: 'aadhar_number'.tr),
                          CustomTextFormField(hintText: 'enter_aadhar_number'.tr),
                          SizedBox(height: 10),
                          CustomTextWidget(
                            text: 'location_details'.tr,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 16,
                          ),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(hintText: 'enter_address'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'state'.tr),
                          CustomTextFormField(hintText: 'enter_state'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'district'.tr),
                          CustomTextFormField(hintText: 'enter_district'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'block'.tr),
                          CustomTextFormField(hintText: 'enter_block'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'vidhansabha'.tr),
                          CustomTextFormField(hintText: 'enter_vidhansabha'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'city_village'.tr),
                          CustomTextFormField(hintText: 'enter_city_village'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'ward_number'.tr),
                          CustomTextFormField(hintText: 'enter_ward_number'.tr),
                          SizedBox(height: 10),
                          CustomLabelText(text: 'pincode'.tr),
                          CustomTextFormField(hintText: 'enter_pincode'.tr),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10,),
                              CustomTextWidget(
                                text: 'information'.tr,
                                color: Colors.red,
                                fontWeight: FontWeight.w400
                                ,
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                         Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 241, 240, 240),borderRadius: BorderRadius.circular(10)),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextWidget(
                              text: 'after_register_info'.tr,
                              fontsize: 12,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                         ),
                         SizedBox(height: 10,),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              //add a login logic
                              Get.to(()=>BottomNav());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
