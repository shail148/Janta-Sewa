
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/auth_page/login_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/our_journey_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/settings_page.dart';
import 'package:janta_sewa/screen/contacts_invitation/contact_page.dart';
import 'package:janta_sewa/screen/events/event_page.dart';
import 'package:janta_sewa/screen/notification/notification_page.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.btnBgColor),
              child: SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/sliderimages/1.png'),
                    ),
                    SizedBox(height: 10),
                    CustomTextWidget(text: 'Welcome Shailendra', color: Colors.white,
                    fontsize: 12,),
                    CustomTextWidget(
                      text: 'shailendra@gmail.com',
                      color: Colors.white,
                      fontsize: 12,
                    ),
                  ],
                ),
              ),
            ),

            // Drawer items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(
                    Icons.home,
                    'home'.tr,
                    onTap: () => Get.offAll(() => const BottomNav()),
                  ),
                  // _drawerItem(
                  //   Icons.dashboard,
                  //   'Dashboard',
                  //   onTap: () => Get.to(() => const ServicesHomeScreen()),
                  // ),
                  _drawerItem(
                    Icons.event,
                    'upcoming_event'.tr,
                    onTap: () => Get.to(() => const EventPage()),
                  ),
                  _drawerItem(
                    Icons.timeline,
                    'our_journey'.tr,
                    onTap: () => Get.to(() => const OurJourneyPage()),
                  ),
                  _drawerItem(
                    Icons.notifications,
                    'notifications'.tr,
                    onTap: () => Get.to(() => const NotificationPage()),
                  ),
                  // _drawerItem(Icons.person, 'Profile', onTap: () => Get.to(() => const ProfileScreen())),
                  _drawerItem(
                    Icons.contact_page,
                    'contact_us'.tr,
                    onTap: () => Get.to(() => const ContactPage()),
                  ),
                  _drawerItem(
                    Icons.settings,
                    'settings'.tr,
                    onTap: () => Get.to(() => const SettingsPage()),
                  ),
                  _drawerItem(
                    Icons.share_outlined,
                    'share_this_app'.tr,
                    onTap: (){
                     
       
                    },
                  ),
                  _drawerItem(
                    Icons.logout,
                    'logout'.tr,
                    onTap: () => Get.offAll(() => const LoginPage()),
                  ),
                ],
              ),
            ),

            // Sticky Footer
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  CustomTextWidget(
                    text: '© 2025 \nDesigned and Developed by',
                    textAlign: TextAlign.center,
                    fontsize: 10,

                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://kasperinfotech.com/');
                      if (!await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch $url';
                      }
                    },
                      child: CustomTextWidget(text: 'Kasper Infotech Pvt. Ltd.',color: AppColors.textColor,
                      fontsize: 10,),
                    ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _drawerItem(
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.btnBgColor,size: 32,),
      title: CustomTextWidget(text: title),
      onTap: onTap,
    );
  }

  



}



