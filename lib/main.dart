// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/bottom_nav.dart';
import 'package:janta_sewa/localization/localization.dart';
import 'package:janta_sewa/screen/forgotPassword/reset_password.dart';
import 'package:janta_sewa/screen/home_screen.dart';
import 'package:janta_sewa/screen/language_switch.dart';
import 'package:janta_sewa/screen/letters/complains/compain_menu.dart';
import 'package:janta_sewa/screen/login_page.dart';
import 'package:janta_sewa/screen/register_page.dart';
import 'package:janta_sewa/screen/registrationPages/authorized_person_reg.dart';
import 'package:janta_sewa/screen/registrationPages/general_register.dart';
import 'package:janta_sewa/screen/registrationPages/samajik_sansatha_register.dart';
import 'package:janta_sewa/screen/registrationPages/sangthan_reg.dart';
import 'package:janta_sewa/screen/services/hospital_admission.dart';
import 'package:janta_sewa/screen/services/parliament_visit.dart';
import 'package:janta_sewa/screen/services/tickets/ticket_confirmation.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNav(),
    );
  }
}
