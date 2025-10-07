import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:janta_sewa/widgets/custom_snackbar.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rxn<File>(); 
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      CustomSnackbar.showError(title: 'Error', message:  "Failed to pick image: $e");
      Get.snackbar("Error", "Failed to pick image: $e");
      if (kDebugMode) {
        print('$e');
      }
    }
  }
  void clearImage() {
    selectedImage.value = null;
  }
}
