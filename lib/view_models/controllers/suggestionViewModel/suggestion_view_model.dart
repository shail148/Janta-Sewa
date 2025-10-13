import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class SuggestionViewModel extends GetxController {
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final briefDetails = TextEditingController().obs;
  final message = TextEditingController().obs;
  final uploadedFiles = <PlatformFile>[].obs;
  final suggestionFor = TextEditingController().obs;
  final departmentName = TextEditingController().obs;
  final schemeName = TextEditingController().obs;
  final requestedFor = TextEditingController().obs;
  final levelOfGovernment = TextEditingController().obs;
  final nameOfOfficeWorkDemanded = TextEditingController().obs;
  RxBool isLoading = false.obs;
  //for the suggestion people benefits
  void suggestionForPeopleApi(var data) async {
    try {
      var value;
      //  = await _api.suggestionForPeopleApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
  //method of suggestion gove scheme

  void suggestionForSchemeApi(var data) async {
    try {
      var value;
      //  = await _api.suggestionForSchemeApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }

  //method of suggestion gove department
  void suggestionForDepartmentApi(var data) async {
    try {
      var value;
      //  = await _api.suggestionForDepartmentApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }

  //method of suggestion mp office
  void suggestionForMpOfficeApi(var data) async {
    try {
      var value;
      //  = await _api.suggestionForMpOfficeApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
