import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_main_page.dart';
import 'package:janta_sewa/views/servicesDepartment/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/controllers/ticket_controller2.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
class TicketConfirmation2 extends StatelessWidget {
  final TicketController2 controller = Get.put(TicketController2());

  TicketConfirmation2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "ticket_confirmation".tr,
              color: AppColors.textColor,
              fontsize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.passengers.length,
                  itemBuilder: (context, index) {
                    final passenger = controller.passengers[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF2FF),
                        // color: AppColors.galleryBdColors,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${passenger.name}, ${passenger.age}(${passenger.gender})",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.removePassenger(index),
                            child: const Icon(
                              Icons.delete_outline,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  // onTap: controller.addPassenger,
                  onTap: () => Get.to(() => TicketConfirmation()),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.add, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'submit_btn'.tr,
              textSize: 14,
              backgroundColor: AppColors.btnBgColor,
              height: 62,
              width: double.infinity,
              // onPressed: controller.submit,
              onPressed: () {
                Get.to(() => BottomNav());
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
