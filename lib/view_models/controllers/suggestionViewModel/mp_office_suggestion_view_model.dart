import 'dart:developer' as dev;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/suggestionRepository/suggestion_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class MpOfficeSuggestionViewModel extends GetxController {
  // Dependencies
  final _api = SuggestionRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // Form controllers
  final applicantName = TextEditingController().obs;
  final mobileNumber = TextEditingController().obs;
  final address = TextEditingController().obs;
  final departmentName = TextEditingController().obs;
  final briefDetail = TextEditingController().obs;
  final message = TextEditingController().obs;

  // Dropdown: Suggestion For
  final RxList<String> suggestionForList = <String>[
    'Public Issue'.tr,
    'Constituency Work'.tr,
    'Development Request'.tr,
    'Other'.tr,
  ].obs;

  RxString selectedSuggestionFor = ''.obs;
  void setSuggestionFor(String value) => selectedSuggestionFor.value = value;

  // Loading state
  RxBool isLoading = false.obs;

  /// Submit Suggestion for MP Office
  Future<void> submitMpOfficeSuggestion() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // Prepare request data
      final Map<String, dynamic> data = {
        "applicantName": applicantName.value.text.trim(),
        "mobileNumber": mobileNumber.value.text.trim(),
        "address": address.value.text.trim(),
        "suggestionFor": selectedSuggestionFor.value,
        "departmentName": departmentName.value.text.trim(),
        "briefDetailOfSuggestion": briefDetail.value.text.trim(),
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

      // Uploaded files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('📤 MP Office Suggestion Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // API Call
      final res = await _api.createSuggestionForMpOfficeApi(
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
      dev.log('❌ submitMpOfficeSuggestion Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    for (var c in [
      applicantName,
      mobileNumber,
      address,
      departmentName,
      briefDetail,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
