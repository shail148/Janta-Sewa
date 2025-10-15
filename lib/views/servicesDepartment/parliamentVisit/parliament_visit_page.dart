import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/form_validator.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view_models/controllers/servicesDepartment/parliament_visit_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/res/components/file_upload.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/custom_time_picker.dart';
import 'package:janta_sewa/widgets/date_picker.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class ParliamentVisit extends StatefulWidget {
  const ParliamentVisit({super.key});
  @override
  State<ParliamentVisit> createState() => _ParliamentVisitState();
}

class _ParliamentVisitState extends State<ParliamentVisit> {
  final parliamentVM = Get.put(ParliamentVisitViewModel());
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
      body: Obx(
        () => Stack(
          children: [
            SafeArea(
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
                            text: "parliament_visit_menu".tr,
                            color: AppColors.textColor,
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomLabelText(
                                  text: 'headed_person_name'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  validator: FormValidator.validateName,
                                  controller:
                                      parliamentVM.headedPersonName.value,
                                  hintText: 'headed_person_name'.tr,
                                ),
                                CustomLabelText(
                                  text: 'headed_person_mobile_number'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.phone,
                                  validator: FormValidator.validatePhone,
                                  controller: parliamentVM
                                      .headedPersonMobileNumber
                                      .value,
                                  hintText: 'headed_person_mobile_number'.tr,
                                ),
                                CustomLabelText(
                                  text: 'state'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  validator: (value)=>FormValidator.validateRequired(value, 'State'),
                                  keyboardType: TextInputType.text,
                                  controller: parliamentVM.state.value,
                                  hintText: 'enter_state'.tr,
                                ),
                                CustomLabelText(
                                  text: 'district'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                validator: FormValidator.validateDistrict,
                                  controller: parliamentVM.district.value,
                                  hintText: 'enter_district'.tr,
                                ),
                                CustomLabelText(
                                  text: 'block'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  validator: FormValidator.validateBlock,
                                  controller: parliamentVM.block.value,
                                  hintText: 'enter_block'.tr,
                                ),
                                CustomLabelText(
                                  isRequired: true,
                                  text: 'city_village'.tr,
                                ),
                                CustomTextFormField(
                                  validator: FormValidator.validateCity,
                                  controller: parliamentVM.cityVillage.value,
                                  hintText: 'enter_city_village'.tr,
                                ),
                                CustomLabelText(
                                  isRequired: true,
                                  text: 'ward_number'.tr,
                                ),
                                CustomTextFormField(
                                  validator: FormValidator.validateWardNumber,
                                  hintText: 'enter_ward_number'.tr,
                                ),
                                
                                CustomLabelText(
                                  isRequired: true,
                                  text: 'constituency'.tr,
                                ),
                                CustomTextFormField(
                                  validator: (value)=>FormValidator.validateRequired(value, 'Constituency'),
                                  controller: parliamentVM.constituency.value,
                                  hintText: 'constituency'.tr,
                                ),
                                CustomLabelText(
                                  text: 'date_of_visit'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  validator: (value)=>FormValidator.validateRequired(value, 'Date of Visit'),
                                  hintText: 'date_of_visit'.tr,
                                  controller: parliamentVM.dateOfVisit.value,
                                  suffixIcon: Icons.calendar_month,
                                  suffixIconColor: AppColors.btnBgColor,
                                  onSuffixTap: () {
                                    showCustomCalendarDialog(
                                      firstDate: DateTime.now(),
                                      context: context,
                                      controller:
                                          parliamentVM.dateOfVisit.value,
                                    );
                                  },
                                ),

                                CustomLabelText(
                                  text: 'time_of_visit'.tr,
                                  isRequired: true,
                                ),

                                CustomTextFormField(
                                  validator: (value)=>FormValidator.validateRequired(value, 'Time of Visit'),
                                  controller: parliamentVM.timeOfVisit.value,
                                  hintText: 'time_of_visit'.tr,
                                  suffixIcon: Icons.timer_sharp,
                                  readOnly:
                                      true, // prevents keyboard from showing
                                  onSuffixTap: () async {
                                    await showCustomTimeDialog(
                                      context: context,
                                      controller:
                                          parliamentVM.timeOfVisit.value,
                                    );
                                  },
                                ),
                                CustomLabelText(
                                  isRequired: true,
                                  text: 'total_number_of_members'.tr,
                                ),
                                CustomTextFormField(
                                  validator: (value)=>FormValidator.validateRequired(value, 'Total Number of Members'),
                                  keyboardType: TextInputType.number,
                                  controller:
                                      parliamentVM.totalNumberOfMembers.value,
                                  hintText: 'total_number_of_members'.tr,
                                ),
                                CustomLabelText(
                                  text: 'parliament_name'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  controller: parliamentVM.parliamentName.value,
                                  hintText: 'parliament_name'.tr,
                                ),
                                CustomLabelText(
                                  text: 'parliament_mobile_number'.tr,
                                  isRequired: true,
                                ),
                                CustomTextFormField(
                                  validator: FormValidator.validatePhone,
                                  keyboardType: TextInputType.phone,
                                  controller:
                                      parliamentVM.parliamentMobileNumber.value,
                                  hintText: 'parliament_mobile_number'.tr,
                                ),
                                CustomLabelText(text: 'message'.tr),
                                CustomMessageTextFormField(
                                  validator: FormValidator.validateMessage,
                                  controller: parliamentVM.message.value,
                                  hintText: 'enter_message'.tr,
                                ),
                                CustomFileUpload(),
                                SizedBox(height: 10),
                                CustomButton(
                                  isLoading: parliamentVM.isLoading.value,
                                  text: 'submit_btn'.tr,
                                  textSize: 14,
                                  backgroundColor: AppColors.btnBgColor,
                                  height: 62,
                                  width: double.infinity,
                                  onPressed: () {
                                    final valid =
                                        _formKey.currentState?.validate() ??
                                        false;
                                    if (!valid) {
                                      Utils.showErrorSnackBar(
                                        'Validation',
                                        'Please fix the Errors in the Form',
                                      );
                                      return;
                                    }
                                    parliamentVM.parliamentVisitApi();
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
            if (parliamentVM.isLoading.value)
              Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
