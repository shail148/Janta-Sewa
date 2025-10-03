import 'package:get/get.dart';
import 'package:janta_sewa/res/routes/app_routes.dart';
import 'package:janta_sewa/views/authPages/language_switch_page.dart';
import 'package:janta_sewa/views/authPages/login_page.dart';
import 'package:janta_sewa/views/register_page.dart';

class AppPages {
  static final initialRoute = AppRoutes.initialRoute;

  static final routes = [
    GetPage(name: AppRoutes.initialRoute, page: () => const LanguageSwitch()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage()),
  ];
}
