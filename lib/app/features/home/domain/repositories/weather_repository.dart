import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/core/state/data_state.dart';

abstract class WeatherRepository {
  /// Get forecast weather (yesterday not included)
  Future<DataState<List<WeatherEntity>>> getListWeather({
    required double latitude,
    required double longitude,
  });

  Future<DataState<WeatherEntity>> getYesterdayWeather({
    required double latitude,
    required double longitude,
  });

  /// Saves the weather data for a list of cities to the local storage.
  ///
  /// The [listCity] parameter is a required list of [CityEntity] objects representing the cities for which the weather data will be saved.
  ///
  /// Returns a [Future] that completes with a [DataState<String>] object representing the state of the operation.
  /// The [DataState] object contains a [String] value that represents the result of the operation.
  Future<DataState<String>> saveWeatherByLocationToLocal({
    required List<CityEntity> listCity,
  });

  /// Adds weather data for a specific location to the local storage.
  ///
  /// Returns a [Future] that completes with a [DataState] containing a [String].
  /// The [cityEntity] parameter is required and represents the city for which
  /// the weather data is being added.
  Future<DataState<String>> addWeatherByLocationToLocal({
    required CityEntity cityEntity,
  });

  /// Retrieves a list of city entities based on the current location from the local storage.
  ///
  /// Returns a [Future] that resolves to a [DataState] containing a list of [CityEntity].
  Future<DataState<List<CityEntity>>> getListCityByLocationFromLocal();
}
