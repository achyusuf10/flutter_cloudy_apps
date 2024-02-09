import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentCityWeatherUC
    extends UseCase<AreaEntity, GetCurrentCityWeatherParams> {
  final WeatherRepository _weatherRepository;

  GetCurrentCityWeatherUC(this._weatherRepository);

  @override

  /// Calls the [getListWeatherByAreaFromLocal] method of the weather repository to get a list of weather data for areas.
  ///
  /// It then searches for the weather data that corresponds to the provided [params.location] and returns it as a [DataState<AreaEntity>].
  /// If the weather data is not found, it returns a [DataState.error] with a message of 'not-found' and a code of 404.
  /// If an error occurs during the process, it returns a [DataState.error] with the corresponding error message, status code, exception, and stack trace.
  Future<DataState<AreaEntity>> call(params) async {
    var result = await _weatherRepository.getListWeatherByAreaFromLocal();

    return result.when(
      success: (listData) {
        int indexData = listData.indexWhere(
          (element) => element.locationData.isSameCity(params.location),
        );
        if (indexData == -1) {
          return const DataState.error(
            message: 'not-found',
            code: 404,
          );
        }
        return DataState.success(
          data: listData[indexData],
        );
      },
      error: (message, _, statusCode, e, stackTrace) {
        return DataState.error(
          message: message,
          code: statusCode,
          exception: e,
          stackTrace: stackTrace,
        );
      },
    );
  }
}

class GetCurrentCityWeatherParams {
  final LocationResultEntity location;

  GetCurrentCityWeatherParams({required this.location});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetCurrentCityWeatherParams && other.location == location;
  }

  @override
  int get hashCode => location.hashCode;
}
