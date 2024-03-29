import 'dart:convert';

import 'package:cloudy/app/features/home/data/models/res_history_weather.dart';
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
              json.decode(fixture('res_history_weather.json'));
          // act
          final result = ResHistoryWeather.fromJson(jsonMap);
          // assert
          expect(result, isA<ResHistoryWeather>());
        },
      );

      test(
        'should return a valid json',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('res_history_weather.json'));
          // act
          final data = ResHistoryWeather.fromJson(jsonMap);
          final result = data.toJson();

          // assert
          final expectedMap = jsonMap;
          expect(expectedMap, result);
        },
      );
    },
  );
}
