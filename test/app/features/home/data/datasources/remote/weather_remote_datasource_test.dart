import 'dart:convert';

import 'package:cloudy/app/features/home/data/datasources/remote/weather_remote_datasource.dart';
import 'package:cloudy/app/features/home/data/models/res_forecast_weather.dart';
import 'package:cloudy/app/features/home/data/models/res_history_weather.dart';
import 'package:cloudy/constants/core/api_const.dart';
import 'package:cloudy/utils/extensions/date_time_ext.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/fixture_reader.dart';
import 'weather_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late WeatherRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = WeatherRemoteDataSourceImpl(mockDio);
  });

  void setUpMockDioForecast200() {
    when(
      mockDio.get(
        ApiConst.getForecastWeather,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(
          fixture(
            'res_forecast_weather.json',
          ),
        ),
      ),
    );
  }

  void setUpMockDioForecast400() {
    when(
      mockDio.get(
        ApiConst.getForecastWeather,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 400,
      ),
    );
  }

  void setUpMockDioHistory200() {
    when(
      mockDio.get(
        ApiConst.getForecastWeather,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(
          fixture(
            'res_history_weather.json',
          ),
        ),
      ),
    );
  }

  void setUpMockDioHistory400() {
    when(
      mockDio.get(
        ApiConst.getForecastWeather,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 400,
      ),
    );
  }

  group(
    'Fetch Forecast Weather Data From Api',
    () {
      test(
        '''Should perform a GET request on a URL latlong
       being the endpoint''',
        () {
          /// arrange
          setUpMockDioForecast200();

          /// act
          dataSource.getForecastWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert
          verify(
            mockDio.get(
              ApiConst.getForecastWeather,
              queryParameters: {
                'q': '10.213123,-92.032',
                'days': 7,
                'alert': 'yes',
              },
            ),
          );
        },
      );

      test(
        'Should return success response',
        () async {
          // arrange
          setUpMockDioForecast200();

          /// act
          var result = await dataSource.getForecastWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert
          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<ResForecastWeather>(),
          );
        },
      );

      test(
        'Should return error response',
        () async {
          // arrange
          setUpMockDioForecast400();

          /// act
          var result = await dataSource.getForecastWeather(
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

  //// * History Weather
  group(
    'Fetch History Weather Data From Api',
    () {
      test(
        '''Should perform a GET request on a URL latlong
       being the endpoint''',
        () {
          /// arrange
          setUpMockDioHistory200();

          /// act
          dataSource.getHistoryWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert
          verify(
            mockDio.get(
              ApiConst.getForecastWeather,
              queryParameters: {
                'q': '10.213123,-92.032',
                'dt': DateTime.now()
                    .subtract(const Duration(days: 1))
                    .extToFormattedString(outputDateFormat: 'yyyy-MM-dd'),
              },
            ),
          );
        },
      );

      test(
        'Should return success response',
        () async {
          // arrange
          setUpMockDioHistory200();

          /// act
          var result = await dataSource.getHistoryWeather(
            latitude: 10.213123,
            longitude: -92.032,
          );

          /// assert

          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<ResHistoryWeather>(),
          );
        },
      );

      test(
        'Should return error response',
        () async {
          // arrange
          setUpMockDioHistory400();

          /// act
          var result = await dataSource.getForecastWeather(
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
