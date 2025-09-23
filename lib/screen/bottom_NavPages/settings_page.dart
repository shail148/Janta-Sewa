import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/controllers/setting_controller.dart';
import 'package:janta_sewa/screen/about_janta_sewa/privacy_policy_page.dart';
import 'package:janta_sewa/screen/about_janta_sewa/terms_of_use_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/report_issue_page.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/setting_widget.dart';


class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  // find from app_binding.dart ,all controller binding present here
  final SettingsController controller = Get.find<SettingsController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomTopAppBar(
        title: 'Setting',
        leftIcon: Icon(Icons.arrow_back_ios, size: 24), 
        onLeftTap: Get.back,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildProfileHeader(languageController),
          const SizedBox(height: 8),
          buildSectionTitle("Account Security"),
          buildButtonTile(
            "Change Password",
            Icons.lock_outline,
            onTap: () {
              // Navigate to change password screen
            },
          ),
          const SizedBox(height: 8),
          buildSectionTitle("Notification"),
          buildToggleTile(
            "Email Alerts",
            controller.emailAlerts,
            controller.toggleEmailAlerts,
            icon: Icons.email_outlined,
          ),
          buildToggleTile(
            "SMS Alerts",
            controller.smsAlerts,
            controller.toggleSmsAlerts,
            icon: Icons.sms_outlined,
          ),
          buildToggleTile(
            "Notification",
            controller.pushNotifications,
            controller.togglePushNotifications,
            icon: Icons.notifications_outlined,
          ),
          const SizedBox(height: 8),
          buildSectionTitle("Language"),
          buildLanguageToggleTile(languageController),
          const SizedBox(height: 8),
          buildSectionTitle("Support & Legal"),
          buildNavigationTile(
            "Share this app",
            Icons.share_outlined,
            onTap: () {
              // Implement share logic
            },
          ),
          buildNavigationTile(
            "Privacy policy",
            Icons.privacy_tip_outlined,
            onTap: () {
              Get.to(() => const PrivacyPolicyPage());
            },
          ),
          buildNavigationTile(
            "Terms of Use",
            Icons.warning_amber_outlined,
            onTap: () {
              Get.to(() => const TermsOfUsePage());
            },
          ),
          //  NEW SECTION: Report an Issue
          buildNavigationTile(
            "Report an issue",
            Icons.bug_report_outlined,
            onTap: () {
              // Navigate to report issue or open email
              // can  launch("mailto:support@example.com")

              Get.to(ReportIssuePage());
            },
          ),
          const SizedBox(height: 32),
          buildLogoutButton(controller),
        ],
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/controllers/setting_controller.dart';
import 'package:janta_sewa/screen/about_janta_sewa/privacy_policy_page.dart';
import 'package:janta_sewa/screen/about_janta_sewa/terms_of_use_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/screen/bottom_NavPages/report_issue_page.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';


class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  // find from app_binding.dart ,all controller binding present here
  final SettingsController controller = Get.find<SettingsController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomTopAppBar(
        title: 'Setting',
        leftIcon: Icon(Icons.arrow_back_ios, size: 24.sp), // responsive icon
        onLeftTap: Get.back,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 8),
          _buildSectionTitle("Account Security"),
          _buildButtonTile(
            "Change Password",
            Icons.lock_outline,
            onTap: () {
              // Navigate to change password screen
            },
          ),
          const SizedBox(height: 8),
          _buildSectionTitle("Notification"),
          _buildToggleTile(
            "Email Alerts",
            controller.emailAlerts,
            controller.toggleEmailAlerts,
            icon: Icons.email_outlined,
          ),
          _buildToggleTile(
            "SMS Alerts",
            controller.smsAlerts,
            controller.toggleSmsAlerts,
            icon: Icons.sms_outlined,
          ),
          _buildToggleTile(
            "Notification",
            controller.pushNotifications,
            controller.togglePushNotifications,
            icon: Icons.notifications_outlined,
          ),
          const SizedBox(height: 8),
          _buildSectionTitle("Language"),
          _buildLanguageToggleTile(),
          const SizedBox(height: 8),
          _buildSectionTitle("Support & Legal"),
          _buildNavigationTile(
            "Share this app",
            Icons.share_outlined,
            onTap: () {
              // Implement share logic
            },
          ),
          _buildNavigationTile(
            "Privacy policy",
            Icons.privacy_tip_outlined,
            onTap: () {
              Get.to(() => const PrivacyPolicyPage());
            },
          ),
          _buildNavigationTile(
            "Terms of Use",
            Icons.warning_amber_outlined,
            onTap: () {
              Get.to(() => const TermsOfUsePage());
            },
          ),
          //  NEW SECTION: Report an Issue
          _buildNavigationTile(
            "Report an issue",
            Icons.bug_report_outlined,
            onTap: () {
              // Navigate to report issue or open email
              // can  launch("mailto:support@example.com")

              Get.to(ReportIssuePage());
            },
          ),
          const SizedBox(height: 32),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2), // Border thickness
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFD9D9D9),
                width: 2.0, // Border width
              ),
            ),
            child: CircleAvatar(
              radius: 28,
              //backgroundImage: AssetImage('assets/images/user_placeholder.png'),
              backgroundColor: AppColors.white, // Optional
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name text and inkwell
                InkWell(
                  onTap: () {
                    //Get.to(() => const BottomNav(), arguments: 3); // 3 = Profile tab index, i got earlier int so error while using in map
                    Get.to(
                      () => const BottomNav(),
                      arguments: {'index': 3},
                    ); // use a map, key matches the check in BottomNav
                  },
                  child: Text(
                    "Rahul Sharma",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.black),
                  ),
                ),

                //gram sachiv text and inkwell
                InkWell(
                  onTap: () {
                    Get.to(() => const BottomNav(), arguments: {'index': 3});
                  },
                  child: Text(
                    "Gram Sachiv",
                    style: TextStyle(fontSize: 14, color: Color(0xFF626262)),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to edit profile screen in editing mode
              // send both the tab index (3) and editing flag
              Get.to(
                () => const BottomNav(),
                arguments: {'index': 3, 'edit': true},
              );
            },
            child: Text(
              "Edit Profile",
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonTile(
    String title,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.black),
        title: Text(
          title,
          style: TextStyle(color: AppColors.black, fontSize: 14),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.black,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildNavigationTile(
    String title,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.black),
        title: Text(
          title,
          style: TextStyle(color: AppColors.black, fontSize: 14),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.black,
        ),
        onTap: onTap,
      ),
    );
  }


 /*  Widget _buildToggleTile(
    String title,
    RxBool value,
    Function(bool) onChanged, {
    required IconData icon,
  }) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60, // Keep normal row height
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFD9D9D9)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.black), // Normal size icon
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: AppColors.black, fontSize: 14),
                ), // Normal size text
              ],
            ),

            Transform.scale(
              scale: 0.8, // Shrink only the toggle button
              child: Switch(
                value: value.value,
                onChanged: onChanged,
                activeTrackColor: AppColors.btnBgColor,
                activeColor: AppColors.white,
                inactiveThumbColor: AppColors.btnBgColor,
                inactiveTrackColor: Colors.grey.shade300,
              ),
            ),
            /* FlutterSwitch(
              width: 50.0,
              height: 25.0,
              toggleSize: 18.0, // Smaller knob
              value: languageController.isHindi,
              borderRadius: 20.0,
              padding: 3.0,
              activeColor: AppColors.btnBgColor,
              inactiveColor: Colors.grey.shade300,
              toggleColor: Colors.white,
              onToggle: (val) {
                languageController.toggleLanguage(val);
              },
            ), */
          ],
        ),
      ),
    );
  } */

 Widget _buildToggleTile(
  String title,
  RxBool value,
  Function(bool) onChanged, {
  required IconData icon,
}) {
  return Obx(
    () => Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFD9D9D9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.black),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: AppColors.black, fontSize: 14),
              ),
            ],
          ),
          FlutterSwitch(
            width: 42.0,
            height: 26.0,
            toggleSize: 16.0, // 👈 smaller toggle circle
            value: value.value,
            borderRadius: 20.0,
            padding: 2.0,
            activeColor: AppColors.btnBgColor,
            inactiveColor: Colors.grey.shade300,
            //inactiveColor: const Color(0xFFD9D7E3), 
            //inactiveColor: const Color(0xFFD9D9D9),
            toggleColor: AppColors.white,
            onToggle: onChanged,
          ),
        ],
      ),
    ),
  );
}


  /* /// Language toggle with "English | Switch | हिन्दी"
  Widget _buildLanguageToggleTile() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.language, color: AppColors.black),
                const SizedBox(width: 10),
                Text(
                  "Change Language",
                  style: TextStyle(color: AppColors.black, fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                /* Text("English", style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 4), */
                Transform.scale(
                  scale: 0.8, // Shrink only the toggle button
                  child: Switch(
                    //value: languageController.toggleLanguage.value,
                    value: languageController.isHindi,

                    onChanged: (val) {
                      languageController.toggleLanguage(val);
                      //languageController.toggleLanguage(val);
                    },
                    activeTrackColor: AppColors.btnBgColor,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.btnBgColor,
                    inactiveTrackColor: Colors.grey.shade300,
                  ),
                ),
                /*  const SizedBox(width: 4),
                  Text("हिन्दी", style: TextStyle(fontSize: 12)), */
              ],
            ),
          ],
        ),
      ),
    );
  } */

 Widget _buildLanguageToggleTile() {
  return Obx(
    () => Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: AppColors.black),
              const SizedBox(width: 10),
              Text(
                "Change Language",
                style: TextStyle(color: AppColors.black, fontSize: 14),
              ),
            ],
          ),
          FlutterSwitch(
            width: 42.0, // Smaller width
            height: 26.0, // Smaller height
            toggleSize: 16.0, // Smaller toggle circle
            value: languageController.isHindi,
            borderRadius: 20.0,
            padding: 2.0,
            activeColor: AppColors.btnBgColor,
            inactiveColor: Colors.grey.shade300,
            //inactiveColor: const Color(0xFFD9D7E3), 
            //inactiveColor: const Color(0xFFD9D9D9),
            toggleColor: AppColors.white,
            onToggle: (val) {
              languageController.toggleLanguage(val);
            },
          ),
        ],
      ),
    ),
  );
}


  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: () => controller.logout(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        "Logout",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

 */

/* import 'package:flutter/material.dart';
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
 */