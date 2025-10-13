abstract class BaseApiServices {
  Future<dynamic> getApi(String url, {Map<String, String>? headers});

  Future<dynamic> postApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  });

  //put api
  Future<dynamic> putApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  });
  //delete api
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers});
}
