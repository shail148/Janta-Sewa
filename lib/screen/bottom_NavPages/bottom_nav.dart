// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/screen/bottom_NavPages/custom_drawer.dart';
import 'package:janta_sewa/screen/bottom_NavPages/main_news_dashboard.dart';
import 'package:janta_sewa/screen/bottom_NavPages/profile_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/support_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/track_page.dart';
import 'package:janta_sewa/screen/notification/notification_page.dart';
import 'package:janta_sewa/widget/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    MainNewsDashboard(),
    SupportPage(),
    TrackPage(),
    ProfileScreen(),
  ];

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
        onLeftTap: 
           () => _scaffoldKey.currentState?.openDrawer(),
        rightIcon:

            Icon(Icons.notifications, color: AppColors.btnBgColor, size: 30,),onRightTap: (){
              Get.to(()=>NotificationPage());
            },
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF4F6FE),
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,

          selectedItemColor: AppColors.btnBgColor,
          unselectedItemColor: AppColors.textGrey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent_outlined,size: 30,),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_outlined,size: 30,),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,size: 30,),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
