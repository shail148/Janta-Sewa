import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:janta_sewa/screen/auth_page/language_switch.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/screen/bottom_NavPages/report_issue_page.dart';


import 'app_routes.dart';

class AppPages {
  static final pages = [
    
    GetPage(name: AppRoutes.reportissue, page: () => ReportIssuePage()),
     GetPage(name: AppRoutes.languageswitch, page: () => LanguageSwitch()),
      GetPage(name: AppRoutes.bottomnav, page: () => BottomNav()),

      
    
  ];
}
