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

class FinancialRecommendationViewModel extends GetxController {
  // 🔹 Dependencies
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final tentativeAmount = TextEditingController().obs;
  final message = TextEditingController().obs;
  final remarks = TextEditingController().obs;
  final RxList<String> department = [
    'state'.tr,
    'National'.tr,
    'private'.tr,
  ].obs;

  RxString selectedDepartment = ''.obs;
  final RxList<String> reasonOfProblem = [
    'Health'.tr,
    'Education'.tr,
    'Employment'.tr,
    'Samiti'.tr,
    'Sports'.tr,
    'Other'.tr,
  ].obs;
  RxString selectedReasonOfProblem = ''.obs;
  RxBool isLoading = false.obs;

  /// 🚀 API Call - Financial Recommendation
  Future<void> financialRecommendationApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Build request body
      final Map<String, dynamic> data = {
        "department": selectedDepartment.value.trim(),
        "applicantName": applicantName.value.text.trim(),
        "mobileNumber": applicantMobile.value.text.trim(),
        "reasonOfProblem": selectedReasonOfProblem.value.trim(),
        "tentativeAmount": tentativeAmount.value.text.trim(),
        "message": message.value.text.trim(),
        "remarks": remarks.value.text.trim(),
      };

      // ✅ Get auth token
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

      // ✅ Attach files (if any)
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('💰 Sending Financial Recommendation Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ Send to repository
      final res = await _api.createFinancialRecommendationLetterApi(
        data,
        headers: headers,
        files: files,
      );

      // ✅ Handle response
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Financial Recommendation Submitted 🎉',
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
      dev.log('❌ financialRecommendationApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🧹 Dispose all controllers
  @override
  void onClose() {
    super.onClose();
  }
}
