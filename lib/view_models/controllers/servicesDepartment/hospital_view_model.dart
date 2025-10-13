import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/hospital_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class HospitalViewModel extends GetxController {
  final _api = HospitalRepository();
  final _secureStorage = const FlutterSecureStorage();

  // Text Controllers
  final patientName = TextEditingController().obs;
  final nameOfAttendant = TextEditingController().obs;
  final disease = TextEditingController().obs;
  final hospitalName = TextEditingController().obs;
  final hospitalAddress = TextEditingController().obs;
  final message = TextEditingController().obs;

  final referenceSource = TextEditingController().obs;
  final designationReference = TextEditingController().obs;
  final mobileNumberReference = TextEditingController().obs;

  final hospitalContactPersonName = TextEditingController().obs;
  final hospitalDesignation = TextEditingController().obs;
  final hospitalMobileNumber = TextEditingController().obs;
  final hospitalWhatsAppNumber = TextEditingController().obs;

  // 🔽 Dropdown Options
  final List<String> relationOptions = [
    'father'.tr,
    'mother'.tr,
    'brother'.tr,
    'wife'.tr,
  ];

  final List<String> admissionTypes = [
    'government_hospital'.tr,
    'private_hospital'.tr,
  ];

  // 🔽 Selected Dropdown Values (Obs)
  RxString selectedRelation = ''.obs;
  RxString selectedAdmissionType = ''.obs;

  final isLoading = false.obs;

  // METHOD TO UPDATE DROPDOWNS
  void setRelation(String value) {
    selectedRelation.value = value;
  }

  void setAdmissionType(String value) {
    selectedAdmissionType.value = value;
  }

  // API CALL
  void hospitalAdmissionApi() async {
    try {
      isLoading.value = true;

      Map<String, dynamic> data = {
        "patientName": patientName.value.text.trim(),
        "attendantName": nameOfAttendant.value.text.trim(),
        "relationWithPatient": selectedRelation.value,
        "disease": disease.value.text.trim(),
        "admissionType": selectedAdmissionType.value,
        "hospitalName": hospitalName.value.text.trim(),
        "hospitalAddress": hospitalAddress.value.text.trim(),
        "message": message.value.text.trim(),
        "referenceName": referenceSource.value.text.trim(),
        "referencePost": designationReference.value.text.trim(),
        "referenceMobileNumber": mobileNumberReference.value.text.trim(),
        "hospitalContactPersons": [
          {
            "name": hospitalContactPersonName.value.text.trim(),
            "designation": hospitalDesignation.value.text.trim(),
            "mobileNumber": hospitalMobileNumber.value.text.trim(),
            "whatsappNumber": hospitalWhatsAppNumber.value.text.trim(),
          },
        ],
      };

      String? token = await _secureStorage.read(key: 'token');
      if (token == null) {
        Utils.showErrorSnackBar('Error', 'Authentication token not found.');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await _api.hospitalAdmissionApi(data, headers: headers);
      isLoading.value = false;

      if (response['error'] != null) {
        Utils.showErrorSnackBar('Error', response['error'].toString());
      } else {
        Utils.showSuccessSnackBar('Success', 'Hospital Admission Submitted');
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      isLoading.value = false;
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
