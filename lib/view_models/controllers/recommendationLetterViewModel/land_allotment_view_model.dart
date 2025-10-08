import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandAllotmentViewModel extends GetxController {
  //store the variable
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final optedLandDepartment = TextEditingController().obs;
  final optedLandAddress = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
  RxBool isLoading = false.obs;
}
