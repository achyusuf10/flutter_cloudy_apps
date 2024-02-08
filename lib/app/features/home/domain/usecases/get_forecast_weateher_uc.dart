import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetForecastWeatherUC
    extends UseCase<List<ForecastWeatherEntity>, GetForecastWeatherUCParams> {
  @override
  Future<DataState<List<ForecastWeatherEntity>>> call(
      GetForecastWeatherUCParams params) async {
    await Future.delayed(const Duration(seconds: 3));
    return DataState.success(
      data: [
        ForecastWeatherEntity(
          date: DateTime.now().subtract(const Duration(days: 1)),
          listItem: [
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 20,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 89,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
          ],
        ),
        ForecastWeatherEntity(
          date: DateTime.now(),
          listItem: [
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
          ],
        ),
        ForecastWeatherEntity(
          date: DateTime.now().add(const Duration(days: 1)),
          listItem: [
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 25,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
            WeatherItemByHoursEntity(
              time: DateTime.now(),
              condition: 'cloudy',
              temperature: 10,
              windPressure: 20,
              uvIndex: 30,
              humidity: 30,
            ),
          ],
        )
      ],
    );
  }
}

class GetForecastWeatherUCParams {}
