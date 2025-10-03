import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmissionLetterViewModel extends GetxController {
  //creating the variable for the controller
  final typeOfAdmission = TextEditingController().obs;
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final studentName = TextEditingController().obs;
  final courseName = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  RxBool isLoading = false.obs;

  //creating a controller method  for the admission letter

  void admissionLetterApi() async {
    // try {
    //   var value = await _api.admissionLetterApi(data);
    //   if (value['error'] != null) {
    //     Utils.showErrorSnackBar("Error", value['error'].toString());
    //   } else {
    //     Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
    //     Get.offAll(() => const BottomNav());
    //   }
    // } catch (e) {
    //   Utils.showErrorSnackBar("Error", e.toString());
    // }
  }
}
