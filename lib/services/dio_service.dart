import 'dart:developer';

import 'package:dio/dio.dart';

import '../config/api_constant.dart';

class DioService {
  DioService() {
    addInterceptor(LogInterceptor());
    addInterceptor(_AuthInterceptor());
  }

  final Dio dio = Dio(
    BaseOptions(
      contentType: 'application/json',
      baseUrl: baseUrl,
      
    ),
  );

  void addInterceptor(Interceptor interceptor) =>
      dio.interceptors.add(interceptor);
}

final dioService = DioService();

class _AuthInterceptor implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.putIfAbsent('Authorization', () => 'Bearer $apiKey');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: 'The user has been deleted or the session is expired',
        ),
      );
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('DATA ${response.data}');
    return handler.next(response);
  }
}
