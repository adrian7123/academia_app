import 'dart:developer';

import 'package:academia_app/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
export 'package:dio/dio.dart' show FormData, MultipartFile;

class Api extends DioMixin {
  void setHeader(String key, String value) {
    options.headers[key] = value;
  }

  Api() {
    httpClientAdapter = HttpClientAdapter();

    options = BaseOptions(
      baseUrl: Constants.apiUrl,
      connectTimeout: const Duration(milliseconds: 20 * 1000),
      receiveTimeout: const Duration(milliseconds: 20 * 1000),
      receiveDataWhenStatusError: true,
    );

    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //modify your request
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (e, handler) async {
      Logger().e({
        'api error: ${e.requestOptions.path}',
        'status: ${e.response?.statusCode}'
      });
      inspect(e);

      handler.next(ApiException(e));

      // if (e.response?.data?['detail'] == 'Could not validate credentials') {
      //   UserService().logout();
      // }
    }));
  }
}

class ApiException extends DioException {
  ApiException(DioException dioException)
      : super(
          requestOptions: dioException.requestOptions,
          error: dioException.error,
          response: dioException.response,
          type: dioException.type,
          message: dioException.message,
          stackTrace: dioException.stackTrace,
        );
}
