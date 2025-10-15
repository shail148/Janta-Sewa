import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view_models/controllers/servicesDepartment/rail_ticket_view_model.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/date_picker.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/message_text_form_widget.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class TicketConfirmation extends StatefulWidget {
  const TicketConfirmation({super.key});
  @override
  State<TicketConfirmation> createState() => _TicketConfirmationState();
}

class _TicketConfirmationState extends State<TicketConfirmation> {
  final ticketVM = Get.put(RailTicketViewModel());
  // Controllers for form fields
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "ticket_confirmation".tr,
                    color: AppColors.textColor,
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 24),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelText(
                          text: 'passenger_name'.tr,
                          isRequired: true,
                        ),
                        CustomTextFormField(
                          hintText: 'enter_passenger_name'.tr,
                          controller: ticketVM.passengerName.value,
                        ),
                        CustomLabelText(text: 'age'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_age'.tr,
                          controller: ticketVM.passengerAge.value,
                          keyboardType: TextInputType.number,
                        ),
                        CustomLabelText(text: 'gender'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_gender'.tr,
                          controller: ticketVM.passengerGender.value,
                        ),
                        CustomLabelText(
                          text: 'mobile_number'.tr,
                          isRequired: true,
                        ),
                        CustomTextFormField(
                          hintText: 'enter_mobile_number'.tr,
                          controller: ticketVM.passengerMobileNumber.value,
                        ),
                        CustomLabelText(text: 'birth_type'.tr),
                        CustomTextFormField(
                          hintText: 'enter_birth_type'.tr,
                          controller: ticketVM.birthType.value,
                        ),

                        SizedBox(height: 16),
                        // CustomButton(
                        //   text: 'Add Passenger',
                        //   textSize: 14,
                        //   backgroundColor: AppColors.btnBgColor,
                        //   height: 48,
                        //   width: double.infinity,
                        //   onPressed: _addPassenger,
                        // ),
                        // SizedBox(height: 30),

                        // Shared ticket info
                        CustomLabelText(
                          text: 'journey_date'.tr,
                          isRequired: true,
                        ),
                        CustomTextFormField(
                          hintText: 'enter_journey_date'.tr,
                          controller: ticketVM.journeyDate.value,
                          suffixIcon: Icons.calendar_month,
                          suffixIconColor: AppColors.btnBgColor,
                          onSuffixTap: () {
                            showCustomCalendarDialog(
                              context: context,
                              controller: ticketVM.journeyDate.value,
                            );
                          },
                        ),
                        CustomLabelText(text: 'from'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'from'.tr,
                          controller: ticketVM.from.value,
                        ),
                        CustomLabelText(text: 'to'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'to'.tr,
                          controller: ticketVM.to.value,
                        ),
                        CustomLabelText(
                          text: 'pnr_number'.tr,
                          isRequired: true,
                        ),
                        CustomTextFormField(
                          hintText: 'enter_pnr_number'.tr,
                          controller: ticketVM.pnrNumber.value,
                        ),
                        CustomLabelText(
                          text: 'train_number'.tr,
                          isRequired: true,
                        ),
                        CustomTextFormField(
                          hintText: 'enter_train_number'.tr,
                          controller: ticketVM.trainNumber.value,
                        ),
                        CustomLabelText(text: 'train_name'.tr),
                        CustomTextFormField(
                          hintText: 'enter_train_name'.tr,
                          controller: ticketVM.trainName.value,
                        ),

                        CustomLabelText(text: 'message'.tr),
                        CustomMessageTextFormField(
                          hintText: 'enter_message'.tr,
                          controller: ticketVM.message.value,
                          //created controller here
                        ),

                        SizedBox(height: 20),
                        Obx(
                          () => CustomButton(
                            isLoading: ticketVM.isLoading.value,
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              ticketVM.ticketConfirmationApi();
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
    );
  }
}
