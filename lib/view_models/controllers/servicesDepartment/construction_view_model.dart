import 'dart:developer' as dev;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/repository/serviceDepartment/service_department_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_page.dart';

class ConstructionViewModel extends GetxController {
  final _api = ServiceDepartmentRepository();
  final _secureStorage = const FlutterSecureStorage();
  //new work demand controller
  final workName = TextEditingController().obs;
  final workDetails = TextEditingController().obs;
  final tentativeAmount = TextEditingController().obs;
  final remark = TextEditingController().obs;
  final demandedPerson = TextEditingController().obs;
  final demandedPersonMobileNumber = TextEditingController().obs;
  //location details
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final village = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final message = TextEditingController().obs;
  final isLoading = false.obs;
  final fileController = Get.put(FileUploadController());
  Future<void> createNewWorkDemandApi() async {
  if (isLoading.value) return;
  isLoading.value = true;

  try {
    // ✅ Collect data from form controllers
    final Map<String, dynamic> data = {
      "workName": workName.value.text.trim(),
      "workDetails": workDetails.value.text.trim(),
      "tentativeAmount": tentativeAmount.value.text.trim(),
      "remark": remark.value.text.trim(),
      "demandedPerson": demandedPerson.value.text.trim(),
      "demandedPersonMobileNumber": demandedPersonMobileNumber.value.text.trim(),
      "district": district.value.text.trim(),
      "block": block.value.text.trim(),
      "village_ward": village.value.text.trim(),
      "constituency": constituency.value.text.trim(),
      "message": message.value.text.trim(),
    };

    // ✅ Read token from secure storage
    final token = await _secureStorage.read(key: 'token');
    if (token == null || token.isEmpty) {
      Utils.showErrorSnackBar('Auth', 'Please log in again, token missing');
      isLoading.value = false;
      return;
    }

    // ✅ Prepare headers
    final headers = {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
    };

    // ✅ Pick uploaded files
    final List<PlatformFile> files = List.from(fileController.uploadedFiles);
    if (kDebugMode) {
      dev.log('📦 Sending New Work Demand Data: $data');
      dev.log('📁 Attached Files: ${files.map((f) => f.name).toList()}');
    }

    // ✅ API call via Repository
    final res = await _api.createConstructionWorkApi(
      data,
      headers: headers,
      files: files,
    );

    // ✅ Handle response
    if (res['success'] == true) {
      Utils.showSuccessSnackBar('Success', res['message'] ?? 'Work Demand Submitted Successfully!');
      fileController.uploadedFiles.clear();
      Get.offAll(() => const BottomNav());
    } else {
      Utils.showErrorSnackBar('Error', res['message'] ?? 'Something went wrong');
    }
  } catch (e, st) {
    dev.log('❌ createNewWorkDemandApi Error: $e\n$st');
    Utils.showErrorSnackBar('Error', e.toString());
  } finally {
    isLoading.value = false; // ✅ Always reset loading
  }
}


  //pending work demand
  final pendingWorkName = TextEditingController().obs;
  final pendingWorkDetails = TextEditingController().obs;
  final actualAmount = TextEditingController().obs;
  //beneficiary oriented
  final beneficiaryName = TextEditingController().obs;
  final amount = TextEditingController().obs;
  final remarks = TextEditingController().obs;
  final demandedPersonName = TextEditingController().obs;
  final demandedPersonMobile = TextEditingController().obs;
  //location details :
  //beneficiary oriented api
  void beneficiaryOrientedApi(var data) async {
    // try{
    //     var value = await _api.beneficiaryOrientedApi(data);
    //     if(value['error'] != null){
    //       Utils.showErrorSnackBar("Error", value['error'].toString());
    //     }else{
    //       Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
    //       Get.offAll(()=>const BottomNav());
    //     }
    // }catch(e){
    //       Utils.showErrorSnackBar("Error", e.toString());
    // }
  }
}
