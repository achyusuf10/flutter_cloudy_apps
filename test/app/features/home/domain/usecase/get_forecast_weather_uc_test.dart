import 'package:cloudy/app/features/home/data/repositories/weather_repository_impl.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weather_uc.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_forecast_weather_uc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepositoryImpl>()])
void main() {
  late GetForecastWeatherUC getForecastWeatherUC;
  late MockWeatherRepositoryImpl weatherRepositoryImpl;
  setUp(() {
    weatherRepositoryImpl = MockWeatherRepositoryImpl();
    getForecastWeatherUC = GetForecastWeatherUC(weatherRepositoryImpl);
  });

  WeatherEntity weatherEntity = WeatherEntity(
    date: DateTime.now(),
    listItem: [],
  );
  var listWeather = List.generate(4, (index) => weatherEntity).toList();
  group(
    'GetForecastWeatherUC Test',
    () {
      test(
        'Success Fetch forecast data',
        () async {
          /// * Arrange
          when(
            weatherRepositoryImpl.getListWeather(
              latitude: 0,
              longitude: 0,
            ),
          ).thenAnswer(
            (_) async => DataState.success(
              data: listWeather,
            ),
          );
          when(
            weatherRepositoryImpl.getYesterdayWeather(
              latitude: 0,
              longitude: 0,
            ),
          ).thenAnswer(
            (_) async => DataState.success(
              data: weatherEntity,
            ),
          );

          /// * Act
          var result = await getForecastWeatherUC.call(
            GetForecastWeatherParams(
              latitude: 0,
              longitude: 0,
            ),
          );

          /// assert
          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<ForecastWeatherEntity>(),
          );
        },
      );
    },
  );
}
