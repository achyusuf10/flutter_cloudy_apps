import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/no_params_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHistoryCityUC extends NoParamsUseCase<List<CityEntity>> {
  final WeatherRepository _weatherRepository;

  GetHistoryCityUC(this._weatherRepository);
  @override

  /// Retrieves a list of historical city entities.
  ///
  /// This method calls the [_weatherRepository.getListCityByLocationFromLocal()] method to retrieve the list of city entities.
  /// It returns a [Future] that resolves to a [DataState] containing the list of city entities.
  Future<DataState<List<CityEntity>>> call() async {
    var result = await _weatherRepository.getListCityByLocationFromLocal();
    return result;
  }
}
