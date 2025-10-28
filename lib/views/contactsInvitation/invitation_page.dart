import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/invitationViewModel/invitation_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/custom_time_picker.dart';
import 'package:janta_sewa/widgets/date_picker.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});
  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final invitationVM = Get.put(InvitationViewModel());
  final _formKey = GlobalKey<FormState>(); // add if you’ll validate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: Get.back,
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "invitation form".tr,
                  color: AppColors.textColor,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabelText(
                        isRequired: true,
                        text: 'types_of_invitation'.tr,
                      ),
                      Obx(
                        () => CustomDropdown(
                          items: invitationVM.invitationTypes,
                          selectedValue: invitationVM.selectedType.value.isEmpty
                              ? null
                              : invitationVM.selectedType.value,
                          onChanged: (value) {
                            if (value != null) invitationVM.setType(value);
                          },
                        ),
                      ),

                      // Conditional sections
                      Obx(() {
                        final meeting =
                            invitationVM.selectedType.value ==
                            'invitation_for_meeting'.tr;
                        final event =
                            invitationVM.selectedType.value ==
                            'invitation_for_event'.tr;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (meeting) ...[
                              CustomLabelText(text: 'meeting_agenda'.tr),
                              CustomTextFormField(
                                controller: invitationVM.meetingAgenda.value,
                                hintText: 'meeting_agenda'.tr,
                              ),
                              CustomLabelText(
                                isRequired: true,
                                text: 'organization_name'.tr,
                              ),
                              CustomTextFormField(
                                // validator: FormValidator.validateName,
                                controller: invitationVM.organizationName.value,
                                hintText: 'organization_name'.tr,
                              ),
                            ],
                            if (event) ...[
                              CustomLabelText(
                                isRequired: true,
                                text: 'program_name'.tr,
                              ),
                              CustomTextFormField(
                                controller: invitationVM.programmeName.value,
                                hintText: 'program_name'.tr,
                              ),
                            ],
                          ],
                        );
                      }),
                      SizedBox(height: 10),
                      CustomLabelText(isRequired: true, text: 'district'.tr),
                      CustomTextFormField(
                        validator: FormValidator.validateDistrict,
                        controller: invitationVM.district.value,
                        hintText: 'district'.tr,
                      ),
                      CustomLabelText(isRequired: true, text: 'block'.tr),
                      CustomTextFormField(
                        validator: FormValidator.validateBlock,
                        controller: invitationVM.block.value,
                        hintText: 'block'.tr,
                      ),
                      CustomLabelText(
                        isRequired: true,
                        text: 'village/word'.tr,
                      ),
                      CustomTextFormField(
                        validator: FormValidator.validateCity,
                        controller: invitationVM.village.value,
                        hintText: 'village/word'.tr,
                      ),
                      CustomLabelText(
                        isRequired: true,
                        text: 'constituency'.tr,
                      ),
                      CustomTextFormField(
                        validator: (value) => FormValidator.validateRequired(
                          value,
                          'Constituency',
                        ),
                        controller: invitationVM.constituency.value,
                        hintText: 'constituency'.tr,
                      ),
                      CustomLabelText(isRequired: true, text: 'date'.tr),
                      CustomTextFormField(
                        validator: (value) =>
                            FormValidator.validateRequired(value, 'Date'),
                        hintText: 'date_of_visit'.tr,
                        controller: invitationVM.date.value,
                        suffixIcon: Icons.calendar_month,
                        suffixIconColor: AppColors.btnBgColor,
                        onSuffixTap: () {
                          showCustomCalendarDialog(
                            firstDate: DateTime.now(),
                            context: context,
                            controller: invitationVM.date.value,
                          );
                        },
                      ),

                      CustomLabelText(isRequired: true, text: 'time'.tr),
                      CustomTextFormField(
                        validator: (value) =>
                            FormValidator.validateRequired(value, 'Time'),
                        controller: invitationVM.meetingTime.value,
                        hintText: 'time_of_visit'.tr,
                        suffixIcon: Icons.timer_sharp,
                        readOnly: true, // prevents keyboard from showing
                        onSuffixTap: () async {
                          await showCustomTimeDialog(
                            context: context,
                            controller: invitationVM.meetingTime.value,
                          );
                        },
                      ),
                      CustomLabelText(isRequired: true, text: 'location'.tr),
                      CustomTextFormField(
                        validator: FormValidator.validateAddress,
                        controller: invitationVM.location.value,
                        hintText: 'location'.tr,
                      ),
                      CustomLabelText(isRequired: true, text: 'remarks'.tr),
                      CustomTextFormField(
                        validator: FormValidator.validateMessage,
                        controller: invitationVM.remarks.value,
                        hintText: 'remarks'.tr,
                      ),
                      CustomLabelText(
                        isRequired: true,
                        text: 'contact_person_name'.tr,
                      ),
                      CustomTextFormField(
                        validator: FormValidator.validateName,
                        controller: invitationVM.contactPersonName.value,
                        hintText: 'contact_person_name'.tr,
                      ),
                      CustomLabelText(
                        isRequired: true,
                        text: 'contact_person_mobile_number'.tr,
                      ),
                      CustomTextFormField(
                        validator: FormValidator.validatePhone,
                        controller:
                            invitationVM.contactPersonMobileNumber.value,
                        hintText: 'contact_person_mobile_number'.tr,
                        keyboardType: TextInputType.phone,
                      ),
                      CustomLabelText(isRequired: true, text: 'message'.tr),
                      CustomMessageTextFormField(
                        validator: FormValidator.validateMessage,
                        controller: invitationVM.message.value,
                        hintText: 'enter_message'.tr,
                      ),
                      CustomLabelText(
                        isRequired: true,
                        text: 'upload_signed_documents'.tr,
                      ),
                      const SizedBox(height: 10),
                      CustomFileUpload(),
                      const SizedBox(height: 10),

                      // Submit
                      Obx(
                        () => CustomButton(
                          text: invitationVM.isLoading.value
                              ? 'Submitting...'
                              : 'submit_btn'.tr,
                          textSize: 14,
                          backgroundColor: invitationVM.isLoading.value
                              ? Colors.grey.shade400
                              : AppColors.btnBgColor,
                          height: 62,
                          width: double.infinity,
                          onPressed: invitationVM.isLoading.value
                              ? null
                              : () {
                                  // (Optional) add validation if needed
                                  //add form validator
                                  if (!_formKey.currentState!.validate()) {
                                    // Utils.showErrorSnackBar(
                                    //   'Validation',
                                    //   'Please fix the Errors in the Form',
                                    // );
                                  }
                                  invitationVM.submitInvitation();
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
    );
  }
}
