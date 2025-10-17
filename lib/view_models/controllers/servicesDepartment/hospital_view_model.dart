import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/service_department_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'dart:developer' as dev;

class HospitalViewModel extends GetxController {
  final _api = ServiceDepartmentRepository();
  final _secureStorage = const FlutterSecureStorage();

  // Form controllers
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
  final List<String> relationOptions = ['Father', 'Mother', 'Brother', 'Wife'];
  final List<String> admissionTypes = [
    'Government Hospital',
    'Private Hospital',
    "Emergency Admission",
  ];
  // Dropdowns
  RxString selectedRelation = ''.obs;
  RxString selectedAdmissionType = ''.obs;

  final isLoading = false.obs;

  Future<void> hospitalAdmissionApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Build the JSON exactly like your dummy data
      final Map<String, dynamic> data = {
        "patientName": patientName.value.text.trim(),
        "attendantName": nameOfAttendant.value.text.trim(),
        "relationWithPatient": selectedRelation.value.trim(),
        "disease": disease.value.text.trim(),
        "admissionType": selectedAdmissionType.value.trim(),
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

      // 🔐 Get token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Error', 'Authentication token not found.');
        isLoading.value = false;
        return;
      }

      // ✅ Proper JSON headers
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      if (kDebugMode) {
        dev.log('📤 Sending Hospital Admission JSON: ${jsonEncode(data)}');
      }

      // ✅ Call repository (JSON version)
      final response = await _api.createHospitalAdmissionApi(
        data,
        headers: headers,
      );

      isLoading.value = false;

      // ✅ Response handling
      if (response['success'] == true) {
        Utils.showSuccessSnackBar('Success', 'Hospital Admission Submitted');
        Get.offAll(() => const BottomNav());
      } else {
        Utils.showErrorSnackBar(
          'Error',
          response['message']?.toString() ?? 'Something went wrong',
        );
      }
    } catch (e, st) {
      isLoading.value = false;
      dev.log('❌ HospitalAdmissionApi Error: $e\n$st');
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }

  // Dispose
  @override
  void onClose() {
    for (var c in [
      patientName,
      nameOfAttendant,
      disease,
      hospitalName,
      hospitalAddress,
      message,
      referenceSource,
      designationReference,
      mobileNumberReference,
      hospitalContactPersonName,
      hospitalDesignation,
      hospitalMobileNumber,
      hospitalWhatsAppNumber,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
