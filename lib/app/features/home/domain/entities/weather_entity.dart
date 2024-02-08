import 'package:cloudy/app/features/home/domain/entities/weather_by_hours_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  factory WeatherEntity.initalCurrent() => WeatherEntity(
        date: DateTime.now(),
        listItem: List.generate(
          4,
          (index) => WeatherByHoursEntity(
            time: TimeOfDay.now(),
            condition: '',
            temperature: 0.0,
            windPressure: 0.0,
            uvIndex: 0.0,
            humidity: 0.0,
            conditionCode: 0,
          ),
        ),
      );
  factory WeatherEntity.initalYesterday() => WeatherEntity(
        date: DateTime.now().subtract(const Duration(days: 1)),
        listItem: List.generate(
          4,
          (index) => WeatherByHoursEntity(
            time: TimeOfDay.fromDateTime(
                DateTime.now().subtract(const Duration(days: 1))),
            condition: '',
            temperature: 0.0,
            windPressure: 0.0,
            uvIndex: 0.0,
            humidity: 0.0,
            conditionCode: 0,
          ),
        ),
      );
  factory WeatherEntity.initalTomorrow() => WeatherEntity(
        date: DateTime.now().add(const Duration(days: 1)),
        listItem: List.generate(
          4,
          (index) => WeatherByHoursEntity(
            time: TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(days: 1))),
            condition: '',
            temperature: 0.0,
            windPressure: 0.0,
            uvIndex: 0.0,
            humidity: 0.0,
            conditionCode: 0,
          ),
        ),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.date == date &&
        listEquals(other.listItem, listItem);
  }

  @override
  int get hashCode => date.hashCode ^ listItem.hashCode;
}
