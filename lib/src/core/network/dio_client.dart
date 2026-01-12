import 'package:dio/dio.dart';

class DioClient {
  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://story-api.dicoding.dev/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  final Dio _dio;

  Dio get dio => _dio;
}
