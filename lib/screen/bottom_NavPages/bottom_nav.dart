// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/screen/bottom_NavPages/home_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/profile_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/support_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/track_page.dart';
import 'package:janta_sewa/widget/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    SupportPage(),
    TrackPage(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
