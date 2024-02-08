import 'dart:convert';

import 'package:cloudy/app/features/home/data/models/res_forecast_weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  group(
    'Json Function Test',
    () {
      test(
        'should return a valid model',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('res_forecast_weather.json'));
          // act
          final result = ResForecastWeather.fromJson(jsonMap);
          // assert
          expect(result.runtimeType, ResForecastWeather);
        },
      );

      test(
        'should return a valid json',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('res_forecast_weather.json'));
          // act
          final data = ResForecastWeather.fromJson(jsonMap);
          final result = data.toJson();

          // assert
          final expectedMap = jsonMap;
          expect(expectedMap, result);
        },
      );
    },
  );
}
