import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/repository/auth_repository/auth_repository.dart';
import 'package:janta_sewa/utils/utils.dart';
import 'package:janta_sewa/views/bottom_NavPages/bottom_nav.dart';

class RegisterViewModel extends GetxController {
  final _api = AuthRepository();
  // Controllers
  final fullNameController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final whatsappController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final bloodGroupController = TextEditingController().obs;
  final aadharController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final districtController = TextEditingController().obs;
  final blockController = TextEditingController().obs;
  final vidhansabhaController = TextEditingController().obs;
  final cityVillageController = TextEditingController().obs;
  final wardNumberController = TextEditingController().obs;
  final pincodeController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // For organizations
  final selectedType = "".obs;
  RxBool isOrgnization = false.obs;
  RxBool isLoading = false.obs;

  /// Build registration payload dynamically
  Map<String, dynamic> _buildRegisterData() {
    if (isOrgnization.value) {
      return {
        "fullName": fullNameController.value.text.trim(),
        "mobileNumber": mobileController.value.text.trim(),
        "whatsappNumber": whatsappController.value.text.trim(),
        "email": emailController.value.text.trim(),
        "dob": dobController.value.text.trim(),
        // date of establish
        "addharNumber": "",
        "address": addressController.value.text.trim(),
        "state": stateController.value.text.trim(),
        "district": districtController.value.text.trim(),
        "block": blockController.value.text.trim(),
        "vidhansabha": vidhansabhaController.value.text.trim(),
        "city": cityVillageController.value.text.trim(),
        "wardNumber": wardNumberController.value.text.trim(),
        "pincode": pincodeController.value.text.trim(),
        "password": passwordController.value.text.trim(),
        "orgnizationType": selectedType.value.trim(),
        "isOrgnization": true,
      };
    } else {
      final data = {
        "fullName": fullNameController.value.text.trim(),
        "mobileNumber": mobileController.value.text.trim(),
        "whatsappNumber": whatsappController.value.text.trim(),
        "email": emailController.value.text.trim(),
        "dob": dobController.value.text.trim(),
        "aadharNumber": aadharController.value.text.trim(),
        "address": addressController.value.text.trim(),
        "state": stateController.value.text.trim(),
        "district": districtController.value.text.trim(),
        "block": blockController.value.text.trim(),
        "vidhansabha": vidhansabhaController.value.text.trim(),
        "city": cityVillageController.value.text.trim(),
        "wardNumber": wardNumberController.value.text.trim(),
        "pincode": pincodeController.value.text.trim(),
        "password": passwordController.value.text.trim(),
        "isOrgnization": false,
      };

      //  Add bloodGroup only if not empty
      if (bloodGroupController.value.text.trim().isNotEmpty) {
        data["bloodGroup"] = bloodGroupController.value.text.trim();
      }

      return data;
    }
  }

  // API call
  void registerApi() async {
    try {
      isLoading.value = true;
      final data = _buildRegisterData();

      final value = await _api.registerApi(data);
      isLoading.value = false;

      if (value['error'] != null) {
        if (kDebugMode) print(data);
        Utils.showErrorSnackBar(
          "Registration Failed",
          value['error'].toString(),
        );
      } else {
        Utils.showSuccessSnackBar("Registered", "Registered Successfully 🎉");
        Get.offAll(() => const BottomNav());
      }
    } catch (error) {
      isLoading.value = false;
      if (kDebugMode) print(error);
      Utils.showSnackBar("Error", error.toString());
    }
  }

  @override
  void onClose() {
    fullNameController.value.dispose();
    mobileController.value.dispose();
    whatsappController.value.dispose();
    emailController.value.dispose();
    dobController.value.dispose();
    aadharController.value.dispose();
    addressController.value.dispose();
    stateController.value.dispose();
    districtController.value.dispose();
    blockController.value.dispose();
    vidhansabhaController.value.dispose();
    cityVillageController.value.dispose();
    wardNumberController.value.dispose();
    pincodeController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}
