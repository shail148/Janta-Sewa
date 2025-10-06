

import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class ConstructionRepository {

  final _apiService = NetworkApiServices();

  //save the new work demand data of the user by submitted 
  Future<dynamic> newWorkDemandApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.newWorkDemandApi, data);
    return response;
  }
  
}