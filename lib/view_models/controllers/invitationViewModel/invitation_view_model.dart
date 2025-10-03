

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationViewModel extends GetxController{


  final typeOfInvitation = TextEditingController().obs;
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
  final image = TextEditingController().obs;
  RxBool isLoading = false.obs;


}