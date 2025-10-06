import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/quarter_allotment_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
class QuarterAllotment extends StatefulWidget {
  const QuarterAllotment({super.key});

  @override
  State<QuarterAllotment> createState() => _QuarterAllotmentState();
}
class _QuarterAllotmentState extends State<QuarterAllotment> {
  final quarterAllotmentVM = Get.put(QuarterAllotmentViewModel());
  final _formKey = GlobalKey<FormState>();
  final List<String>typesOfQuarter=[
    'new'.tr,
    'existing'.tr,
  ];
  String? selectedType;
   final List<String>optedQuarter=[
    'bsp'.tr,
    'state govt'.tr,
    'central govt'.tr,
    'private'.tr,
  ];
  String? selectedQuarter;
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
                      text: "quarter_allotment".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_allotment'.tr),
                          CustomDropdown(items: typesOfQuarter, selectedValue: selectedType, onChanged: (value){

                           setState(() {
                              selectedType = value;
                           });
                          }),
                         // CustomTextFormField(hintText: 'applicant_name'.tr),
                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.fullName.value,
                            hintText: 'full_name'.tr),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.mobile.value,
                            hintText: 'mobile'.tr),
                          CustomLabelText(text: 'address'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.address.value,
                            hintText: 'address'.tr),
                          CustomLabelText(text: 'opted_quarter_department'.tr),
                         //add dropdown
                         CustomDropdown(items: optedQuarter, selectedValue: selectedQuarter, onChanged: (value){
                          setState(() {
                            
                            selectedQuarter = value;
                          });
                         }),
                          CustomLabelText(text: 'from_whom_to_opted'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.fromWhomtoOpted.value,
                            hintText: 'from_whom_to_opted'.tr),
                          CustomLabelText(text: 'opted_quarter_address'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.optedQuarterAddress.value,
                            hintText: 'opted_quarter_address'.tr),
                           CustomLabelText(text: 'reason_for_quarter_allotment'.tr),
                          CustomTextFormField(
                            controller: quarterAllotmentVM.reason.value,
                            hintText: 'reason_for_quarter_allotment'.tr),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                          controller: quarterAllotmentVM.message.value,
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

                              //add a login logic
                              if (_formKey.currentState!.validate()) {
                                //implement the api call here
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