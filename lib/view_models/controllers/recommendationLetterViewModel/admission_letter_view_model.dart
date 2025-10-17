import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'dart:developer' as dev;

class AdmissionLetterViewModel extends GetxController {
  // 🔹 Repository & dependencies
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());
  // 🔹 Dropdown options
  final typesOfAdmission = ['School', 'College', 'Institute'];
  RxString selectedTypeAdmission = ''.obs;
  // 🔹 Text controllers
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final studentName = TextEditingController().obs;
  final courseName = TextEditingController().obs;
  final message = TextEditingController().obs;
  // 🔹 State variables
  RxBool isLoading = false.obs;

  /// 🚀 API Call
  Future<void> admissionLetterApi() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      // ✅ Build request data
      final Map<String, dynamic> data = {
        "typeOfAdmission": selectedTypeAdmission.value.trim(),
        "applicantName": applicantName.value.text.trim(),
        "mobileNumber": applicantMobile.value.text.trim(),
        "applicantMobile": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "studentName": studentName.value.text.trim(),
        "courseName": courseName.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Token handling
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Error', 'Authentication token not found.');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      //  Files (uploaded via FileUploadController)
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('🏫 Sending Admission Letter Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      //  Call repository
      final res = await _api.createAdmissionLetterApi(
        data,
        headers: headers,
        files: files,
      );
      //  Handle response
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Form Submitted',
        );
        fileController.uploadedFiles.clear();
        Get.offAll(() => const BottomNav());
      } else {
        Utils.showErrorSnackBar(
          'Error',
          res['message'] ?? 'Something went wrong',
        );
      }
    } catch (e, st) {
      dev.log(' admissionLetterApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  ///  Dispose all controllers
  @override
  void onClose() {
    for (var c in [
      applicantName,
      applicantMobile,
      address,
      studentName,
      courseName,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }

  // 🔹 Setter for dropdown
  void setAdmissionType(String value) {
    selectedTypeAdmission.value = value;
  }
}
