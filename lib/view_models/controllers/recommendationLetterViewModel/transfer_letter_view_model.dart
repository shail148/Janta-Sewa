import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/recommentdationLetterRepository/recommendation_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class TransferLetterViewModel extends GetxController {
  final _api = RecommendationRepository();
  final _secureStorage = const FlutterSecureStorage();
  final fileController = Get.put(FileUploadController());

  final fullName = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final designation = TextEditingController().obs;

  final postedOffice = TextEditingController().obs;
  final optedOffice = TextEditingController().obs;
  final reason = TextEditingController().obs;
  final message = TextEditingController().obs;
  final image = TextEditingController().obs;

  final List<String> typesOfTransfer = ['new'.tr, 'revised'.tr];
  final List<String> typeOfDepartment = [
    "BSP",
    "State Government",
    "Central Government",
    "Private",
  ];
  RxString selectedType = ''.obs;
  RxString selectedDepartment = ''.obs;
  RxBool isLoading = false.obs;
  void createTransferLetterApi() async {
    try {
      //data load krna
      Map<String, dynamic> data = {
        'typeOfTransfer': selectedType.value.trim(),
        'fullName': fullName.value.text.trim(),
        'mobileNumber': mobile.value.text.trim(),
        'designation': designation.value.text.trim(),
        'department': selectedDepartment.value.trim(),
        'postedOffice': postedOffice.value.text.trim(),
        'optedOffice': optedOffice.value.text.trim(),
        'reasonForTransfer': reason.value.text.trim(),
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
      final res = await _api.createTransferLetterApi(
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

  //dispose method
  @override
  void onClose() {
    typeOfDepartment.clear();
    super.onClose();
  }
}
