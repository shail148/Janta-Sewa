import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.loginApi, data);
    return response;
  }
}
