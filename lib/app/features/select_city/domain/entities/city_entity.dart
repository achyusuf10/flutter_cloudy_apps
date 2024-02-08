import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';

class CityEntity {
  final LocationResultEntity locationData;
  final ForecastWeatherEntity forecastData;

  CityEntity({
    required this.locationData,
    required this.forecastData,
  });

  Map<String, dynamic> toJson() {
    return {
      'locationData': locationData.toJson(),
      'forecastData': forecastData.toJson(),
    };
  }

  factory CityEntity.fromJson(Map<String, dynamic> map) {
    return CityEntity(
      locationData: LocationResultEntity.fromJson(map['locationData']),
      forecastData: ForecastWeatherEntity.fromJson(map['forecastData']),
    );
  }
}
