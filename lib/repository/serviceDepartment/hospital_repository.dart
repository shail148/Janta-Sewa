import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class HospitalRepository {
  final _apiService = NetworkApiServices();

  //save the hospital admission data of the user by submitted

  Future<dynamic> hospitalAdmissionApi(
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    final response = await _apiService.postApi(
      AppUrl.parliamentVisitApi,
      data,
      headers: headers,
    );
    return response;
  }
}
