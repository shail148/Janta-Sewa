import 'dart:developer' as dev;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/budget/budget_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class BudgetDemandViewModel extends GetxController {
  // Dependencies
  final _api = BudgetRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // Form controllers
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final departmentName = TextEditingController().obs;
  final nameOfOfficeWorkDemanded = TextEditingController().obs;
  final message = TextEditingController().obs;

  // Dropdowns
  final RxList<String> requestForList = <String>[
    'New Government Office'.tr,
    'New Government Major Work'.tr,
  ].obs;
  RxString selectedRequestFor = ''.obs;
  void setRequestFor(String value) => selectedRequestFor.value = value;

  final RxList<String> levelOfGovernmentList = <String>[
    'National Government'.tr,
    'State Government'.tr,
  ].obs;
  RxString selectedLevelOfGovernment = ''.obs;
  void setLevelOfGovernment(String value) =>
      selectedLevelOfGovernment.value = value;

  // Loading state
  RxBool isLoading = false.obs;

  /// Create Budget Demand Letter
  Future<void> createBudgetDemandLetter() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // Request payload
      final Map<String, dynamic> data = {
        "requestFor": selectedRequestFor.value,
        "applicantName": applicantName.value.text.trim(),
        "mobileNumber": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "levelOfGovernment": selectedLevelOfGovernment.value,
        "departmentName": departmentName.value.text.trim(),
        "nameOfOfficeWorkDemanded":
            nameOfOfficeWorkDemanded.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // Auth token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth', 'Please login again');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      // Files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('📤 Budget Demand Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // API Call
      final res = await _api.createBudgetApi(
        data,
        headers: headers,
        files: files,
      );

      if (res['success'] == true) {
        Utils.showSuccessSnackBar('Success', res['message'] ?? 'Submitted!');
        fileController.uploadedFiles.clear();
        Get.offAll(() => const BottomNav());
      } else {
        Utils.showErrorSnackBar(
          'Error',
          res['message'] ?? 'Something went wrong',
        );
      }
    } catch (e, st) {
      dev.log('❌ createBudgetDemandLetter Error: $e\n$st');
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
      nameOfOfficeWorkDemanded,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
