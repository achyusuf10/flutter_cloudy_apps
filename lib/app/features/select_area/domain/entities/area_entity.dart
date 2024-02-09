import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';

class AreaEntity {
  final LocationResultEntity locationData;
  final ForecastWeatherEntity forecastData;

  AreaEntity({
    required this.locationData,
    required this.forecastData,
  });

  Map<String, dynamic> toJson() {
    return {
      'locationData': locationData.toJson(),
      'forecastData': forecastData.toJson(),
    };
  }

  factory AreaEntity.fromJson(Map<String, dynamic> map) {
    return AreaEntity(
      locationData: LocationResultEntity.fromJson(map['locationData']),
      forecastData: ForecastWeatherEntity.fromJson(map['forecastData']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AreaEntity &&
        other.locationData == locationData &&
        other.forecastData == forecastData;
  }

  @override
  int get hashCode => locationData.hashCode ^ forecastData.hashCode;
}
