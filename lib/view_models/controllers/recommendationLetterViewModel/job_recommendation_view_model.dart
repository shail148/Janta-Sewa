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

class JobRecommendationViewModel extends GetxController {
  // 🔹 Dependencies
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // 🔹 Form Controllers
  final jobRecommendationType = TextEditingController().obs;
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final postName = TextEditingController().obs;
  final department = TextEditingController().obs;
  final message = TextEditingController().obs;

  // 🔹 Loading State
  RxBool isLoading = false.obs;

  /// 🚀 API Call - Job Recommendation
  Future<void> jobRecommendationApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Prepare Data
      final Map<String, dynamic> data = {
        "jobRecommendationType": jobRecommendationType.value.text.trim(),
        "applicantName": applicantName.value.text.trim(),
        "applicantMobile": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "postName": postName.value.text.trim(),
        "department": department.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Token
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

      // ✅ Attach files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('💼 Sending Job Recommendation Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ API Call
      final res = await _api.createJobRecommendationLetterApi(
        data,
        headers: headers,
        files: files,
      );

      // ✅ Handle Response
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Job Recommendation Submitted 🎉',
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
      dev.log('❌ jobRecommendationApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🧹 Dispose Controllers
  @override
  void onClose() {
    for (var c in [
      jobRecommendationType,
      applicantName,
      applicantMobile,
      address,
      postName,
      department,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
