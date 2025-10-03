

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CulturalProgrammeViewModel extends GetxController{

  // store the variable
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final hostDetail = TextEditingController().obs;
  final date = TextEditingController().obs;
  final programName = TextEditingController().obs;
  final programOwnerName = TextEditingController().obs;
  final inBehalfOf = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  RxBool isLoading = false.obs;

  
}