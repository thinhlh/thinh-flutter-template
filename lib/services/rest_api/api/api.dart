import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tfc/config/app_config.dart';
import 'package:tfc/generated/locale_keys.g.dart';
import 'package:tfc/services/rest_api/api/api_error_type.dart';
import 'package:tfc/services/rest_api/interceptors/dio_logger_interceptor.dart';
import 'package:tfc/services/rest_api/interceptors/jwt_interceptor.dart';
import 'package:tfc/services/rest_api/models/base_response.dart';

mixin Api {
  Dio get _dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();

    final env = AppConfig.instance.env;

    dio
      ..options.baseUrl = env.baseUrl
      ..options.connectTimeout = env.connectionTimeout
      ..options.receiveTimeout = env.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
        ),
      )
      ..interceptors.add(JWTInterceptor());

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // You can verify the certificate here
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };

    return dio;
  }

  Future<BaseResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.get(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );
      return BaseResponse.fromMap(response.data);
    } on Exception catch (e) {
      return parseApiError<T>(e);
    }
  }

  BaseResponse<T> parseApiError<T>(Exception exception) {
    String message = tr(LocaleKeys.common_default_error);

    try {
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
            break;
          case DioErrorType.sendTimeout:
            break;
          case DioErrorType.receiveTimeout:
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            break;
          case DioErrorType.response:
            final payload = exception.response?.data;

            if (payload == null) {
              message = _handlingErrorOnStatusCode(exception) ?? message;
            } else {
              message = _handlingErrorOnStatusCode(exception) ??
                  (exception.response?.data?.message ?? message);
            }
        }
      } else {
        message = exception.toString();
      }
    } catch (e) {
      // Further handling if needed?
    }

    return BaseResponse.error(message);
  }

  String? _handlingErrorOnStatusCode(DioError exception) {
    String? message;
    if (exception.response?.statusCode == 401) {
      message = ApiErrorCode.unauthorized.name;
    } else {
      //
    }

    return message;
  }
}
