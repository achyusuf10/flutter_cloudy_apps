import 'package:cloudy/app/features/home/data/models/res_forecast_weather.dart';
import 'package:cloudy/app/features/home/data/models/res_history_weather.dart';
import 'package:cloudy/constants/core/api_const.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/utils/extensions/date_time_ext.dart';
import 'package:cloudy/utils/functions/dio_exception_converter_func.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class WeatherRemoteDataSource {
  Future<DataState<ResForecastWeather>> getForecastWeather({
    required double latitude,
    required double longitude,
  });
  Future<DataState<ResHistoryWeather>> getHistoryWeather({
    required double latitude,
    required double longitude,
  });
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final Dio _dio;

  WeatherRemoteDataSourceImpl(this._dio);

  @override
  Future<DataState<ResForecastWeather>> getForecastWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var res = await _dio.get(
        ApiConst.getForecastWeather,
        queryParameters: {
          'q': '$latitude,$longitude',
          'days': 7,
          'alert': 'yes',
        },
      );
      return DataState.success(
        data: ResForecastWeather.fromJson(res.data),
      );
    } on DioException catch (e, stackTrace) {
      return DataState.error(
        code: e.response?.statusCode,
        message: DioExceptionConverterFunc.call(e),
        exception: e,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      return DataState.error(
        code: 400,
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<DataState<ResHistoryWeather>> getHistoryWeather(
      {required double latitude, required double longitude}) async {
    try {
      var res = await _dio.get(
        ApiConst.getForecastWeather,
        queryParameters: {
          'q': '$latitude,$longitude',
          'dt': DateTime.now()
              .subtract(const Duration(days: 1))
              .extToFormattedString(outputDateFormat: 'yyyy-MM-dd'),
        },
      );
      return DataState.success(
        data: ResHistoryWeather.fromJson(res.data),
      );
    } on DioException catch (e, stackTrace) {
      return DataState.error(
        code: e.response?.statusCode,
        message: DioExceptionConverterFunc.call(e),
        exception: e,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      return DataState.error(
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }
}
