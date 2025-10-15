import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class ServiceDepartmentRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> createParliamentVisitApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.parliamentVisitApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Parliament Visit API Response: $response');
    }
    return response;
  }

  Future<dynamic> createHospitalAdmissionApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });

    final response = await _apiService.postMultipart(
      AppUrl.createhospitalAdmissionApi,
      fields,
      files ?? [],
      headers: headers,
    );
    if (kDebugMode) {
      print('Api URL : ${AppUrl.createhospitalAdmissionApi}');
      print('Hospital Admission API Response: $response');
    }
    return response;
  }

  //create a createNewWorkDemandApi
  Future<dynamic> createConstructionWorkApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });

    final response = await _apiService.postMultipart(
      AppUrl.createRailTicketApi,
      fields,
      files ?? [],
      headers: headers,
    );
    if (kDebugMode) {
      print('Api URL : ${AppUrl.createhospitalAdmissionApi}');
      print('Construction Work API Response: $response');
    }
    return response;
  }

  Future<dynamic> createRailTicketApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });

    final response = await _apiService.postMultipart(
      AppUrl.createRailTicketApi,
      fields,
      files ?? [],
      headers: headers,
    );
    if (kDebugMode) {
      print('Api URL : ${AppUrl.createRailTicketApi}');
      print('Rail Ticket API Response: $response');
    }
    return response;
  }
}
