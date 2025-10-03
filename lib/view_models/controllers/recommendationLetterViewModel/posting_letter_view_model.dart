

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostingLetterViewModel extends GetxController{

  //variable 

  final typeOfPosting = TextEditingController().obs;
  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final designation = TextEditingController().obs;
  final department = TextEditingController().obs;
  final postedOffice = TextEditingController().obs;
  final optedOffice = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
  
   RxBool isLoading = false.obs;
  //creating the controller 

  
}
