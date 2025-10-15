import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/recommendationLetterViewModel/transfer_letter_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class TransferLetter extends StatefulWidget {
  const TransferLetter({super.key});

  @override
  State<TransferLetter> createState() => _TransferLetterState();
}

class _TransferLetterState extends State<TransferLetter> {
  final transferVM = Get.put(TransferLetterViewModel());
  final _formKey = GlobalKey<FormState>();

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
                      text: "transfer".tr,
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
                          CustomLabelText(text: 'types_of_transfer'.tr),
                          Obx(
                            () => CustomDropdown(
                              items: transferVM.typesOfTransfer,
                              selectedValue:
                                  transferVM.selectedType.value.isEmpty
                                  ? null
                                  : transferVM.selectedType.value,
                              onChanged: (value) {
                                transferVM.selectedType(value!);
                              },
                            ),
                          ),

                          CustomLabelText(text: 'full_name'.tr),
                          CustomTextFormField(
                            controller: transferVM.fullName.value,
                            hintText: 'full_name'.tr,
                          ),
                          CustomLabelText(text: 'mobile'.tr),
                          CustomTextFormField(
                            controller: transferVM.mobile.value,
                            hintText: 'mobile'.tr,
                          ),
                          CustomLabelText(text: 'designation'.tr),
                          CustomTextFormField(
                            controller: transferVM.designation.value,
                            hintText: 'designation'.tr,
                          ),
                          CustomLabelText(text: 'department'.tr),
                          //add dropdown
                          Obx(
                            () => CustomDropdown(
                              items: transferVM.typeOfDepartment,
                              selectedValue:
                                  transferVM.selectedDepartment.value.isEmpty
                                  ? null
                                  : transferVM.selectedDepartment.value,
                              onChanged: (value) {
                                transferVM.selectedDepartment(value!);
                              },
                            ),
                          ),
                          CustomLabelText(text: 'posted_office'.tr),
                          CustomTextFormField(
                            controller: transferVM.postedOffice.value,
                            hintText: 'posted_office'.tr,
                          ),
                          CustomLabelText(text: 'opted_office'.tr),
                          CustomTextFormField(
                            controller: transferVM.optedOffice.value,
                            hintText: 'opted_office'.tr,
                          ),
                          CustomLabelText(text: 'reason_for_transfer'.tr),
                          CustomTextFormField(
                            controller: transferVM.reason.value,
                            hintText: 'reason_for_transfer'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
                            controller: transferVM.message.value,
                            hintText: 'enter_message'.tr,
                          ),
                          CustomLabelText(text: 'upload_signed_documents'.tr),
                          SizedBox(height: 10),
                          CustomFileUpload(),
                          SizedBox(height: 10),
                          Obx(
                            () => CustomButton(
                              text: 'submit_btn'.tr,
                              textSize: 14,
                              isLoading: transferVM.isLoading.value,
                              backgroundColor: AppColors.btnBgColor,
                              height: 62,
                              width: double.infinity,
                              onPressed: () {
                                final valid =
                                    _formKey.currentState?.validate() ?? false;
                                if (!valid) {
                                  Utils.showErrorSnackBar(
                                    'Validation',
                                    'Please fix the Errors in the Form',
                                  );
                                  return;
                                }
                                transferVM.createTransferLetterApi();
                              },
                            ),
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
