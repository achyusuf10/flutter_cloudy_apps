import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetForecastWeatherUC
    extends UseCase<ForecastWeatherEntity, GetForecastWeatherParams> {
  final WeatherRepository _weatherRepository;

  GetForecastWeatherUC(this._weatherRepository);

  @override

  /// Calls the weather repository to get the forecast weather and yesterday's weather based on the provided latitude and longitude.
  /// Returns a [DataState] object containing the [ForecastWeatherEntity] if the operation is successful, or an error [DataState] if there is a failure.
  ///
  /// The [params] parameter should contain the latitude and longitude values.
  ///
  /// Example usage:
  /// ```dart
  /// var params = GetForecastWeatherParams(latitude: 37.7749, longitude: -122.4194);
  /// var result = await GetForecastWeatherUC().call(params);
  /// if (result.isSuccess) {
  ///   var forecastWeather = result.data;
  ///   // Do something with the forecast weather data
  /// } else {
  ///   var error = result.error;
  ///   // Handle the error
  /// }
  /// ```
  Future<DataState<ForecastWeatherEntity>> call(params) async {
    var resForecast = await _weatherRepository.getListWeather(
      latitude: params.latitude,
      longitude: params.longitude,
    );
    var resYesterday = await _weatherRepository.getYesterdayWeather(
      latitude: params.latitude,
      longitude: params.longitude,
    );

    return resForecast.map(
      success: (resDataForecast) {
        return resYesterday.map(
          success: (resDataYesterday) {
            return DataState.success(
              data: ForecastWeatherEntity(
                datas: [resDataYesterday.data] + resDataForecast.data,
              ),
            );
          },
          error: (stateError) => DataState.error(
            message: stateError.message,
            code: stateError.code,
            stackTrace: stateError.stackTrace,
          ),
        );
      },
      error: (stateError) => DataState.error(
        message: stateError.message,
        code: stateError.code,
        stackTrace: stateError.stackTrace,
      ),
    );
  }
}

class GetForecastWeatherParams {
  final double latitude;
  final double longitude;

  GetForecastWeatherParams({
    required this.latitude,
    required this.longitude,
  });
}
