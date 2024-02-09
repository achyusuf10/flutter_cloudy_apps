import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddAreaToLocalUC extends UseCase<String, AddAreaToLocalParams> {
  final WeatherRepository _weatherRepository;

  AddAreaToLocalUC(this._weatherRepository);
  @override

  /// Adds an area to the local storage.
  ///
  /// This method is used to add an area to the local storage. It takes [params] as a parameter,
  /// which contains the city information to be added. It returns a [Future] that resolves to a [DataState<String>].
  /// The [DataState] represents the result of the operation, which can be either a success or an error.
  ///
  /// If the operation is successful, the method checks if the area already exists in the local storage.
  /// If it doesn't exist, it adds the area using the [_weatherRepository.addWeatherByAreaToLocal] method.
  /// If it does exist, it updates the list of areas in the local storage by removing the existing area,
  /// inserting the new area at the beginning of the list, and saving the updated list using the
  /// [_weatherRepository.saveWeatherByAreaToLocal] method.
  ///
  /// If the operation fails, the method returns a [DataState.error] with the error message, status code,
  /// exception, and stack trace.
  ///
  /// Example usage:
  /// ```dart
  /// var params = AddAreaToLocalParams(city: city);
  /// var result = await addAreaToLocalUC.call(params);
  /// ```
  Future<DataState<String>> call(AddAreaToLocalParams params) async {
    var result = await _weatherRepository.getListWeatherByAreaFromLocal();

    return result.when(
      success: (listData) async {
        int indexData = listData.indexWhere(
          (element) =>
              element.locationData.isSameCity(params.city.locationData),
        );
        if (indexData == -1) {
          return await _weatherRepository.addWeatherByAreaToLocal(
            areaEntity: params.city,
          );
        }

        List<AreaEntity> newList = List.from(listData);
        newList.removeAt(indexData);
        newList.insert(
          0,
          params.city,
        );
        return await _weatherRepository.saveWeatherByAreaToLocal(
          listArea: newList,
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

class AddAreaToLocalParams {
  final AreaEntity city;
  AddAreaToLocalParams({
    required this.city,
  });
}
