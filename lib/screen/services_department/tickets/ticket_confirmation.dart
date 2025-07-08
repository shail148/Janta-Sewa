import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_list.dart';
import 'package:janta_sewa/screen/services_department/tickets/tickethome_page.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/label_text.dart';
import 'package:janta_sewa/widget/text_form_widget.dart';
import 'package:janta_sewa/widget/text_widget.dart';

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
  final TextEditingController birthTypeController = TextEditingController();

  // List to store passenger data
  List<Map<String, String>> passengers = [];

  // Helper to clear form
  void clearForm() {
    nameController.clear();
    ageController.clear();
    genderController.clear();
    mobileController.clear();
    journeyDateController.clear();
    fromController.clear();
    toController.clear();
    pnrController.clear();
    trainNumberController.clear();
    trainNameController.clear();
    birthTypeController.clear();
  }

  void _deletePassenger(int index) {
    setState(() {
      passengers.removeAt(index);
    });
  }

  void _addPassenger() {
    if (nameController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        pnrController.text.isNotEmpty) {
      setState(() {
        passengers.add({
          'name': nameController.text,
          'age': ageController.text,
          'gender': genderController.text,
          'mobile': mobileController.text,
          'journeyDate': journeyDateController.text,
          'from': fromController.text,
          'to': toController.text,
          'pnr': pnrController.text,
          'trainNumber': trainNumberController.text,
          'trainName': trainNameController.text,
          'birthType': birthTypeController.text,
        });
        clearForm();
      });
    }
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
          // thickness: 5,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
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

                    // Passenger List
                    PassengerList(
                      passengers: passengers,
                      onDelete: _deletePassenger,
                    ),
                    SizedBox(height: 16),
                    // Add Passenger Form
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelText(text: 'passenger_name'.tr),
                          CustomTextFormField(
                            hintText: 'enter_passenger_name'.tr,
                            controller: nameController,
                          ),
                          CustomLabelText(text: 'age'.tr),
                          CustomTextFormField(
                            hintText: 'enter_age'.tr,
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            // Optionally restrict to digits
                            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                          CustomLabelText(text: 'gender'.tr),
                          CustomTextFormField(
                            hintText: 'enter_gender'.tr,
                            controller: genderController,
                          ),
                          CustomLabelText(text: 'mobile_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_mobile_number'.tr,
                            controller: mobileController,
                          ),
                          CustomLabelText(text: 'journey_date'.tr),
                          CustomTextFormField(
                            hintText: 'enter_journey_date'.tr,
                            suffixIcon: Icon(Icons.calendar_month),
                            controller: journeyDateController,
                          ),
                          CustomLabelText(text: 'from'.tr),
                          CustomTextFormField(
                            hintText: 'from'.tr,
                            controller: fromController,
                          ),
                          CustomLabelText(text: 'to'.tr),
                          CustomTextFormField(
                            hintText: 'to'.tr,
                            controller: toController,
                          ),
                          CustomLabelText(text: 'pnr_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_pnr_number'.tr,
                            controller: pnrController,
                          ),
                          CustomLabelText(text: 'train_number'.tr),
                          CustomTextFormField(
                            hintText: 'enter_train_number'.tr,
                            controller: trainNumberController,
                          ),
                          CustomLabelText(text: 'train_name'.tr),
                          CustomTextFormField(
                            hintText: 'enter_train_name'.tr,
                            controller: trainNameController,
                          ),
                          CustomLabelText(text: 'birth_type'.tr),
                          CustomTextFormField(
                            hintText: 'enter_birth_type'.tr,     
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'Add Passenger',
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 48,
                            width: double.infinity,
                            onPressed: _addPassenger,
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'submit_btn'.tr,
                            textSize: 14,
                            backgroundColor: AppColors.btnBgColor,
                            height: 62,
                            width: double.infinity,
                            onPressed: () {
                              if (passengers.isNotEmpty) {
                                Get.to(() => TickethomePage(), arguments: passengers);
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