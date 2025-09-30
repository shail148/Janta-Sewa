import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/app_url/app_url.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();
  //login api
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.loginApi, data);
    return response;
  }

  //register api
  Future<dynamic> registerApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.registerApi, data);
    return response;
  }

  //forgot password api
  Future<dynamic> forgotPasswordApi(var data) async {
    dynamic response = await _apiService.postApi(
      AppUrl.forgotPasswordApi,
      data,
    );
    return response;
  }

  //verify forgot password api
  Future<dynamic> verifyForgotPasswordApi(var data) async {
    dynamic response = await _apiService.postApi(
      AppUrl.verifyForgotOtpApi,
      data,
    );
    return response;
  }

  //reset password api
  Future<dynamic> resetPasswordApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.resetPasswordApi, data);
    return response;
  }
}
