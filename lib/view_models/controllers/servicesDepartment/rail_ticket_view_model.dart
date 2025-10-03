import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/serviceDepartment/rail_ticket_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottom_NavPages/bottom_nav.dart';

class RailTicketViewModel extends GetxController {
  final _api = RailTicketRepository();

  //passenger controller
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

  //api call for save data
  void ticketConfirmationApi(var data) async {
    try {
      var value = await _api.ticketConfirmationApi(data);
      if (value['error'] != null) {
        Utils.showErrorSnackBar("Error", value['error'].toString());
      } else {
        Utils.showSuccessSnackBar("Saved", "Saved Successfully");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
