import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';



class RailTicketRepository {

  final _apiService = NetworkApiServices();



  Future<dynamic> ticketConfirmationApi(var data) async {
    dynamic response = await _apiService.postApi(AppUrl.ticketConfirmationApi, data);
    return response;
  }



}