import 'package:cloudy/config/source_config/remote/interceptor/connectivity_interceptor.dart';
import 'package:dio/dio.dart';

class DioConfig {
  static Dio call({
    String? customBaseUrl,
  }) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: customBaseUrl ?? "https://api.themoviedb.org/3",
        connectTimeout: const Duration(seconds: 9),
        sendTimeout: const Duration(seconds: 9),
        receiveTimeout: const Duration(seconds: 9),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(ConnectivityInterceptor());
    return dio;
  }
}
