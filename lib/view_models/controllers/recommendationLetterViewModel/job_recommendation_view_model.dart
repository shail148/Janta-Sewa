

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobRecommendationViewModel extends GetxController{ 

  //store the variable
  final jobRecommendationType = TextEditingController().obs;
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final postName = TextEditingController().obs;
  final department = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  RxBool isLoading = false.obs;
  


}