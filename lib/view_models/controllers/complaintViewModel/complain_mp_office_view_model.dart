import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplainMpOfficeViewModel extends GetxController {
  //store the variable
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final complainType = TextEditingController().obs;
  final briefDetails = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
  RxBool isLoading = false.obs;
}
