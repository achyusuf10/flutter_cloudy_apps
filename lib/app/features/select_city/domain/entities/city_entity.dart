import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';

class CityEntity {
  final double latitude;
  final double longitude;
  final String name;
  final String regionName;
  final String countryName;
  final List<ForecastWeatherEntity> forecastData;

  ForecastWeatherEntity get currentForecast {
    var result = forecastData.firstWhere(
      (element) => element.date.day == DateTime.now().day,
      orElse: () => ForecastWeatherEntity.initial(),
    );
    return result;
  }

  CityEntity({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.regionName,
    required this.countryName,
    required this.forecastData,
  });

  factory CityEntity.initial() => CityEntity(
        latitude: -123123,
        longitude: -23453,
        name: 'Jombang',
        regionName: 'East Java',
        countryName: 'Indonesia',
        forecastData: [
          ForecastWeatherEntity.initial(),
          ForecastWeatherEntity.initial(),
          ForecastWeatherEntity.initial(),
        ],
      );
}
