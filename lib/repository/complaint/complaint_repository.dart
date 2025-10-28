import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class ComplaintRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> createGovernmentEmployeeComplaintApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createGovEmpComplaintApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createGovEmpComplaintApi}');
      print('Government Employee Complaint API Response: $response');
    }
    return response;
  }

  Future<dynamic> createPoliticianComplaintApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createPoliticianComplaintApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createPoliticianComplaintApi}');
      print('Politician Complaint API Response: $response');
    }
    return response;
  }

  Future<dynamic> createNationalStateComplaintApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createNationalStateComplaintApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createNationalStateComplaintApi}');
      print('National State Complaint API Response: $response');
    }
    return response;
  }

  Future<dynamic> createMpOfficeComplaintApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createMpOfficeComplaintApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createMpOfficeComplaintApi}');
      print('Mp Office Complaint API Response: $response');
    }
    return response;
  }
}
