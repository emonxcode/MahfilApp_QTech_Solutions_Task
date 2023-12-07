import 'package:dio/dio.dart';
import '../urls.dart';
import 'base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  static Future<BaseOptions> getBaseOptions() async {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10000),
      receiveTimeout: const Duration(seconds: 5000),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 550;
      },
      baseUrl: Urls.baseURL,
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      },
    );

    return options;
  }

  @override
  Future<dynamic> getApi(String url) async {
    Dio dio = Dio(await getBaseOptions());
    Response responseJson;
    try {
      Response response = await dio.get(url);

      //responseJson = returnResponse(response);
      responseJson = response;
    } catch (e) {
      rethrow;
    }
    // print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(payload, url) async {
    Dio dio = Dio(await getBaseOptions());

    Response responseJson;
    try {
      final response = await dio.post(url, data: payload);

      //responseJson = returnResponse(response);
      responseJson = response;
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;
      case 401:
        dynamic responseJson = response.data;
        return responseJson;
      case 500:
        dynamic responseJson = response.data;
        return responseJson;
      case 422:
        dynamic responseJson = response.data;
        return responseJson;
      case 404:
        return {"message": "404 Not Found!"};
      default:
      // throw FetchDataException('Error ccoured while communicating with server '+response.statusCode.toString()) ;
    }
  }
}
