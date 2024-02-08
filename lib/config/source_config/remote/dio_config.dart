import 'package:cloudy/config/source_config/remote/interceptor/connectivity_interceptor.dart';
import 'package:cloudy/constants/common/app_const.dart';
import 'package:cloudy/constants/core/api_const.dart';
import 'package:dio/dio.dart';

class DioConfig {
  static Dio call() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.BASE_URL,
        connectTimeout: const Duration(seconds: 9),
        sendTimeout: const Duration(seconds: 9),
        receiveTimeout: const Duration(seconds: 9),
        contentType: "application/json",
        responseType: ResponseType.json,
        queryParameters: {
          'key': AppConst.keyApi,
        },
      ),
    );
    dio.interceptors.add(ConnectivityInterceptor());
    return dio;
  }
}
