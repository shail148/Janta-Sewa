import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class SuggestionRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> createSuggestionForPeopleApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createInvitationApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
       print('Api URL : ${AppUrl.createInvitationApi}');
      print('Suggestion For People API Response: $response');
    }
    return response;
  }
  Future<dynamic> createSuggestionForGovSchemeApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createInvitationApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
       print('Api URL : ${AppUrl.createInvitationApi}');
      print('Suggestion For Gov Scheme API Response: $response');
    }
    return response;
  }
 Future<dynamic> createSuggestionForGovDepartmentApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createInvitationApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
       print('Api URL : ${AppUrl.createInvitationApi}');
      print('Suggestion For Gov Department API Response: $response');
    }
    return response;
  }

  Future<dynamic> createSuggestionForMpOfficeApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createInvitationApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
       print('Api URL : ${AppUrl.createInvitationApi}');
      print('Suggestion For Mp Office API Response: $response');
    }
    return response;
  }
}
