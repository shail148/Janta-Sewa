import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    
    );
  }
  static showSnackBar(String title,String message){
      Get.snackbar('error',message,backgroundColor: Colors.red,icon: Icon(Icons.error_outline));

  }
  //error snackbar
  static showErrorSnackBar(String title,String message){
    Get.snackbar('error',message,backgroundColor: Colors.red,icon: Icon(Icons.error_outline));
  }
  //create success snackbar
  static showSuccessSnackBar(String title,String message){
    Get.snackbar('success',message,backgroundColor: Colors.green,icon: Icon(Icons.check_circle_outline));
  }
}