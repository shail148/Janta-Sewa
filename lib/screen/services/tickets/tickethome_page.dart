import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/widget/button.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';


class TickethomePage extends StatefulWidget {
  const TickethomePage({super.key});

  @override
  State<TickethomePage> createState() => _TickethomePageState();
}

class _TickethomePageState extends State<TickethomePage> {
  // For demonstration, use a static list. Replace with actual data passing as needed.
  final List<Map<String, String>> passengers = [
    // Example data; replace with actual data from navigation arguments or state management.
    // {'name': 'John', 'gender': 'Male', 'pnr': '123456'},
    // {'name': 'Priya', 'gender': 'Female', 'pnr': '654321'},
  ];

  @override
  Widget build(BuildContext context) {
    // If using GetX, you can get arguments like this:
    // final List<Map<String, String>> passengers = Get.arguments ?? [];

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
                    // Show passenger list
                    ...passengers.map((p) => Card(
                      color: const Color(0xFFF5F6FA),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(
                          "${p['name'] ?? ''}, ${p['gender'] ?? ''}, ${p['pnr'] ?? ''}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    )),
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
            ),
          ),
        ),
      ),
    );
  }
}