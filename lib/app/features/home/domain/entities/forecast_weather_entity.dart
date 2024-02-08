import 'package:cloudy/constants/core/image_assets_const.dart';

class ForecastWeatherEntity {
  final DateTime date;
  final List<WeatherItemByHoursEntity> listItem;

  ForecastWeatherEntity({
    required this.date,
    required this.listItem,
  });

  WeatherItemByHoursEntity get conditionByCurrentHours {
    return listItem.firstWhere(
      (element) => (DateTime.now().hour == element.time.hour),
      orElse: () => WeatherItemByHoursEntity(
        time: DateTime.now(),
        condition: 'cloudy',
        temperature: 10,
        windPressure: 20,
        uvIndex: 30,
        humidity: 30,
      ),
    );
  }

  factory ForecastWeatherEntity.initial() => ForecastWeatherEntity(
        date: DateTime.now(),
        listItem: [],
      );
}

class WeatherItemByHoursEntity {
  final DateTime time;
  final String condition;
  final double temperature;
  final double windPressure;
  final double uvIndex;
  final double humidity;

  WeatherItemByHoursEntity({
    required this.time,
    required this.condition,
    required this.temperature,
    required this.windPressure,
    required this.uvIndex,
    required this.humidity,
  });

  String get imagePath => switch (condition) {
        _ => ImageAssetsConst.icCloudy,
      };
}
