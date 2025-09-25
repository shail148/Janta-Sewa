import 'package:get/get.dart';
import 'package:janta_sewa/controllers/language_controller.dart';
import 'package:janta_sewa/controllers/report_issue_controller.dart';
import 'package:janta_sewa/controllers/setting_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {

    //  Auto recreate when needed
    Get.lazyPut<ReportIssueController>(() => ReportIssueController(), fenix: true);
    
    Get.put<LanguageController>(LanguageController(), permanent: true);
   
   //
    Get.put<SettingsController>(SettingsController(), permanent: true);



  }
}
