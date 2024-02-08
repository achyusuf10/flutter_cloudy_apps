import 'package:cloudy/constants/core/image_assets_const.dart';
import 'package:cloudy/utils/extensions/time_ext.dart';
import 'package:flutter/material.dart';

class WeatherByHoursEntity {
  final TimeOfDay time;
  final String condition;
  final double temperature;
  final double windPressure;
  final double uvIndex;
  final double humidity;
  final int conditionCode;

  WeatherByHoursEntity({
    required this.time,
    required this.condition,
    required this.temperature,
    required this.windPressure,
    required this.uvIndex,
    required this.humidity,
    required this.conditionCode,
  });

  String get imagePath => switch (conditionCode) {
        1000 => ImageAssetsConst.icSunny,
        1003 => ImageAssetsConst.icParticallyCloudy,
        1006 => ImageAssetsConst.icCloudy,
        1009 => ImageAssetsConst.icOvercast,
        1030 => ImageAssetsConst.icMist,
        1063 => ImageAssetsConst.icLightRain,
        1066 => ImageAssetsConst.icCloudy,
        1069 => ImageAssetsConst.icCloudy,
        1072 => ImageAssetsConst.icCloudy,
        1087 => ImageAssetsConst.icCloudy,
        1114 => ImageAssetsConst.icCloudy,
        1117 => ImageAssetsConst.icCloudy,
        1135 => ImageAssetsConst.icCloudy,
        1147 => ImageAssetsConst.icCloudy,
        1150 => ImageAssetsConst.icCloudy,
        1153 => ImageAssetsConst.icCloudy,
        1168 => ImageAssetsConst.icCloudy,
        1171 => ImageAssetsConst.icCloudy,
        1180 => ImageAssetsConst.icCloudy,
        1183 => ImageAssetsConst.icLightRain,
        1186 => ImageAssetsConst.icLightRain,
        1189 => ImageAssetsConst.icLightRain,
        1192 => ImageAssetsConst.icHeavyRain,
        1195 => ImageAssetsConst.icHeavyRain,
        1198 => ImageAssetsConst.icHeavyRain,
        1201 => ImageAssetsConst.icHeavyRain,
        1204 => ImageAssetsConst.icCloudy,
        1207 => ImageAssetsConst.icCloudy,
        1210 => ImageAssetsConst.icCloudy,
        1213 => ImageAssetsConst.icCloudy,
        1216 => ImageAssetsConst.icCloudy,
        1219 => ImageAssetsConst.icCloudy,
        1222 => ImageAssetsConst.icCloudy,
        1225 => ImageAssetsConst.icCloudy,
        1237 => ImageAssetsConst.icCloudy,
        1240 => ImageAssetsConst.icCloudy,
        1243 => ImageAssetsConst.icCloudy,
        1246 => ImageAssetsConst.icLightRain,
        1249 => ImageAssetsConst.icLightRain,
        1252 => ImageAssetsConst.icHeavyRain,
        1255 => ImageAssetsConst.icLightRain,
        1258 => ImageAssetsConst.icLightRain,
        1261 => ImageAssetsConst.icHeavyRain,
        1264 => ImageAssetsConst.icHeavyRain,
        1273 => ImageAssetsConst.icLightRain,
        1276 => ImageAssetsConst.icLightRain,
        1279 => ImageAssetsConst.icHeavyRain,
        1282 => ImageAssetsConst.icHeavyRain,
        _ => ImageAssetsConst.icCloudy,
      };

  WeatherByHoursEntity copyWith({
    TimeOfDay? time,
    String? condition,
    double? temperature,
    double? windPressure,
    double? uvIndex,
    double? humidity,
    int? conditionCode,
  }) {
    return WeatherByHoursEntity(
      conditionCode: conditionCode ?? this.conditionCode,
      time: time ?? this.time,
      condition: condition ?? this.condition,
      temperature: temperature ?? this.temperature,
      windPressure: windPressure ?? this.windPressure,
      uvIndex: uvIndex ?? this.uvIndex,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.extToJson(),
      'condition': condition,
      'temperature': temperature,
      'windPressure': windPressure,
      'uvIndex': uvIndex,
      'humidity': humidity,
      'conditionCode': conditionCode,
    };
  }

  factory WeatherByHoursEntity.fromJson(Map<String, dynamic> map) {
    return WeatherByHoursEntity(
      time: TimeOfDayExtension.extFromJsonTimeOfDay(map['time']),
      condition: map['condition'] ?? '',
      temperature: map['temperature']?.toDouble() ?? 0.0,
      windPressure: map['windPressure']?.toDouble() ?? 0.0,
      uvIndex: map['uvIndex']?.toDouble() ?? 0.0,
      humidity: map['humidity']?.toDouble() ?? 0.0,
      conditionCode: map['conditionCode']?.toInt() ?? 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherByHoursEntity &&
        other.time == time &&
        other.condition == condition &&
        other.temperature == temperature &&
        other.windPressure == windPressure &&
        other.uvIndex == uvIndex &&
        other.humidity == humidity &&
        other.conditionCode == conditionCode;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        condition.hashCode ^
        temperature.hashCode ^
        windPressure.hashCode ^
        uvIndex.hashCode ^
        humidity.hashCode ^
        conditionCode.hashCode;
  }
}
