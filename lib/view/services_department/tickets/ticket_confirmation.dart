import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/view/services_department/tickets/ticket_confirmation2.dart';
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
  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController journeyDateController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController pnrController = TextEditingController();
  final TextEditingController trainNumberController = TextEditingController();
  final TextEditingController trainNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController(); //new msg controller
  final TextEditingController birthTypeController = TextEditingController();

  List<Map<String, String>> passengers = [];

 
  void clearPassengerFields() {
    nameController.clear();
    ageController.clear();
    genderController.clear();
    mobileController.clear();
    birthTypeController.clear();
  }

  
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    mobileController.dispose();
    journeyDateController.dispose();
    fromController.dispose();
    toController.dispose();
    pnrController.dispose();
    trainNumberController.dispose();
    trainNameController.dispose();
    messageController.dispose(); //disposed meesggae controoler here
    birthTypeController.dispose();
    super.dispose();
  }

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

                  // Show passenger list
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: passengers.length,
                  //   itemBuilder: (context, index) {
                  //     final p = passengers[index];
                  //     return Card(
                  //       child: ListTile(
                  //         title: Text(p['name'] ?? ''),
                  //         subtitle: Text("Age: ${p['age']}, Gender: ${p['gender']}"),
                  //         trailing: IconButton(
                  //           icon: Icon(Icons.delete),
                  //           onPressed: () => _deletePassenger(index),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),

                  // SizedBox(height: 20),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelText(text: 'passenger_name'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_passenger_name'.tr,
                          controller: nameController,
                        ),
                        CustomLabelText(text: 'age'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_age'.tr,
                          controller: ageController,
                          keyboardType: TextInputType.number,
                        ),
                        CustomLabelText(text: 'gender'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_gender'.tr,
                          controller: genderController,
                        ),
                        CustomLabelText(text: 'mobile_number'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_mobile_number'.tr,
                          controller: mobileController,
                        ),
                        CustomLabelText(text: 'birth_type'.tr),
                        CustomTextFormField(
                          hintText: 'enter_birth_type'.tr,
                          controller: birthTypeController,
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
                        CustomLabelText(text: 'journey_date'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_journey_date'.tr,
                          controller: journeyDateController,
                          suffixIcon: Icons.calendar_month,
                          suffixIconColor: AppColors.btnBgColor,
                          onSuffixTap: () {
                            showCustomCalendarDialog(
                                context: context, controller: journeyDateController);
                          },
                        ),
                        CustomLabelText(text: 'from'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'from'.tr,
                          controller: fromController,
                        ),
                        CustomLabelText(text: 'to'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'to'.tr,
                          controller: toController,
                        ),
                        CustomLabelText(text: 'pnr_number'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_pnr_number'.tr,
                          controller: pnrController,
                        ),
                        CustomLabelText(text: 'train_number'.tr, isRequired: true),
                        CustomTextFormField(
                          hintText: 'enter_train_number'.tr,
                          controller: trainNumberController,
                        ),
                        CustomLabelText(text: 'train_name'.tr),
                        CustomTextFormField(
                          hintText: 'enter_train_name'.tr,
                          controller: trainNameController,
                        ),

                        CustomLabelText(text: 'message'.tr),
                        CustomMessageTextFormField(
                          hintText: 'enter_message'.tr,
                          controller: messageController, //created controller here
                           ),

                        SizedBox(height: 20),
                        CustomButton(
                          text: 'submit_btn'.tr,
                          textSize: 14,
                          backgroundColor: AppColors.btnBgColor,
                          height: 62,
                          width: double.infinity,
                          onPressed: (){
                            Get.to(() => TicketConfirmation2());
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
    );
  }
}
