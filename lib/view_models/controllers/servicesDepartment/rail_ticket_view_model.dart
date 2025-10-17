import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/service_department_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';
import 'dart:developer' as dev;

class RailTicketViewModel extends GetxController {
  final _api = ServiceDepartmentRepository();
  final _secureStorage = const FlutterSecureStorage();
  RxBool isLoading = false.obs;

  // Passenger controllers
  final passengerName = TextEditingController().obs;
  final passengerAge = TextEditingController().obs;
  final passengerGender = TextEditingController().obs;
  final passengerMobileNumber = TextEditingController().obs;
  final nationality = TextEditingController().obs;
  final journeyDate = TextEditingController().obs;
  final from = TextEditingController().obs;
  final to = TextEditingController().obs;
  final pnrNumber = TextEditingController().obs;
  final trainNumber = TextEditingController().obs;
  final trainName = TextEditingController().obs;
  final birthType = TextEditingController().obs;
  final message = TextEditingController().obs;

  /// 🚀 API Call - Save Ticket Confirmation
  Future<void> ticketConfirmationApi() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // ✅ Prepare pure JSON data
      final Map<String, dynamic> data = {
        "passengerName": passengerName.value.text.trim(),
        "age": int.tryParse(passengerAge.value.text.trim()) ?? 0,
        "gender": passengerGender.value.text.trim(),
        "mobileNumber": passengerMobileNumber.value.text.trim(),
        "nationality": nationality.value.text.trim(),
        "journeyDate": journeyDate.value.text.trim(),
        "from": from.value.text.trim(),
        "to": to.value.text.trim(),
        "pnrNumber": pnrNumber.value.text.trim(),
        "trainNumber": trainNumber.value.text.trim(),
        "trainName": trainName.value.text.trim(),
        "className": birthType.value.text.trim(),
        "message": message.value.text.trim(),
      };

      // ✅ Get token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth', 'Please log in again, token missing');
        isLoading.value = false;
        return;
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      if (kDebugMode) {
        dev.log('🎫 Sending JSON Ticket Data: ${jsonEncode(data)}');
      }

      // ✅ Call repository
      final res = await _api.createRailTicketApi(data, headers: headers);

      // ✅ Handle response
      if (res['success'] == true) {
        Utils.showSuccessSnackBar(
          'Success',
          res['message'] ?? 'Ticket Submitted Successfully 🎉',
        );
        Get.offAll(() => const BottomNav());
      } else {
        Utils.showErrorSnackBar(
          'Error',
          res['message'] ?? 'Something went wrong',
        );
      }
    } catch (e, st) {
      dev.log('❌ ticketConfirmationApi Error: $e\n$st');
      Utils.showErrorSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    for (var c in [
      passengerName,
      passengerAge,
      passengerGender,
      passengerMobileNumber,
      nationality,
      journeyDate,
      from,
      to,
      pnrNumber,
      trainNumber,
      trainName,
      birthType,
      message,
    ]) {
      c.value.dispose();
    }
    super.onClose();
  }
}
