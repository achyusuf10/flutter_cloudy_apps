import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/no_params_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHistoryWeatherByAreaUC extends NoParamsUseCase<List<AreaEntity>> {
  final WeatherRepository _weatherRepository;

  GetHistoryWeatherByAreaUC(this._weatherRepository);
  @override

  /// Retrieves the history weather data for all areas.
  ///
  /// This method calls the [_weatherRepository.getListWeatherByAreaFromLocal()] method to get the list of weather data for all areas from the local storage.
  /// It returns a [Future] that resolves to a [DataState] containing a list of [AreaEntity] objects.
  Future<DataState<List<AreaEntity>>> call() async {
    var result = await _weatherRepository.getListWeatherByAreaFromLocal();
    return result;
  }
}
