import 'package:dio/dio.dart';

Exception handleException(dynamic e) {
  if (e is DioException) {
    if (e.response != null) {
      final data = e.response?.data;
      final message = (data is Map && data['message'] != null)
          ? data['message']
          : e.message;
      return Exception(message);
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Exception('Connection Timeout');
    } else if (e.type == DioExceptionType.connectionError) {
      return Exception('SocketException: Failed host lookup');
    }
    return Exception(e.message ?? 'Something went wrong');
  }
  return Exception(e.toString());
}
