import 'dart:convert';

import 'package:cloudy/app/features/home/data/datasources/local/weather_local_datasource.dart';
import 'package:cloudy/app/features/home/data/datasources/remote/weather_remote_datasource.dart';
import 'package:cloudy/app/features/home/data/models/res_forecast_weather.dart';
import 'package:cloudy/app/features/home/data/models/res_history_weather.dart';
import 'package:cloudy/app/features/home/data/repositories/weather_repository_impl.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'weather_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRemoteDataSourceImpl>()])
@GenerateNiceMocks([MockSpec<WeatherLocalDataSourceImpl>()])
void main() {
  late WeatherRepositoryImpl repository;
  late WeatherRemoteDataSourceImpl remoteMock;
  late WeatherLocalDataSourceImpl localMock;

  setUp(() {
    remoteMock = MockWeatherRemoteDataSourceImpl();
    localMock = MockWeatherLocalDataSourceImpl();
    repository = WeatherRepositoryImpl(localMock, remoteMock);
  });

  group(
    'Repository Function Fecth Forecast Test',
    () {
      test(
        'Success Fetch forecast data',
        () async {
          /// * Arrange
          when(
            remoteMock.getForecastWeather(
              latitude: 0,
              longitude: 0,
            ),
          ).thenAnswer(
            (_) async => DataState.success(
              data: ResForecastWeather.fromJson(
                jsonDecode(
                  fixture('res_forecast_weather.json'),
                ),
              ),
            ),
          );

          /// * Act
          var result = await repository.getListWeather(
            latitude: 0,
            longitude: 0,
          );

          /// assert
          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<List<WeatherEntity>>(),
          );
        },
      );

      test(
        'Error Fetch forecast data',
        () async {
          /// * Arrange
          when(
            remoteMock.getForecastWeather(
              latitude: 10.213123,
              longitude: -92.032,
            ),
          ).thenAnswer(
            (_) async => const DataState.error(
              message: 'error',
              code: 400,
            ),
          );

          /// * Act
          var result = await repository.getListWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert
          var data = result.mapOrNull(error: (data) => data.code);
          expect(
            data,
            400,
          );
        },
      );
    },
  );

  group(
    'Repository Function Fecth History Test',
    () {
      test(
        'Success Fetch History data',
        () async {
          /// * Arrange
          when(
            remoteMock.getHistoryWeather(
              latitude: 10.2131,
              longitude: -92.032,
            ),
          ).thenAnswer(
            (_) async => DataState.success(
              data: ResHistoryWeather.fromJson(
                jsonDecode(
                  fixture('res_history_weather.json'),
                ),
              ),
            ),
          );

          /// * Act
          var result = await repository.getYesterdayWeather(
            latitude: 10.2131,
            longitude: -92.032,
          );

          /// assert

          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<WeatherEntity>(),
          );
        },
      );

      test(
        'Error Fetch history data',
        () async {
          /// * Arrange
          when(
            remoteMock.getHistoryWeather(
              latitude: 10.213123,
              longitude: -92.032,
            ),
          ).thenAnswer(
            (_) async => const DataState.error(
              message: 'error',
              code: 400,
            ),
          );

          /// * Act
          var result = await repository.getYesterdayWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert
          var data = result.mapOrNull(error: (data) => data.code);
          expect(
            data,
            400,
          );
        },
      );
    },
  );
}
