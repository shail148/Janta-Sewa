import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'dart:developer' as dev;

class AwardLetterViewModel extends GetxController {
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // 🔹 Form controllers
  final typeOfAward = TextEditingController().obs;
  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final careerAchievement = TextEditingController().obs;
  final awardName = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final List<String> typesOfAward = ['National', 'State'];

  // 🔽 Selected Value (reactive)
  RxString selectedAwardType = ''.obs;
  // 🔹 State
  RxBool isLoading = false.obs;

  /// 🚀 Submit API Call
  Future<void> awardLetterApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Build data map
      final Map<String, dynamic> data = {
        "typeOfAward": selectedAwardType.value.trim(),
        "fullName": fullName.value.text.trim(),
        "mobileNumber": mobile.value.text.trim(),
        "address": address.value.text.trim(),
        "careerAchievement": careerAchievement.value.text.trim(),
        "awardName": awardName.value.text.trim(),
        "reason": reason.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Get token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth', 'Login again, token missing');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      // ✅ Attach files (images, certificates etc.)
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('🏅 Sending Award Letter Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ Call repository
      final res = await _api.createAwardLetterApi(
        data,
        headers: headers,
        files: files,
      );

      // ✅ Handle response
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Award letter submitted successfully!',
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
      dev.log('❌ awardLetterApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🧹 Dispose all controllers
  @override
  void onClose() {
    for (var c in [
      typeOfAward,
      fullName,
      mobile,
      address,
      careerAchievement,
      awardName,
      reason,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
