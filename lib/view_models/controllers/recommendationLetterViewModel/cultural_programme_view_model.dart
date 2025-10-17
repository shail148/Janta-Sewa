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

class CulturalProgrammeViewModel extends GetxController {
  // 🔹 Repository & dependencies
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // 🔹 Form controllers
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final hostDetail = TextEditingController().obs;
  final date = TextEditingController().obs;
  final programName = TextEditingController().obs;
  final programOwnerName = TextEditingController().obs;
  final inBehalfOf = TextEditingController().obs;
  final message = TextEditingController().obs;

  // 🔹 State
  RxBool isLoading = false.obs;

  /// 🚀 API Call for Cultural Programme
  Future<void> culturalProgrammeApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Build data map
      final Map<String, dynamic> data = {
        "applicantName": applicantName.value.text.trim(),
        "applicantMobile": applicantMobile.value.text.trim(),
        "address": address.value.text.trim(),
        "hostDetail": hostDetail.value.text.trim(),
        "date": date.value.text.trim(),
        "programName": programName.value.text.trim(),
        "programOwnerName": programOwnerName.value.text.trim(),
        "inBehalfOf": inBehalfOf.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Get Token
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

      // ✅ Attach uploaded files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('🎭 Sending Cultural Programme Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ Call Repository API
      final res = await _api.createCulturalRecommendationLetterApi(
        data,
        headers: headers,
        files: files,
      );

      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Cultural Programme Submitted Successfully 🎉',
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
      dev.log('❌ culturalProgrammeApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🧹 Dispose all controllers
  @override
  void onClose() {
    for (var c in [
      applicantName,
      applicantMobile,
      address,
      hostDetail,
      date,
      programName,
      programOwnerName,
      inBehalfOf,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
