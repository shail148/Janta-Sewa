

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinancialRecommendationViewModel extends GetxController{

  //store the variablef=
  final department = TextEditingController().obs;
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final reasonOfProblem = TextEditingController().obs;
  final tentativeAmount = TextEditingController().obs;
  final message = TextEditingController().obs;
  final remarks = TextEditingController().obs;
  final image = TextEditingController().obs;

   RxBool isLoading = false.obs;
}