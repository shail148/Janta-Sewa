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

    print('✅ Parliament Visit API Response: $response');
    return response;
  }
}
