import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';
import 'package:file_picker/file_picker.dart';

class ParliamentVisitRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> parliamentVisitApi(
    dynamic data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    if (files != null && files.isNotEmpty) {
      // convert all values to strings for fields
      final fields = <String, String>{};
      if (data is Map) {
        data.forEach((k, v) {
          fields[k.toString()] = v?.toString() ?? '';
        });
      }
      final response = await _apiService.postMultipart(
        AppUrl.parliamentVisitApi,
        fields,
        files,
        headers: headers,
      );
      return response;
    } else {
      final response = await _apiService.postApi(
        AppUrl.parliamentVisitApi,
        data,
        headers: headers,
      );
      return response;
    }
  }
}
