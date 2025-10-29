import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class BudgetRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> createBudgetApi(
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
      print('Budget API Response: $response');
    }
    return response;
  }
}
