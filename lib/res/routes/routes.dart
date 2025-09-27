import 'package:get/get.dart';
import 'package:janta_sewa/res/routes/routes_name.dart';
import 'package:janta_sewa/view/authPages/login_page.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RoutesName.loginPage, page: () => LoginPage()),
  ];
}
