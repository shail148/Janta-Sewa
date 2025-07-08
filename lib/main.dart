// ignore_for_file: unused_import

import 'package:cloudinary_url_gen/config/cloudinary_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/localization/localization.dart';
import 'package:janta_sewa/screen/forgotPassword/reset_password.dart';
import 'package:janta_sewa/screen/bottom_NavPages/home_screen.dart';
import 'package:janta_sewa/screen/auth_page/language_switch.dart';
import 'package:janta_sewa/screen/letters/complains/compain_menu.dart';
import 'package:janta_sewa/screen/letters/recommends/recommendation_menu.dart';
import 'package:janta_sewa/screen/auth_page/login_page.dart';
import 'package:janta_sewa/screen/register_page.dart';
import 'package:janta_sewa/screen/registrationPages/authorized_person_reg.dart';
import 'package:janta_sewa/screen/registrationPages/general_register.dart';
import 'package:janta_sewa/screen/registrationPages/samajik_sansatha_register.dart';
import 'package:janta_sewa/screen/registrationPages/sangthan_reg.dart';
import 'package:janta_sewa/screen/services_department/hospital/hospital_admission.dart';
import 'package:janta_sewa/screen/services_department/parliament_visit/parliament_visit.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/widget/colors.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(), // your translations
      locale: const Locale('en', 'US'), // default locale
      fallbackLocale: const Locale('en', 'US'),
      title: 'Janta Sewa',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          
        ),
        hoverColor: AppColors.btnBgColor
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNav(),
    );
  }
}
