import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetDemandViewModel extends GetxController {
  final requestFor = TextEditingController().obs;
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final levelOfGovernment = TextEditingController().obs;
  final departmentName = TextEditingController().obs;
  final nameOfOfficeWorkDemanded = TextEditingController().obs;
  final message = TextEditingController().obs;
  final uploadedFiles = <PlatformFile>[].obs;

  RxBool isLoading = false.obs;
}
