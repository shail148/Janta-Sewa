import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/views/bottomTabs/drawer_page.dart';
import 'package:janta_sewa/views/bottomTabs/main_news_dashboard.dart';
import 'package:janta_sewa/views/bottomTabs/profile_screen_page.dart';
import 'package:janta_sewa/views/bottomTabs/sevices_home_screen.dart';
import 'package:janta_sewa/views/bottomTabs/track_page.dart';
import 'package:janta_sewa/views/notification/notification_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  bool startEditing = false;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args is Map) {
      if (args['index'] != null) selectedIndex = args['index'];
      startEditing = args['edit'] == true;
    }

    pages = [
      MainNewsDashboard(),
      ServicesHomeScreen(),
      TrackPage(),
      ProfileScreen(startEditing: startEditing),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.menu, color: AppColors.btnBgColor, size: 30),
        onLeftTap: () => _scaffoldKey.currentState?.openDrawer(),
        rightIcon: Icon(
          Icons.notifications,
          color: AppColors.btnBgColor,
          size: 30,
        ),
        onRightTap: () {
          Get.to(() => NotificationPage());
        },
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF4F6FE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(Icons.home_outlined, "Home", 0),
            buildNavItem(Icons.dashboard_customize_outlined, "Dashboard", 1),
            buildNavItem(Icons.timelapse_outlined, "Activity", 2),
            buildNavItem(Icons.person_outline, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.btnBgColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? AppColors.primary : AppColors.primary,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
