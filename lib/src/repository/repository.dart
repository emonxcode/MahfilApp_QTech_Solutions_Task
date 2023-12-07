import 'package:dio/dio.dart';

import '../services/network/base_api_service.dart';
import '../services/network/network_api_service.dart';
import '../services/urls.dart';

class ServiceRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> getTrendingVideos() async {
    try {
      Response response =
          await _apiServices.getApi(Urls.getTrendingVideosUrl);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
