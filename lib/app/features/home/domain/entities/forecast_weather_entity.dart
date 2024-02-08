import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';

class ForecastWeatherEntity {
  final List<WeatherEntity> datas;

  ForecastWeatherEntity({
    required this.datas,
  });

  WeatherEntity? get currentWeather {
    try {
      return datas.firstWhere(
        (element) => element.date.day == DateTime.now().day,
      );
    } catch (e) {
      return null;
    }
  }

  WeatherEntity? get yesterdayWeather {
    try {
      return datas.firstWhere(
        (element) => element.date.day == DateTime.now().day - 1,
      );
    } catch (e) {
      return null;
    }
  }

  WeatherEntity? get tommorowWeather {
    try {
      return datas.firstWhere(
        (element) => element.date.day == DateTime.now().day + 1,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() => 'ForecastWeatherEntity(datas: $datas)';

  ForecastWeatherEntity copyWith({
    List<WeatherEntity>? datas,
  }) {
    return ForecastWeatherEntity(
      datas: datas ?? this.datas,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'datas': datas.map((x) => x.toJson()).toList(),
    };
  }

  factory ForecastWeatherEntity.fromJson(Map<String, dynamic> map) {
    return ForecastWeatherEntity(
      datas: List<WeatherEntity>.from(
          map['datas']?.map((x) => WeatherEntity.fromJson(x))),
    );
  }
}
