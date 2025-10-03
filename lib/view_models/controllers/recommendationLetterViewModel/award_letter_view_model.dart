import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AwardLetterViewModel extends GetxController {
  final typeOfAward = TextEditingController().obs;
  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final careerAchievement = TextEditingController().obs;
  final awardName = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  
  RxBool isLoading = false.obs;


}
