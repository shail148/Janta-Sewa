import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();

  //login api - extract token from response body (if present) and persist it
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.loginApi, data);

    try {
      // response may contain token at various keys - try common locations
      String? token;
      if (response is Map) {
        token =
            response['token']?.toString() ??
            (response['data'] is Map
                ? response['data']['token']?.toString()
                : null) ??
            response['accessToken']?.toString() ??
            (response['data'] is Map
                ? response['data']['accessToken']?.toString()
                : null);
      }

      if (token != null && token.isNotEmpty) {
        await _apiService.saveToken(token);
      }
    } catch (e) {
      // ignore token extraction errors - network layer may have saved cookie token already
    }

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

  // Future<dynamic> updateProfileApi(var data) async {
  //   dynamic response = await _apiService.putApi(
  //     AppUrl.updateUserProfileApi,
  //     data,
  //   );
  //   return response;
  // }
}
