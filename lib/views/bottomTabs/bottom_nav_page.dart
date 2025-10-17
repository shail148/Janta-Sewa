import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/views/bottomTabs/drawer_page.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/main_news_dashboard.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/profile_screen_page.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/sevices_screen.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/track_page.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: pages[selectedIndex],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        iconPadding: 10,
        key: _bottomNavigationKey,
        index: selectedIndex,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: AppColors.white),
            label: 'Home',
            labelStyle: TextStyle(color: AppColors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.dashboard_customize_outlined,
              color: AppColors.white,
            ),
            label: 'Dashboard',
            labelStyle: TextStyle(color: AppColors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.timelapse_outlined, color: AppColors.white),
            label: 'Activity',
            labelStyle: TextStyle(color: AppColors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person_outline, color: AppColors.white),
            label: 'Profile',
            labelStyle: TextStyle(color: AppColors.white),
          ),
        ],
        color: AppColors.primary,
        height: 65,
        buttonBackgroundColor: AppColors.primary,
        backgroundColor: AppColors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) => onItemTapped(index),
        letIndexChange: (index) => true,
      ),
    );
  }
}
