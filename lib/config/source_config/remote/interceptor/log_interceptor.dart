import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:dio/dio.dart';

class LogInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLogger.logData('Hit --> ${options.uri}');
    return super.onRequest(options, handler);
  }
}
