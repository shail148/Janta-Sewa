import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class QuarterAllotmentViewModel extends GetxController {
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  //store the variable
 
  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final address = TextEditingController().obs;
  final optedQuarterAllotment = TextEditingController().obs;
  final fromWhomtoOpted = TextEditingController().obs;
  final optedQuarterAddress = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  final List<String> typesOfAllotment = ['new'.tr, 'revised'.tr];
  final List<String> typeOfOptedQuarterAllotment = [
    "BSP",
    "State Government",
    "Central Government",
    "Private",
  ];

  RxString selectedAllotment = ''.obs;
  RxString selectedOptedQuarterAllotment = ''.obs;
  RxBool isLoading = false.obs;

  void quarterAllotmentLetterApi() async {
    try {
      //data load krna
      Map<String, dynamic> data = {
        'typeOfAllotment': selectedAllotment.value.trim(),
        'fullName': fullName.value.text.trim(),
        'mobileNumber': mobile.value.text.trim(),
        'address': address.value.text.trim(),
        'optedQuarterDepartment': optedQuarterAllotment.value.text.trim(),
        'fromWhomToOpted': fromWhomtoOpted.value.text.trim(),
        'optedQuarterAddress': selectedOptedQuarterAllotment.value.trim(),
        'reasonForQuarterAllotment': reason.value.text.trim(),
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
        print('Files : $files');
      }

      //api call krna
      final res = await _api.createQuarterAllotmentLetterApi(
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
        print('Error while quarter allotment letter api: ${e.toString()}');
      }

      Utils.showErrorSnackBar("Error", e.toString());
    }
  }

  //dispose method
    @override
  void onClose() {
    super.dispose();
  }
  
  
}
