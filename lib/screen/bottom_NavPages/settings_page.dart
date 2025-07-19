import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_list_tile.dart';
import 'package:janta_sewa/screen/about_janta_sewa/privacy_policy_page.dart';
import 'package:janta_sewa/widget/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomListTile(title: 'Notification', onTap: () {},
            leadingWidget: Icon(Icons.notifications,color: AppColors.btnBgColor,),
           ),
            CustomListTile(title: 'Change Language', onTap: () {}),
            CustomListTile(
              title: 'Share this App',
              onTap: () {},
              leadingWidget: Icon(Icons.share, color: AppColors.btnBgColor),
            ),
            CustomListTile(
              title: 'Rate this App',
              onTap: () {},
              leadingWidget: Icon(Icons.star_border, color: AppColors.btnBgColor),
            ),
            CustomListTile(title: 'Privacy Policy', onTap: () {
              Get.to(()=>PrivacyPolicyPage());
            }),
            CustomListTile(title: 'Terms of Use', onTap: () {
            }),
          ],
        ),
      ),
    );
  }
}

