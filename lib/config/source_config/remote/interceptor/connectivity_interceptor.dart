import 'package:cloudy/core/state/data_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptor extends Interceptor {
  final Connectivity _connectivity = Connectivity();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: 'Tidak ada koneksi internet',
        response: Response(
          requestOptions: options,
          statusCode: 503,
        ),
        requestOptions: options,
      );
    }
    try {
      return super.onRequest(options, handler);
    } on DioException catch (e) {
      return DataState.error(
        exception: e,
        stackTrace: e.stackTrace,
        data: null,
        message: e.response?.statusMessage ?? '',
      );
    }
  }
}
