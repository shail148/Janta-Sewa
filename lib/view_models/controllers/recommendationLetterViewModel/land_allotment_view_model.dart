import 'dart:developer' as dev;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class LandAllotmentViewModel extends GetxController {
  // 🔹 Dependencies
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // 🔹 Form controllers
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final optedLandDepartment = TextEditingController().obs;
  final optedLandAddress = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;

  // 🔹 Reactive loading
  RxBool isLoading = false.obs;

  /// 🚀 API Call - Land Allotment
  Future<void> landAllotmentApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Prepare data
      final Map<String, dynamic> data = {
        "applicantName": applicantName.value.text.trim(),
        "applicantMobile": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "optedLandDepartment": optedLandDepartment.value.text.trim(),
        "optedLandAddress": optedLandAddress.value.text.trim(),
        "reason": reason.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Get token
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

      // ✅ Attach files if uploaded
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('🏠 Sending Land Allotment Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ API call
      final res = await _api.createLandAllotmentLetterApi(
        data,
        headers: headers,
        files: files,
      );

      // ✅ Response handling
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Land Allotment Submitted Successfully 🎉',
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
      dev.log('❌ landAllotmentApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🧹 Dispose controllers
  @override
  void onClose() {
    for (var c in [
      applicantName,
      applicantMobile,
      address,
      optedLandDepartment,
      optedLandAddress,
      reason,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
