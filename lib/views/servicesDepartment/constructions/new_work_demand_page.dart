import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/servicesDepartment/construction_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class NewWorkDemand extends StatefulWidget {
  const NewWorkDemand({super.key});
  @override
  State<NewWorkDemand> createState() => _NewWorkDemandState();
}
class _NewWorkDemandState extends State<NewWorkDemand> {
  final newWorkDemandVM = Get.put(ConstructionViewModel());
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
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "new_work_demand".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 16),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'work_name'.tr),

                          CustomTextFormField(
                            controller: newWorkDemandVM.workName.value,
                            hintText: 'work_name'.tr,
                          ),
                          CustomLabelText(text: 'work_detail'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.workDetails.value,
                            hintText: 'work_detail'.tr,
                          ),
                          CustomLabelText(text: 'tentative_amount'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.tentativeAmount.value,
                            hintText: 'tentative_amount'.tr,
                          ),
                          CustomLabelText(text: 'remark'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.remark.value,
                            hintText: 'remark'.tr,
                          ),
                          CustomLabelText(text: 'demanded_person'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.demandedPerson.value,
                            hintText: 'demanded_person'.tr,
                          ),
                          CustomLabelText(
                            text: 'demanded_person_mobile_number'.tr,
                          ),
                          CustomTextFormField(
                            controller: newWorkDemandVM
                                .demandedPersonMobileNumber
                                .value,
                            hintText: 'demanded_person_mobile_number'.tr,
                          ),
                          SizedBox(height: 16),
                          CustomTextWidget(
                            text: 'Location Details',
                            fontsize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                          SizedBox(height: 16),
                          // CustomLabelText(text: 'pincode'.tr),
                          // CustomTextFormField(hintText: 'enter_pincode'.tr),
                          CustomLabelText(text: 'district'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.district.value,
                            hintText: 'district'.tr,
                          ),
                          CustomLabelText(text: 'block'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.block.value,
                            hintText: 'block'.tr,
                          ),
                          CustomLabelText(text: 'village'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.village.value,
                            hintText: 'village'.tr,
                          ),
                          CustomLabelText(text: 'constituency'.tr),
                          CustomTextFormField(
                            controller: newWorkDemandVM.constituency.value,
                            hintText: 'constituency'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: newWorkDemandVM.message.value,
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
                            onPressed: () {},
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
