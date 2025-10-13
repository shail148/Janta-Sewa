import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';
import 'package:file_picker/file_picker.dart';

class ParliamentVisitRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> parliamentVisitApi(
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

      print('✅ Parliament Visit API Response: $response');
      return response;
    } catch (e) {
      print('❌ Error in parliamentVisitApi: $e');
      rethrow; // let the caller handle it
    }
  }
}
