import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_dropdown.dart';
import 'package:janta_sewa/screen/auth_page/otp_verification.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';



class SamajikSansathaRegister extends StatefulWidget {
  const SamajikSansathaRegister({super.key});

  @override
  State<SamajikSansathaRegister> createState() => _SamajikSansathaRegisterState();
}

class _SamajikSansathaRegisterState extends State<SamajikSansathaRegister> {
  final List<String> organisationTypes = [
    'NGO',
    'Trust',
    'Society',
    'Self-help Group',
  ];
  String? selectedType;
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back_ios_new_outlined),),
                        //(width: 5,),
                        Expanded(
                          child: CustomTextWidget(
                            text: "samajik_sanstha_registration".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          CustomLabelText(text: 'oragnization_name'.tr),
                          CustomTextFormField(hintText: 'enter_oragnization_name'.tr),
                          CustomLabelText(text: 'types_of_oragnization'.tr),
                          CustomDropdown(
                            items: organisationTypes,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                            label: 'types_of_oragnization'.tr,
                          ),
                          SizedBox(height: 10,),
                          CustomLabelText(text: 'date_of_establish'.tr),
                          CustomTextFormField(hintText: 'enter_date_of_establish'.tr),
                          CustomLabelText(text: 'contact_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_contact_number'.tr,
                          ),
                          CustomLabelText(text: 'whatsapp_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_whatsapp_number'.tr,
                          ),
                          CustomLabelText(text: 'email_id'.tr),
                          CustomTextFormField(hintText: 'enter_email_id'.tr),
                          
                
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
                              SizedBox(width: 10),
                              CustomTextWidget(
                                text: 'information'.tr,
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 240, 240),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomTextWidget(
                                text: 'after_register_info'.tr,
                                fontsize: 14,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              //add a login logic
                               Get.to(()=>OtpVerification());
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



