// ignore_for_file: unused_import
import 'package:cloudinary_url_gen/config/cloudinary_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/bindings/app_bindings.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/routes/app_pages.dart';
import 'package:janta_sewa/routes/app_routes.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/localization/localization.dart';
import 'package:janta_sewa/screen/auth_page/otp_verification.dart';
import 'package:janta_sewa/screen/bottom_NavPages/main_news_dashboard.dart';
import 'package:janta_sewa/screen/bottom_NavPages/newsDashboard/our_journey_page.dart';
import 'package:janta_sewa/screen/bottom_NavPages/profile_screen.dart';
import 'package:janta_sewa/screen/bottom_NavPages/settings_page.dart';
import 'package:janta_sewa/screen/contacts_invitation/contact_page.dart';
import 'package:janta_sewa/screen/events/event_page.dart';
import 'package:janta_sewa/screen/forgotPassword/create_new_password.dart';
import 'package:janta_sewa/screen/forgotPassword/forgot_otp_verification.dart';
import 'package:janta_sewa/screen/forgotPassword/reset_password.dart';
import 'package:janta_sewa/screen/bottom_NavPages/sevices_home_screen.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // orientation in potrait mode setup
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //Get.put(LanguageController());
  debugProfileBuildsEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,

        //added for routes
        initialRoute: AppRoutes.languageswitch,
        getPages: AppPages.pages,
        initialBinding: AppBinding(), // Inject all controllers here

        translations: AppLocalization(), //  translations
        locale: const Locale('en', 'US'), // default locale
        fallbackLocale: const Locale('en', 'US'),
        title: 'Janta Sewa',
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          hoverColor: AppColors.btnBgColor,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        //the First page is language switch LangaugeSwitch(); It is the Initial Route for this Application.
        // home: LanguageSwitch(),
        //home: BottomNav(),
      ),
    );
  }
}
