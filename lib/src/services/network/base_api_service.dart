abstract class BaseApiServices {

  Future<dynamic> getApi(String url);


  Future<dynamic> postApi(dynamic payload, String url);
}