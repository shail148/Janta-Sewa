abstract class BaseApiServices {

  Future<dynamic>getApi(String url);


  Future<dynamic>postApi(String url,dynamic data);

  //put api
  Future<dynamic> putApi(String url, dynamic data);
  //delete api
  Future<dynamic> deleteApi(String url);

}