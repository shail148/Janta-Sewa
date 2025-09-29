import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/res/routes/routes.dart';
import 'package:janta_sewa/localization/localization.dart';
import 'package:janta_sewa/view/authPages/language_switch_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/view_models/user_preference/user_preference_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userPref = UserPreference();
  final user = await userPref.getUser();

  // orientation in potrait mode setup
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  debugProfileBuildsEnabled = true;
  runApp(MyApp(isLoggedIn: user.email.isNotEmpty && user.password.isNotEmpty));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.appRoutes(),
        //initialBinding: AppBinding(),
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
        ),
        home: isLoggedIn ? BottomNav() : LanguageSwitch(),
      ),
    );
  }
}
