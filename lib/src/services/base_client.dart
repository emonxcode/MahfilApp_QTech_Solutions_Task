import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mahfil_app/src/services/urls.dart';


class BaseClient {
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
      },
    );

    return options;
  }

  static Future<dynamic> get({required String url, var payload}) async {
    Dio dio = Dio(await getBaseOptions());
    var response = await dio.get(url, queryParameters: payload);
    return response;
  }

  static Future<dynamic> post(url, payload) async {
    Dio dio = Dio(await getBaseOptions());
    var response = await dio.post(url, data: payload);
    return response;
  }

  static Future<dynamic> put(url, payload) async {
    Dio dio = Dio(await getBaseOptions());
    var response = await dio.put(url, data: payload);
    return response;
  }

  static Future<dynamic> delete(url) async {
    Dio dio = Dio(await getBaseOptions());
    var response = await dio.delete(url);
    return response;
  }
}
