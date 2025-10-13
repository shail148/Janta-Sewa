import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class HospitalRepository {
  final _apiService = NetworkApiServices();

  //save the hospital admission data of the user by submitted

  Future<dynamic> hospitalAdmissionApi(
     Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    try {
      // Convert all form fields (data) to string
      final fields = <String, String>{};
      data.forEach((key, value) {
        fields[key] = value?.toString() ?? '';
      });

      // Always send multipart when files or form fields are present
      final response = await _apiService.postMultipart(
        AppUrl.parliamentVisitApi,
        fields,
        files ?? [], // empty list if no files
        headers: headers,
      );

      if (kDebugMode) {
        print('✅ Parliament Visit API Response: $response');
      }
      return response;
    } catch (e) {
      print('❌ Error in parliamentVisitApi: $e');
      rethrow; // let the caller handle it
    }
  }
}
