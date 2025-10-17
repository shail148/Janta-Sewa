import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/serviceDepartment/service_department_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'dart:developer' as dev;

class ParliamentVisitViewModel extends GetxController {
  final _api = ServiceDepartmentRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // Form controllers
  final headedPersonName = TextEditingController().obs;
  final headedPersonMobileNumber = TextEditingController().obs;
  final state = TextEditingController().obs;
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final cityVillage = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final dateOfVisit = TextEditingController().obs;
  final timeOfVisit = TextEditingController().obs;
  final totalNumberOfMembers = TextEditingController().obs;
  final parliamentName = TextEditingController().obs;
  final parliamentMobileNumber = TextEditingController().obs;
  final pinCode = TextEditingController().obs;
  final message = TextEditingController().obs;

  RxBool isLoading = false.obs;

  Future<void> parliamentVisitApi() async {
    if (isLoading.value) return;
    isLoading(true);

    try {
      // ✅ Convert "DD/MM/YYYY" → ISO format
      String? isoDate;
      if (dateOfVisit.value.text.isNotEmpty) {
        try {
          final parsedDate = DateFormat(
            'dd/MM/yyyy',
          ).parse(dateOfVisit.value.text.trim());
          isoDate = parsedDate.toIso8601String(); // backend-safe format
        } catch (e) {
          Utils.showErrorSnackBar('Invalid Date', 'Use format DD/MM/YYYY');
          isLoading(false);
          return;
        }
      }

      // ✅ Build request data
      final Map<String, dynamic> data = {
        "headedName": headedPersonName.value.text.trim(),
        "headedMobileNumber": headedPersonMobileNumber.value.text.trim(),
        "state": state.value.text.trim(),
        "district": district.value.text.trim(),
        "block": block.value.text.trim(),
        "village_ward": cityVillage.value.text.trim(),
        "constituency": constituency.value.text.trim(),
        "visitDate": isoDate ?? '',
        "visitTime": timeOfVisit.value.text.trim(),
        "totalMembers": totalNumberOfMembers.value.text.trim(),
        "parliamentName": parliamentName.value.text.trim(),
        "parliamentNumber": parliamentMobileNumber.value.text.trim(),
        "pinCode": pinCode.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth', 'Login again, token missing');
        isLoading(false);
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      // ✅ Files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        print('📤 Parliament Visit Data: $data');
        print('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // ✅ API call
      final res = await _api.createParliamentVisitApi(
        data,
        headers: headers,
        files: files,
      );

      isLoading(false);

      // ✅ Handle response
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
      isLoading(false);
      dev.log('Parliament Visit error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    for (var c in [
      headedPersonName,
      headedPersonMobileNumber,
      state,
      district,
      block,
      cityVillage,
      constituency,
      dateOfVisit,
      timeOfVisit,
      totalNumberOfMembers,
      parliamentName,
      parliamentMobileNumber,
      pinCode,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
