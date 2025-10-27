import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/models/profile/user_profile_model.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';
import 'package:janta_sewa/utils/utils.dart';

class UserProfileViewModel extends GetxController {
  // Dependencies
  final _apiService = NetworkApiServices();
  final _secureStorage = const FlutterSecureStorage();

  // Reactive states
  final RxBool isLoading = false.obs;
  final RxBool isUpdating = false.obs;
  final Rxn<UserProfileModel> userProfile = Rxn<UserProfileModel>();
  final RxString errorMessage = ''.obs;
  final RxBool isEditing = false.obs;

  // Text controllers with .obs
  final Rx<TextEditingController> fullName = TextEditingController().obs;
  final Rx<TextEditingController> mobileNumber = TextEditingController().obs;
  final Rx<TextEditingController> whatsappNumber = TextEditingController().obs;
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> dob = TextEditingController().obs;
  final Rx<TextEditingController> aadharNumber = TextEditingController().obs;
  final Rx<TextEditingController> address = TextEditingController().obs;
  final Rx<TextEditingController> stateCtrl = TextEditingController().obs;
  final Rx<TextEditingController> district = TextEditingController().obs;
  final Rx<TextEditingController> block = TextEditingController().obs;
  final Rx<TextEditingController> vidhansabha = TextEditingController().obs;
  final Rx<TextEditingController> cityVillage = TextEditingController().obs;
  final Rx<TextEditingController> wardNumber = TextEditingController().obs;
  final Rx<TextEditingController> pincode = TextEditingController().obs;

  // Getters for easy access
  User? get user => userProfile.value?.user;
  bool get hasUser => user != null;
  bool get hasData => userProfile.value != null;

  // Fetch user profile
  Future<void> fetchUserProfile() async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      dev.log('🟢 [Fetch Profile] Started');

      // Get token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth Error', 'Please login first');
        isLoading.value = false;
        return;
      }

      dev.log('🟢 Using endpoint: ${AppUrl.userProfile}');

      // API call
      final response = await _apiService.getApi(
        AppUrl.userProfile,
        headers: {'Authorization': 'Bearer $token', 'Cookie': 'token=$token'},
      );

      dev.log('🟢 Fetch Profile API returned: $response');

      // Handle response - FIXED: Check if response contains user data directly
      if (response != null && response['user'] != null) {
        // Response contains user data directly
        userProfile.value = UserProfileModel.fromJson(response);
        _prefillFormData();
        errorMessage.value = '';
        dev.log('🟢 Profile data loaded successfully');
      } else if (response != null && response['success'] == true) {
        // Response has success flag with user data
        userProfile.value = UserProfileModel.fromJson(response);
        _prefillFormData();
        errorMessage.value = '';
        dev.log('🟢 Profile data loaded successfully');
      } else if (response != null && response['success'] == false) {
        final errorMsg = response['message'] ?? 'Failed to load profile';
        errorMessage.value = errorMsg;
        Utils.showErrorSnackBar('Profile Error', errorMsg);
      } else {
        errorMessage.value = 'No user data found in response';
        Utils.showErrorSnackBar('Error', 'No profile data available');
      }
    } catch (e, st) {
      dev.log('❌ fetchUserProfile Error: $e\n$st');
      errorMessage.value = 'Network error: ${e.toString()}';
      Utils.showErrorSnackBar('Network Error', 'Failed to connect to server');
    } finally {
      isLoading.value = false;
      dev.log('🟢 [Fetch Profile] Finished');
    }
  }

  // Update user profile - FIXED: Immediately refresh data
  Future<void> updateUserProfile() async {
    if (isUpdating.value) return;

    isUpdating.value = true;
    errorMessage.value = '';

    try {
      dev.log('🟢 [Update Profile] Started');

      // Validate required fields
      if (fullName.value.text.trim().isEmpty ||
          mobileNumber.value.text.trim().isEmpty ||
          email.value.text.trim().isEmpty) {
        Utils.showErrorSnackBar("Error", "Please fill all required fields");
        return;
      }

      // Get token
      final token = await _secureStorage.read(key: 'token');
      if (token == null || token.isEmpty) {
        Utils.showErrorSnackBar('Auth', 'Please login first');
        isUpdating.value = false;
        return;
      }

      final updatedData = {
        "fullName": fullName.value.text.trim(),
        "mobileNumber": mobileNumber.value.text.trim(),
        "whatsappNumber": whatsappNumber.value.text.trim(),
        "email": email.value.text.trim(),
        "dob": dob.value.text.trim(),
        "aadharNumber": aadharNumber.value.text.trim(),
        "address": address.value.text.trim(),
        "state": stateCtrl.value.text.trim(),
        "district": district.value.text.trim(),
        "block": block.value.text.trim(),
        "vidhansabha": vidhansabha.value.text.trim(),
        "city": cityVillage.value.text.trim(),
        "wardNumber": int.tryParse(wardNumber.value.text) ?? 0,
        "pincode": pincode.value.text.trim(),
      };

      dev.log('🟢 Sending update request with payload: $updatedData');

      final headers = {
        'Authorization': 'Bearer $token',
        'Cookie': 'token=$token',
      };

      // API call
      final response = await _apiService.postApi(
        AppUrl.updateProfile,
        updatedData,
        headers: headers,
      );

      dev.log('🟢 Update Profile API returned: $response');

      // Handle response - FIXED: Immediately update UI with new data
      if (response != null && response['user'] != null) {
        // Update the userProfile with new data
        userProfile.value = UserProfileModel.fromJson(response);

        // Also update form controllers with fresh data
        _prefillFormData();

        Utils.showSuccessSnackBar("Success", "Profile updated successfully 🎉");
        isEditing.value = false;
        dev.log('🟢 Profile updated successfully - UI refreshed immediately');
      } else if (response != null && response['success'] == true) {
        // Update the userProfile with new data
        userProfile.value = UserProfileModel.fromJson(response);

        // Also update form controllers with fresh data
        _prefillFormData();

        Utils.showSuccessSnackBar("Success", "Profile updated successfully 🎉");
        isEditing.value = false;
        dev.log('🟢 Profile updated successfully - UI refreshed immediately');
        await fetchUserProfile();
      } else {
        final errorMsg = response?['message'] ?? 'Failed to update profile';
        Utils.showErrorSnackBar('Error', errorMsg);

        // Even if update fails, refresh data from server
        await fetchUserProfile();
      }
    } catch (e, st) {
      dev.log('❌ updateUserProfile Error: $e\n$st');
      errorMessage.value = e.toString();
      Utils.showErrorSnackBar(
        'Error',
        'Failed to update profile: ${e.toString()}',
      );

      // On error, still refresh data from server
      await fetchUserProfile();
    } finally {
      isUpdating.value = false;
      dev.log('🟢 [Update Profile] Finished');
    }
  }

  // Prefill form data with API data
  void _prefillFormData() {
    if (user != null) {
      fullName.value.text = user!.fullName ?? '';
      mobileNumber.value.text = user!.mobileNumber ?? '';
      whatsappNumber.value.text = user!.whatsappNumber ?? '';
      email.value.text = user!.email ?? '';
      dob.value.text = user!.dob?.toString().split('T')[0] ?? '';
      aadharNumber.value.text = user!.aadharNumber ?? '';
      address.value.text = user!.address ?? '';
      stateCtrl.value.text = user!.state ?? '';
      district.value.text = user!.district ?? '';
      block.value.text = user!.block ?? '';
      vidhansabha.value.text = user!.vidhansabha ?? '';
      cityVillage.value.text = user!.city ?? '';
      wardNumber.value.text = user!.wardNumber?.toString() ?? '';
      pincode.value.text = user!.pincode ?? '';

      dev.log('🟢 Form data prefilled: ${user!.fullName}');
    }
  }

  // Toggle edit mode
  void toggleEdit() {
    isEditing.value = !isEditing.value;
    if (!isEditing.value) {
      // Reset form data when canceling edit
      _prefillFormData();
      dev.log('🟢 Edit mode cancelled, form reset');
    } else {
      dev.log('🟢 Edit mode activated');
    }
  }

  // Clear profile data (call this when logging out)
  void clearProfileData() {
    userProfile.value = null;
    for (var controller in [
      fullName,
      mobileNumber,
      whatsappNumber,
      email,
      dob,
      aadharNumber,
      address,
      stateCtrl,
      district,
      block,
      vidhansabha,
      cityVillage,
      wardNumber,
      pincode,
    ]) {
      controller.value.clear();
    }
    isEditing.value = false;
    dev.log('🟢 Profile data cleared');
  }

  // Clear error
  void clearError() => errorMessage.value = '';

  @override
  void onInit() {
    super.onInit();
    dev.log('🟢 [Profile ViewModel] Initialized');
  }

  @override
  void onClose() {
    // Dispose all controllers
    for (var controller in [
      fullName,
      mobileNumber,
      whatsappNumber,
      email,
      dob,
      aadharNumber,
      address,
      stateCtrl,
      district,
      block,
      vidhansabha,
      cityVillage,
      wardNumber,
      pincode,
    ]) {
      controller.value.dispose();
    }
    dev.log('🟢 [Profile ViewModel] Disposed');
    super.onClose();
  }
}
