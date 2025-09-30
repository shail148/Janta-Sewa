

import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/app_url/app_url.dart';

class HospitalRepository {

  final _apiService = NetworkApiServices();


  //save the hospital admission data of the user by submitted 

  Future<dynamic> hospitalAdmissionApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.hospitalAdmissionApi, data);
    return response;
  }
}