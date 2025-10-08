import 'package:get/get.dart';
import 'package:janta_sewa/res/routes/app_routes.dart';
import 'package:janta_sewa/views/auth/language_switch_page.dart';
import 'package:janta_sewa/views/auth/login_page.dart';
import 'package:janta_sewa/views/auth/general_register_page.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/profile_screen_page.dart';
import 'package:janta_sewa/views/forgotPassword/forgot_otp_verification_page.dart';
import 'package:janta_sewa/views/forgotPassword/reset_password_page.dart';

class AppPages {
  static final initialRoute = AppRoutes.initialRoute;

  static final routes = [
    GetPage(name: AppRoutes.initialRoute, page: () => const LanguageSwitch()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.registerPage, page: () => GeneralRegister()),
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: () => const ResetPassword(),
    ),
    GetPage(
      name: AppRoutes.resetPasswordPage,
      page: () => const ResetPassword(),
    ),
    GetPage(
      name: AppRoutes.verifyForgotPasswordPage,
      page: () => const ForgotOtpVerification(),
    ),
    GetPage(name: AppRoutes.mainPage, page: () => const BottomNav()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfileScreen()),
  ];
}
