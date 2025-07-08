import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_list.dart';

class TickethomePage extends StatefulWidget {
  const TickethomePage({super.key});

  @override
  State<TickethomePage> createState() => _TickethomePageState();
}

class _TickethomePageState extends State<TickethomePage> {
  late List<Map<String, String>> passengers;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args is List<Map<String, String>>) {
      passengers = List<Map<String, String>>.from(args);
    } else {
      passengers = [];
    }
  }

  void _deletePassenger(int index) {
    setState(() {
      passengers.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passenger deleted'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void _addPassenger() async {
    // Go back to confirmation page to add a new passenger
    Get.back(result: passengers);
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
              Expanded(
                child: PassengerList(
                  passengers: passengers,
                  onDelete: _deletePassenger,
                  onAdd: _addPassenger,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'submit_btn'.tr,
                textSize: 14,
                backgroundColor: AppColors.btnBgColor,
                height: 62,
                width: double.infinity,
                onPressed: () {
                  Get.to(() => BottomNav());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
