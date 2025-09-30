import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/view/bottom_NavPages/bottom_nav.dart';

class HospitalViewModel extends GetxController {
  //final _api = HospitalRepository();

  final patientName = TextEditingController().obs;
  final nameOfAttendant = TextEditingController().obs;
  final relationWithPatient = TextEditingController().obs;
  final disease = TextEditingController().obs;
  final admissionType = TextEditingController().obs;
  final hospitalName = TextEditingController().obs;
  final hospitalAddress = TextEditingController().obs;
  final message = TextEditingController().obs;
  final referenceSource = TextEditingController().obs;
  final designationReference = TextEditingController().obs;
  final mobileNumberReference = TextEditingController().obs;
  final hospitalContactPersonName = TextEditingController().obs;
  final hospitalContactPersonMobileNumber = TextEditingController().obs;
  final hospitalDesignation = TextEditingController().obs;
  final hospitalMobileNumber = TextEditingController().obs;
  final hospitalWhatsAppNumber = TextEditingController().obs;



  //controller for hospital admission 
  void hospitalAdmissionApi() async {
    // try {
    //   var value = await _api.hospitalAdmissionApi(data);
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
