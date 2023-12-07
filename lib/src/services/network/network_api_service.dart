import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../urls.dart';
import 'base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  static Future<BaseOptions> getBaseOptions() async {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10000),
      receiveTimeout: const Duration(seconds: 5000),
      followRedirects: false,
      // validateStatus: (status) {
      //   return status! < 500;
      // },
      baseUrl: Urls.baseURL,
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        // 'Authorization': 'Bearer ${await LocalData.getToken()}',
      },
    );

    return options;
  }

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    Dio dio = Dio(await getBaseOptions());

    dynamic responseJson;
    try {
      Response response =
          await dio.get(url);
      responseJson = returnResponse(response);
    } catch (e) {}
    // on SocketException {
    //   throw InternetException('');
    // }on RequestTimeOut {
    //   throw RequestTimeOut('');
    //
    // }
    print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var payload, String url) async {
    if (kDebugMode) {
      print(url);
      print(payload);
    }
    Dio dio = Dio(await getBaseOptions());

    dynamic responseJson;
    try {
      final response = await dio
          .post(url, data: payload);
      responseJson = returnResponse(response);
    } catch (e) {}
    // on SocketException {
    //   throw InternetException('');
    // }on RequestTimeOut {
    //   throw RequestTimeOut('');
    //
    // }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {

      case 200:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson;
      case 401:

      default:
      // throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }
}
