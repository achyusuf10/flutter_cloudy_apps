import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddCityToLocalUC extends UseCase<String, AddCityToLocalParams> {
  final WeatherRepository _weatherRepository;

  AddCityToLocalUC(this._weatherRepository);
  @override

  /// Adds a city to the local storage.
  ///
  /// Returns a [Future] that completes with a [DataState] containing a [String].
  /// The [DataState] can be either a success or an error.
  ///
  /// The [params] parameter is an instance of [AddCityToLocalParams] which contains
  /// the necessary information to add the city.
  ///
  /// If [params.replace] is `true`, the existing city with the same location data
  /// as [params.city] will be replaced with the new city. Otherwise, if the city
  /// already exists, a success [DataState] with the message 'Data already exists'
  /// will be returned. If the city does not exist, it will be added to the local storage.
  ///
  /// The [WeatherRepository] is used to interact with the local storage and perform
  /// the necessary operations.
  ///
  /// If an error occurs during the process, a [DataState] with the error message,
  /// status code, exception, and stack trace will be returned.
  Future<DataState<String>> call(AddCityToLocalParams params) async {
    var result = await _weatherRepository.getListCityByLocationFromLocal();

    return result.when(
      success: (listData) async {
        if (params.replace) {
          List<CityEntity> newList = List.from(listData);
          newList.removeWhere(
            (element) =>
                element.locationData.isSameCity(params.city.locationData),
          );
          newList.add(
            params.city,
          );
          return await _weatherRepository.saveWeatherByLocationToLocal(
            listCity: newList,
          );
        }
        int indexData = listData.indexWhere(
          (element) =>
              element.locationData.isSameCity(params.city.locationData),
        );
        if (indexData == -1) {
          return await _weatherRepository.addWeatherByLocationToLocal(
            cityEntity: params.city,
          );
        }
        return const DataState.success(
          data: 'Data already exists',
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

class AddCityToLocalParams {
  final CityEntity city;
  final bool replace;
  AddCityToLocalParams({
    required this.city,
    this.replace = false,
  });
}
