import 'dart:developer' as dev;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/invitation/invitation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class InvitationViewModel extends GetxController {
  // Dependencies
  final _api = InvitationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  // Form controllers
  final typeOfInvitation =
      TextEditingController().obs; // (not used directly; we use selectedType)
  final programmeName = TextEditingController().obs;
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final village = TextEditingController().obs;
  final date = TextEditingController().obs;
  final location = TextEditingController().obs;
  final remarks = TextEditingController().obs;
  final contactPersonName = TextEditingController().obs;
  final contactPersonMobileNumber = TextEditingController().obs;
  final organizationName = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final meetingAgenda = TextEditingController().obs;
  final meetingTime = TextEditingController().obs;
  final message = TextEditingController().obs;

  // Dropdown (reactive)
  final RxList<String> invitationTypes = <String>[
    'meeting'.tr,
    'local_program'.tr,
  ].obs;

  RxString selectedType = ''.obs;
  void setType(String value) => selectedType.value = value;

  // Loading
  RxBool isLoading = false.obs;

  Future<void> submitInvitation() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      final isMeeting = selectedType.value == 'meeting'.tr;
      final isEvent = selectedType.value == 'local_program'.tr;
      String? isoDate;
      if (date.value.text.isNotEmpty) {
        try {
          final parsedDate = DateFormat(
            'dd/MM/yyyy',
          ).parse(date.value.text.trim());
          isoDate = parsedDate.toIso8601String(); // backend-safe format
        } catch (e) {
          Utils.showErrorSnackBar('Invalid Date', 'Use format DD/MM/YYYY');
          isLoading(false);
          return;
        }
      }
      // Build body
      final Map<String, dynamic> data = {
        "typeOfInvitation": selectedType
            .value, // UI label; change to enum if backend expects enum
        "district": district.value.text.trim(),
        "block": block.value.text.trim(),
        "village_ward": village.value.text.trim(),
        "constituency": constituency.value.text.trim(),
        "date": isoDate ?? '', // send ISO if backend expects Date type
        "time": meetingTime.value.text.trim(), // optional for meeting
        "location": location.value.text.trim(),
        "remarks": remarks.value.text.trim(),
        "contactPersonName": contactPersonName.value.text.trim(),
        "contactPersonMobileNumber": contactPersonMobileNumber.value.text
            .trim(),
        "message": message.value.text.trim(),
        // Conditional fields
        if (isMeeting) "meetingAgenda": meetingAgenda.value.text.trim(),
        if (isMeeting) "organizationName": organizationName.value.text.trim(),
        if (isEvent) "programmeName": programmeName.value.text.trim(),
      };

      // Token
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

      // Files
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);

      if (kDebugMode) {
        dev.log('📨 Invitation Data: $data');
        dev.log('📎 Files: ${files.map((f) => f.name).toList()}');
      }

      // API call
      final res = await _api.createInvitationApi(
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
      dev.log('❌ submitInvitation Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    for (var c in [
      programmeName,
      district,
      block,
      village,
      date,
      location,
      remarks,
      contactPersonName,
      contactPersonMobileNumber,
      organizationName,
      constituency,
      meetingAgenda,
      meetingTime,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
