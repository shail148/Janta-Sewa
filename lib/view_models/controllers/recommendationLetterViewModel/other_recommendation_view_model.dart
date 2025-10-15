import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class OtherRecommendationViewModel extends GetxController {
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());
  //store the variable
  final applicantName = TextEditingController().obs;
  final applicantMobile = TextEditingController().obs;
  final recommendationNeeded = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;
  RxBool isLoading = false.obs;

  void createOtherRecommendationApi() async {
    try {
      //data load krna
      Map<String, dynamic> data = {
        'applicantName': applicantName.value.text.trim(),
        'applicantMobile': applicantMobile.value.text.trim(),
        'recommendationNeeded': recommendationNeeded.value.text.trim(),
        'message': message.value.text.trim(),
      };

      //token check krna
      String? token = await _secureStorage.read(key: 'token');
      if (token == null) {
        Utils.showErrorSnackBar('Error', 'Authentication token not found.');
        isLoading.value = false;
        return;
      }

      //headers me dalna
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };
      //files load krna
      final List<PlatformFile> files = List.from(fileController.uploadedFiles);
      if (kDebugMode) {
        //print api url
        print('Send Data : $data');
        print('FIles : $files');
      }

      //api call krna
      final res = await _api.createOtherRecommendationLetterApi(
        data,
        headers: headers,
        files: files,
      );

      //response check krna
      if (res['success'] == true) {
        Utils.showSuccessSnackBar('Success', res['message'] ?? 'Submitted!');
        fileController.uploadedFiles.clear();
        Get.offAll(() => const BottomNav());
      }
      //show success or error krna
      else {
        Utils.showErrorSnackBar(
          'Error',
          res['message'] ?? 'Something went wrong',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while transfer letter api: ${e.toString()}');
      }

      Utils.showErrorSnackBar("Error", e.toString());
    }
  }
}
