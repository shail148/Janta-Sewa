

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactViewModel extends GetxController{

  final email = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final telephone = TextEditingController().obs;
  final website = TextEditingController().obs;

  final whatsapp = TextEditingController().obs;
  final instagram = TextEditingController().obs;
  final facebook = TextEditingController().obs;
  final twitter = TextEditingController().obs;
  final linkedin = TextEditingController().obs;

  RxBool isLoading = false.obs;


}