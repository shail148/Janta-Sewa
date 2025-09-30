import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_dropdown.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
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
  final List<String> invitationTypes = [
    'invitation_for_meeting'.tr,
    'invitation_for_event'.tr,
  ];
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
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'types_of_invitation'.tr),
                          CustomDropdown(
                            items: invitationTypes,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          if (selectedType == invitationTypes[0]) ...[
                            CustomLabelText(text: 'meeting_agenda'.tr),
                            CustomTextFormField(hintText: 'meeting_agenda'.tr),
                             CustomLabelText(text: 'organization_name'.tr),
                            CustomTextFormField(
                              hintText: 'organization_name'.tr,
                            ),
                           
                          ],
                          if (selectedType == invitationTypes[1]) ...[
                            CustomLabelText(text: 'program_name'.tr),
                            CustomTextFormField(hintText: 'program_name'.tr),
                          ],
                          CustomLabelText(text: 'district'.tr),
                          CustomTextFormField(hintText: 'district'.tr),
                          CustomLabelText(text: 'block'.tr),
                          CustomTextFormField(hintText: 'block'.tr),
                          CustomLabelText(text: 'village/word'.tr),
                          CustomTextFormField(hintText: 'village/word'.tr),
                          CustomLabelText(text: 'constituency'.tr),
                          CustomTextFormField(hintText: 'constituency'.tr),
                          CustomLabelText(text: 'date'.tr),
                          CustomTextFormField(hintText: 'date'.tr),
                          CustomLabelText(text: 'time'.tr),
                          CustomTextFormField(hintText: 'time'.tr),
                          CustomLabelText(text: 'location'.tr),
                          CustomTextFormField(hintText: 'location'.tr),
                          CustomLabelText(text: 'remarks'.tr),
                          CustomTextFormField(hintText: 'remarks'.tr),
                          //compalain type
                          CustomLabelText(text: 'contact_person_name'.tr),
                          CustomTextFormField(
                            hintText: 'contact_person_name'.tr,
                          ),
                          CustomLabelText(
                            text: 'contact_person_mobile_number'.tr,
                          ),
                          CustomTextFormField(
                            hintText: 'contact_person_mobile_number'.tr,
                          ),
                          CustomLabelText(text: 'message'.tr),
                          CustomMessageTextFormField(
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
                              Get.to(() => BottomNav());
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
