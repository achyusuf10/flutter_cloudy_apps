import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentCityWeatherUC
    extends UseCase<CityEntity, GetCurrentCityWeatherParams> {
  final WeatherRepository _weatherRepository;

  GetCurrentCityWeatherUC(this._weatherRepository);

  @override

  /// Calls the [getListCityByLocationFromLocal] method of the weather repository to get a list of cities by location from the local storage.
  ///
  /// Returns a [DataState] object containing the [CityEntity] corresponding to the provided location.
  /// If the city is not found in the list, returns a [DataState] object with an error message ['not-found'] and code [404].
  ///
  /// Parameters:
  /// - params: The location parameters used to search for the city.
  ///
  /// Throws an exception if an error occurs while retrieving the data from the repository.
  Future<DataState<CityEntity>> call(params) async {
    var result = await _weatherRepository.getListCityByLocationFromLocal();

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
}
