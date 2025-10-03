

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherRecommendationViewModel extends GetxController{

  //store the variable
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final recommendationNeeded = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
   RxBool isLoading = false.obs;
}