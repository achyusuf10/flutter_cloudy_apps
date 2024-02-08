import 'package:cloudy/app/features/home/domain/entities/weather_by_hours_entity.dart';

class WeatherEntity {
  final DateTime date;
  final List<WeatherByHoursEntity> listItem;

  WeatherEntity({
    required this.date,
    required this.listItem,
  });

  WeatherByHoursEntity get conditionByCurrentHours {
    return listItem.firstWhere(
      (element) => (DateTime.now().hour == element.time.hour),
    );
  }

  factory WeatherEntity.initial() => WeatherEntity(
        date: DateTime.now(),
        listItem: [],
      );

  WeatherEntity copyWith({
    DateTime? date,
    List<WeatherByHoursEntity>? listItem,
  }) {
    return WeatherEntity(
      date: date ?? this.date,
      listItem: listItem ?? this.listItem,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.millisecondsSinceEpoch,
      'listItem': listItem.map((x) => x.toJson()).toList(),
    };
  }

  factory WeatherEntity.fromJson(Map<String, dynamic> map) {
    return WeatherEntity(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      listItem: List<WeatherByHoursEntity>.from(
          map['listItem']?.map((x) => WeatherByHoursEntity.fromJson(x))),
    );
  }
}
