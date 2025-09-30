import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/view/authPages/login_page.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/view/bottom_NavPages/newsDashboard/our_journey_page.dart';
import 'package:janta_sewa/view/bottom_NavPages/drawer_dashboard_services_home_screen.dart';
import 'package:janta_sewa/view/bottom_NavPages/settings_page.dart';
import 'package:janta_sewa/view/contacts_invitation/contact_page.dart';
import 'package:janta_sewa/view/events/event_page.dart';
import 'package:janta_sewa/view/notification/notification_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';
import 'package:janta_sewa/widgets/text_widget.dart';
import 'package:share_plus/share_plus.dart';

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
                    CustomTextWidget(
                      text: 'Welcome Shailendra',
                      color: Colors.white,
                      fontsize: 12,
                    ),
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
                    Icons.dashboard,
                    'dashboardss'.tr,
                    onTap: () =>
                        Get.to(() => const DrawerDashboardServicesHomeScreen()),
                  ),

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
                    onTap: () => Get.to(() => SettingsPage()),
                  ),
                  _drawerItem(
                    Icons.share_outlined,
                    'share_this_app'.tr,
                    onTap: () async {
                      try {
                        final result = await SharePlus.instance.share(
                          ShareParams(
                            text:
                                'Please download Janta Sewa app from this link below : \n\nhttps://play.google.com/store/apps/details?id=com.jantasewa.app',
                            subject: 'Janta Sewa App',
                          ),
                        );
                        // Optionally handle the result
                        if (result.status == ShareResultStatus.success) {
                          if (kDebugMode) {
                            if (kDebugMode) {
                              print('App link shared successfully');
                            }
                          }
                        } else {
                          if (kDebugMode) {
                            print(
                              'Share dismissed or failed: ${result.status}',
                            );
                          }
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print('Error while sharing: $e');
                        }
                      }
                    },
                  ),

                  _drawerItem(
                    Icons.logout,
                    'logout'.tr,
                    onTap: () {
                      //logout is login to make false
                      UserPreference().removeUser().then((value) {
                        if (value) {
                          Get.offAll(() => const LoginPage());
                        }
                      });
                    },
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
                    child: CustomTextWidget(
                      text: 'Kasper Infotech Pvt. Ltd.',
                      color: AppColors.textColor,
                      fontsize: 10,
                    ),
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
      leading: Icon(icon, color: AppColors.btnBgColor, size: 32),
      title: CustomTextWidget(text: title),
      onTap: onTap,
    );
  }
}
