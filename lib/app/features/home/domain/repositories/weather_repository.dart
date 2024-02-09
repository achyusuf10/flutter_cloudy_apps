import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/core/state/data_state.dart';

abstract class WeatherRepository {
  /// Get forecast weather (yesterday not included)
  Future<DataState<List<WeatherEntity>>> getListWeather({
    required double latitude,
    required double longitude,
  });

  /// Retrieves the weather data for yesterday based on the given latitude and longitude.
  /// Returns a [Future] that resolves to a [DataState] containing the [WeatherEntity].
  /// The [latitude] parameter specifies the latitude of the location.
  /// The [longitude] parameter specifies the longitude of the location.
  Future<DataState<WeatherEntity>> getYesterdayWeather({
    required double latitude,
    required double longitude,
  });

  /// Saves the weather data for a list of areas to the local storage.
  ///
  /// Returns a [Future] that completes with a [DataState] containing a [String].
  /// The [DataState] represents the state of the operation, including any errors or success.
  /// The [listArea] parameter is a required list of [AreaEntity] objects representing the areas for which the weather data should be saved.

  Future<DataState<String>> saveWeatherByAreaToLocal({
    required List<AreaEntity> listArea,
  });

  /// Adds weather data for a specific area to the local storage.
  ///
  /// Returns a [Future] that completes with a [DataState] containing a [String].
  /// The [DataState] represents the state of the operation, while the [String]
  /// contains any relevant information or error message.
  ///
  /// The [areaEntity] parameter is required and represents the area for which
  /// the weather data will be added.
  Future<DataState<String>> addWeatherByAreaToLocal({
    required AreaEntity areaEntity,
  });

  /// Retrieves a list of weather data for multiple areas from the local storage.
  ///
  /// Returns a [Future] that resolves to a [DataState] containing a list of [AreaEntity].
  Future<DataState<List<AreaEntity>>> getListWeatherByAreaFromLocal();
}
