import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/components/languageToggleSwitch.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/screen/about_janta_sewa/privacy_policy_page.dart';
import 'package:janta_sewa/screen/about_janta_sewa/terms_of_use_page.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final LanguageController languageController = Get.put(LanguageController());
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            

            _buildTileWithTrailing(
              title: 'language'.tr,
              trailing: LanguageToggleSwitch(),
            ),
            _buildToggleTile(
              title: 'notifications'.tr,
              value: isNotificationOn,
              onChanged: (val) {
                setState(() {
                  isNotificationOn = val;
                });
              },
            ),
            CustomListTile(
              title: 'share_this_app'.tr,
              leadingWidget: Icon(
                Icons.share_outlined,
                color: AppColors.btnBgColor,
              ),
              onTap: () {},
            ),
            CustomListTile(
              title: 'rate_this_app'.tr,
              leadingWidget: Icon(
                Icons.star_border,
                color: AppColors.btnBgColor,
              ),
              onTap: () {},
            ),
            CustomListTile(
              title: 'privacy_policy'.tr,
              leadingWidget: Icon(
                Icons.privacy_tip_outlined,
                color: AppColors.btnBgColor,
              ),
              onTap: () {
                Get.to(() => const PrivacyPolicyPage());
              },
            ),
            CustomListTile(
              title: 'terms_of_use'.tr,
              leadingWidget: Icon(
                Icons.warning_amber_outlined,
                color: AppColors.btnBgColor,
              ),
              onTap: () {
                Get.to(() => const TermsOfUsePage());
              },
            ),
          ],
        ),
      ),
    );
  }

  // Toggle Tile (Switch)
  Widget _buildToggleTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.formBgColor,
        border: Border.all(color: AppColors.btnBgColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: title,
            fontsize: 12,
            color: AppColors.btnBgColor,
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.btnBgColor,
            activeColor: Colors.white,
            inactiveThumbColor: AppColors.btnBgColor,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }

  // Language Switch
  Widget _buildTileWithTrailing({
    required String title,
    required Widget trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.formBgColor,
        border: Border.all(color: AppColors.btnBgColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: title,
            fontsize: 12,
            color: AppColors.btnBgColor,
          ),
          trailing,
        ],
      ),
    );
  }

  // Icon Tile (e.g. Share, Rate)

  // Text-only Tile (e.g. Privacy, Terms)
}
