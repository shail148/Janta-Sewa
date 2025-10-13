import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/parliament_visit_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as developer;
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:file_picker/file_picker.dart';

import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class ParliamentVisitViewModel extends GetxController {
  final _api = ParliamentVisitRepository();
  final _secureStorage = const FlutterSecureStorage();

  // Define the reactive text controllers
  final headedPersonName = TextEditingController().obs;
  final headedPersonMobileNumber = TextEditingController().obs;
  final state = TextEditingController().obs;
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final cityVillage = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final date = TextEditingController().obs;
  final pincode = TextEditingController().obs;
  final totalNumberOfMembers = TextEditingController().obs;
  final dateOfVisit = TextEditingController().obs;
  final timeOfVisit = TextEditingController().obs;
  final parliamentName = TextEditingController().obs;
  final parliamentMobileNumber = TextEditingController().obs;
  final message = TextEditingController().obs;

  // Reactive loading state
  var isLoading = false.obs;

  // Helper to extract a readable message from various response shapes
  String _extractMessageFromResponse(dynamic resp) {
    try {
      if (resp == null) return 'Unknown server error';
      if (resp is String) return resp;
      if (resp is Map) {
        if (resp.containsKey('message')) return resp['message'].toString();
        if (resp.containsKey('error')) return resp['error'].toString();
        if (resp.containsKey('body')) return resp['body'].toString();
        // handle array of validation errors
        if (resp.containsKey('errors')) {
          final errors = resp['errors'];
          if (errors is String) return errors;
          if (errors is List && errors.isNotEmpty) return errors.join(', ');
          if (errors is Map) return errors.values.join(', ');
        }
        return resp.toString();
      }
      return resp.toString();
    } catch (_) {
      return 'Unexpected error';
    }
  }

  // Call parliament visit API and include stored token in Authorization header
  void parliamentVisitApi() async {
    isLoading.value = true;
    try {
      // Build data payload from controllers (trimmed)
      final Map<String, dynamic> data = {
        "headedName": headedPersonName.value.text.trim(),
        "headedMobileNumber": headedPersonMobileNumber.value.text.trim(),
        "state": state.value.text.trim(),
        "district": district.value.text.trim(),
        "block": block.value.text.trim(),
        "village_ward": cityVillage.value.text.trim(),
        "constituency": constituency.value.text.trim(),
        "visitDate": dateOfVisit.value.text.trim(),
        "visitTime": timeOfVisit.value.text.trim(),
        "totalMembers": totalNumberOfMembers.value.text.trim(),
        "parliamentName": parliamentName.value.text.trim(),
        "parliamentNumber": parliamentMobileNumber.value.text.trim(),
        "message": message.value.text.trim(),
        "fileId": "",
      };

      // Quick required-fields check (form validator already present, this is extra safety)
      final required = <String, String>{
        'headedName': data['headedName'],
        'headedMobileNumber': data['headedMobileNumber'],
        'state': data['state'],
        'district': data['district'],
        'block': data['block'],
        'village_ward': data['village_ward'],
        'constituency': data['constituency'],
        'visitDate': data['visitDate'],
        'visitTime': data['visitTime'],
        'totalMembers': data['totalMembers'],
        'parliamentName': data['parliamentName'],
        'parliamentNumber': data['parliamentNumber'],
        'message': data['message'],
      };
      final missing = required.entries
          .where((e) => (e.value ?? '').toString().isEmpty)
          .map((e) => e.key)
          .toList();
      if (missing.isNotEmpty) {
        Utils.showErrorSnackBar(
          'Validation',
          'Please provide: ${missing.join(', ')}',
        );
        return;
      }

      // Token & headers
      final String? token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar(
          'Auth',
          'Authentication token not found. Please log in again.',
        );
        return;
      }
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      // Get uploaded files safely (controller may not be registered)
      List<PlatformFile> files = <PlatformFile>[];
      if (Get.isRegistered<FileUploadController>()) {
        final fileController = Get.find<FileUploadController>();
        files = List<PlatformFile>.from(fileController.uploadedFiles);
      }

      // Call repository (handles multipart when files present)
      final response = await _api.parliamentVisitApi(
        data,
        headers: headers,
        files: files,
      );

      // Normalize and handle response
      if (response == null) {
        Utils.showErrorSnackBar('Server', 'Empty response from server');
        return;
      }

      if (response is Map) {
        final bool success =
            response['success'] == true ||
            (response['status'] == 200 || response['status'] == 201);
        if (!success) {
          final msg = _extractMessageFromResponse(response);
          Utils.showErrorSnackBar('Error', msg);
          return;
        }
      }

      // Success path
      Utils.showSuccessSnackBar(
        'Success',
        'Parliament visit request submitted successfully.',
      );
      developer.log('Parliament visit request successful: $response');

      // Clear uploaded files on success
      if (Get.isRegistered<FileUploadController>()) {
        final fileController = Get.find<FileUploadController>();
        fileController.uploadedFiles.clear();
      }

      Get.offAll(() => const BottomNav());
    } catch (e, st) {
      developer.log(
        'parliamentVisitApi exception: $e\n$st',
        name: 'ParliamentVisit',
      );
      Utils.showErrorSnackBar('Error', _extractMessageFromResponse(e));
    } finally {
      isLoading.value = false;
    }
  }

  // Dispose controllers when done
  @override
  void onClose() {
    headedPersonName.value.dispose();
    headedPersonMobileNumber.value.dispose();
    state.value.dispose();
    district.value.dispose();
    block.value.dispose();
    cityVillage.value.dispose();
    constituency.value.dispose();
    date.value.dispose();
    pincode.value.dispose();
    totalNumberOfMembers.value.dispose();
    dateOfVisit.value.dispose();
    timeOfVisit.value.dispose();
    parliamentName.value.dispose();
    parliamentMobileNumber.value.dispose();
    message.value.dispose();
    super.onClose();
  }
}
