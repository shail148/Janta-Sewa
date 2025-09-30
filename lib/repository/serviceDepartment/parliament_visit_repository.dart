import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/app_url/app_url.dart';


class ParliamentVisitRepository {

 final _apiService = NetworkApiServices();


 Future<dynamic> parliamentVisitApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.parliamentVisitApi, data);
    return response;
  }





}
