import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/complaintViewModel/complaint_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class GovernmentEmployeeComplain extends StatefulWidget {
  const GovernmentEmployeeComplain({super.key});

  @override
  State<GovernmentEmployeeComplain> createState() =>
      _GovernmentEmployeeComplainState();
}

class _GovernmentEmployeeComplainState
    extends State<GovernmentEmployeeComplain> {
  final _formKey = GlobalKey<FormState>();
  final govEmpVM = Get.put(ComplaintViewModel());
  // Sample dropdown items
  final List<String> complainTypes = ['National'.tr, 'State'.tr];
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
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
                      text: "compain_of_gov_employee".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(
                            isRequired: true,
                            text: 'applicant_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.applicantName.value,
                            hintText: 'applicant_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'mobile_number'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.applicantMobile.value,
                            hintText: 'mobile_number'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'address'.tr),
                          CustomTextFormField(
                            controller: govEmpVM.address.value,
                            hintText: 'address'.tr,
                          ),
                          //compalain type
                          CustomLabelText(
                            isRequired: true,
                            text: 'complain_type'.tr,
                          ),
                          //add dropdown here
                          CustomDropdown(
                            items: complainTypes,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),

                          CustomLabelText(
                            isRequired: true,
                            text: 'complain_department_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.departmentName.value,
                            hintText: 'complain_department_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'employee_name'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.employeeName.value,
                            hintText: 'employee_name'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'designation'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.designation.value,
                            hintText: 'designation'.tr,
                          ),
                          CustomLabelText(
                            isRequired: true,
                            text: 'brief_detail_of_complain'.tr,
                          ),
                          CustomTextFormField(
                            controller: govEmpVM.briefDetails.value,
                            hintText: 'brief_detail_of_complain'.tr,
                          ),
                          CustomLabelText(isRequired: true, text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: govEmpVM.message.value,
                            hintText: 'enter_message'.tr,
                          ),
                          CustomLabelText(text: 'upload_signed_documents'.tr),
                          SizedBox(height: 10),
                          CustomFileUpload(),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                //call the api functions 
                              }
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
