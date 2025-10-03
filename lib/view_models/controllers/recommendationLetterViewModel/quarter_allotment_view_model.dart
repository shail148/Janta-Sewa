import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuarterAllotmentViewModel extends GetxController {



  //store the variable
  final typeOfQuarterAllotment = TextEditingController().obs;
  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final optedQuarterAllotment = TextEditingController().obs;
  final fromWhomtoOpted = TextEditingController().obs;
  final optedQuarterAddress = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
  RxBool isLoading = false.obs;
  
}
