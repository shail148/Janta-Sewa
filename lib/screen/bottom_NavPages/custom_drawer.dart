import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/auth_page/login_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/screen/bottom_NavPages/home_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/profile_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/settings_page.dart';
import 'package:janta_sewa/screen/contacts_invitation/contact_page.dart';
import 'package:janta_sewa/screen/events/event_page.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
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
                      CustomTextWidget(text: 'Welcome User', color: Colors.white),
                      CustomTextWidget(text: 'user@example.com', color: Colors.white),
                    ],
                  ),
                ),
              ),

              // Drawer items
              _drawerItem(
                Icons.home,
                'Home',
                onTap: () => Get.offAll(() => const BottomNav()),
              ),
              _drawerItem(
                Icons.dashboard,
                'Dashboard',
                onTap: () => Get.to(() => const HomeScreen()),
              ),
              _drawerItem(
                Icons.event,
                'Upcoming Event',
                onTap: () => Get.to(() => const EventPage()),
              ),
              _drawerItem(
                Icons.timeline,
                'Our Journey',
                onTap: () => Get.to(() => const EventPage()),
              ),
              _drawerItem(
                Icons.notifications,
                'Notifications',
                onTap: () => Get.snackbar('Tapped', 'Notifications'),
              ),
              _drawerItem(
                Icons.person,
                'Profile',
                onTap: () => Get.to(() => const ProfileScreen()),
              ),
              _drawerItem(
                Icons.contact_page,
                'Contact Us',
                onTap: () => Get.to(() => const ContactPage()),
              ),
              _drawerItem(
                Icons.settings,
                'Settings',
                onTap: () => Get.to(() => const SettingsPage()),
              ),
              _drawerItem(
                Icons.logout,
                'Logout',
                onTap: () => Get.offAll(() => const LoginPage()),
              ),

              const SizedBox(height: 20),
              CustomTextWidget(
                text: '© 2025 \nDesigned and Developed By \nKasper Infotech pvt. ltd.',
                textAlign: TextAlign.center,
                color: Colors.black,
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.btnBgColor),
      title: CustomTextWidget(text: title),
      onTap: onTap,
    );
  }
}
