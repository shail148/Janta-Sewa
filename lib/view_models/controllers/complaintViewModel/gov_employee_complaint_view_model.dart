import 'dart:developer' as dev;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/complaint/complaint_repository.dart';

import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class GovEmployeeComplaintViewModel extends GetxController {
  final _api = ComplaintRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // Controllers
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final departmentName = TextEditingController().obs;
  final employeeName = TextEditingController().obs;
  final designation = TextEditingController().obs;
  final briefDetails = TextEditingController().obs;
  final message = TextEditingController().obs;

  RxBool isLoading = false.obs;

  Future<void> submitGovEmployeeComplaint() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      final data = {
        "applicantName": applicantName.value.text.trim(),
        "mobileNumber": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "departmentName": departmentName.value.text.trim(),
        "employeeName": employeeName.value.text.trim(),
        "designation": designation.value.text.trim(),
        "briefDetails": briefDetails.value.text.trim(),
        "message": message.value.text.trim(),
      };

      final token = await _secureStorage.read(key: 'token');
      if (token == null) {
        Utils.showErrorSnackBar('Error', 'Authentication token not found.');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };
      final files = List<PlatformFile>.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('📤 GovEmployeeComplaint Data: $data');
      }

      final res = await _api.createGovernmentEmployeeComplaintApi(data, headers: headers, files: files);

      if (res['success'] == true) {
        Utils.showSuccessSnackBar('Success', res['message'] ?? 'Submitted Successfully');
        fileController.uploadedFiles.clear();
        Get.offAll(() => const BottomNav());
      } else {
        Utils.showErrorSnackBar('Error', res['message'] ?? 'Something went wrong');
      }
    } catch (e, st) {
      dev.log('❌ GovEmployeeComplaint Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    for (var c in [
      applicantName,
      applicantMobile,
      address,
      departmentName,
      employeeName,
      designation,
      briefDetails,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
