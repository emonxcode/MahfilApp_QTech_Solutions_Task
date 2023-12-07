
import 'package:dio/dio.dart';

import '../services/base_client.dart';
import '../services/urls.dart';

class AuthenticationRepository {
  // Error and Exception handle.
  static signIn({mobile, password}) async {

    try {
      Response response = await BaseClient.post(Urls.logIn, {
        'mobile': mobile,
        'password': password,
      });

      if (response.statusCode == 200) {
       
        return response;
      }
    } on DioException catch (e) {

      if (e.response != null) {
        int statusCode = e.response!.statusCode!;
        String errorMessage = '';
        // print(statusCode);
        switch (statusCode) {
          case 400:
            // print('Bad Request of Response');

            break;
          case 401:
            errorMessage = 'User not found';
            break;
          case 403:
            // print('Response Forbidden');
            break;
          case 404:
            errorMessage = 'Response Not Found';
            break;
          case 500:
            errorMessage =
                'Opps! Something went wrong on our end! Please try again later or send us a message.';
            break;
          case 503:
            // print('Service Unavailable');
            break;
          default:
            errorMessage = 'Unknown Error: $statusCode';
            break;
        }

        return errorMessage;
      }
    }
  }

  static reviewProfile({data}) async {
    try {
      Response response = await BaseClient.post(Urls.reviewProfile, data);

      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        int statusCode = e.response!.statusCode!;
        String errorMessage = '';
        // print(statusCode);
        switch (statusCode) {
          case 400:
            // print('Bad Request of Response');

            break;
          case 401:
            errorMessage = 'User not found';
            break;
          case 403:
            // print('Response Forbidden');
            break;
          case 404:
            errorMessage = 'Response Not Found';
            break;
          case 500:
            errorMessage =
                'Opps! Something went wrong on our end! Please try again later or send us a message.';
            break;
          case 503:
            // print('Service Unavailable');
            break;
          default:
            errorMessage = 'Unknown Error: $statusCode';
            break;
        }

        return errorMessage;
      }
    }
  }

  static signUp({data}) async {
    try {
      Response response = await BaseClient.post(Urls.signUp, data);

      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        int statusCode = e.response!.statusCode!;
        String errorMessage = '';
        // print(statusCode);
        switch (statusCode) {
          case 400:
            // print('Bad Request of Response');

            break;
          case 401:
            errorMessage = 'User not found';
            break;
          case 403:
            // print('Response Forbidden');
            break;
          case 404:
            errorMessage = 'Response Not Found';
            break;
          case 422:
            errorMessage = 'Mobile Number Already Used';
            break;
          case 500:
            errorMessage =
                'Opps! Something went wrong on our end! Please try again later or send us a message.';
            break;
          case 503:
            // print('Service Unavailable');
            break;
          default:
            errorMessage = 'Unknown Error: $statusCode';
            break;
        }

        // print(errorMessage);
        return errorMessage;
      }
    }
  }

}
