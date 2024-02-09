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
  /// Returns a [DataState] object containing the forecast weather entity.
  ///
  /// The [params] parameter should contain the latitude and longitude.
  /// The [latitude] parameter represents the latitude of the location.
  /// The [longitude] parameter represents the longitude of the location.
  ///
  /// Throws an error if there is an issue retrieving the weather data.
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
