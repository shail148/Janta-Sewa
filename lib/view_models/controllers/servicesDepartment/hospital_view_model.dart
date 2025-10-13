import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/hospital_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as developer;
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class HospitalViewModel extends GetxController {
  final _api = HospitalRepository();
  final _secureStorage = const FlutterSecureStorage();
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
  final isLoading = false.obs;

  //controller for hospital admission
  void hospitalAdmissionApi() async {
    try {
      isLoading.value = true;
      Map data = {};
      // Retrieve the token from secure storage
      String? token = await _secureStorage.read(key: 'token');

      if (token == null) {
        Utils.showErrorSnackBar(
          'Error',
          'Authentication token not found. Please log in again.',
        );
        isLoading.value = false;
        return;
      }
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };
      final response = await _api.hospitalAdmissionApi(data, headers: headers);
      isLoading.value = false;
      if (response['error'] != null) {
        developer.log('API Error: ${response['error']}');
        Utils.showErrorSnackBar('Error', response['error'].toString());
      } else {
        Utils.showSuccessSnackBar(
          'Success',
          'Parliament visit request submitted successfully.',
        );
        developer.log('Parliament visit request successful: $response');
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
