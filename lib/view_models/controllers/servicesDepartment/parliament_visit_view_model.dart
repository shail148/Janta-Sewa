import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/parliament_visit_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_main_page.dart';

class ParliamentVisitViewModel extends GetxController {
  final _api = ParliamentVisitRepository();
  //define the all variables
  final headedPersonName = TextEditingController().obs;
  final headedPersonMobileNumber = TextEditingController().obs;
  final state = TextEditingController().obs;
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final cityVillage = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final date = TextEditingController().obs;
  final pincode = TextEditingController().obs;
  final totalNumberOfMembers = TextEditingController().obs;
  final dateOfVisit = TextEditingController().obs;
  final timeOfVisit = TextEditingController().obs;
  final parliamentName = TextEditingController().obs;
  final parliamentMobileNumber = TextEditingController().obs;
  final message = TextEditingController().obs;



  void parliamentVisitApi(var data) async {
    try {
      var value = await _api.parliamentVisitApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
