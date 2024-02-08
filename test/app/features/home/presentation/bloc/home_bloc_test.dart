import 'package:bloc_test/bloc_test.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/usecases/add_city_to_local_uc.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_current_city_weather_uc.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weather_uc.dart';
import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/get_user_location_uc.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_context_func.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetForecastWeatherUC>()])
@GenerateNiceMocks([MockSpec<GetUserLocationUC>()])
@GenerateNiceMocks([MockSpec<GetCurrentCityWeatherUC>()])
@GenerateNiceMocks([MockSpec<AddCityToLocalUC>()])
@GenerateNiceMocks([MockSpec<GetContextFunc>()])
void main() {
  late HomeBloc bloc;
  late MockGetForecastWeatherUC mockGetForecastWeatherUC;
  late MockGetUserLocationUC mockGetUserLocationUC;
  late MockGetCurrentCityWeatherUC mockGetCurrentCityWeatherUC;
  late MockAddCityToLocalUC mockAddCityToLocalUC;
  late MockGetContextFunc mockGetContextFunc;

  final ForecastWeatherEntity forecastWeatherT =
      ForecastWeatherEntity.initial();
  final LocationResultEntity locationResultT = LocationResultEntity.initial();

  final CityEntity cityT = CityEntity(
    locationData: locationResultT,
    forecastData: forecastWeatherT,
  );

  GetCurrentCityWeatherParams getCurrentCityWeatherParams =
      GetCurrentCityWeatherParams(
    location: locationResultT,
  );

  setUp(
    () {
      mockGetForecastWeatherUC = MockGetForecastWeatherUC();
      mockGetUserLocationUC = MockGetUserLocationUC();
      mockGetCurrentCityWeatherUC = MockGetCurrentCityWeatherUC();
      mockAddCityToLocalUC = MockAddCityToLocalUC();
      mockGetContextFunc = MockGetContextFunc();
      bloc = HomeBloc(
        mockGetForecastWeatherUC,
        mockAddCityToLocalUC,
        mockGetUserLocationUC,
        mockGetCurrentCityWeatherUC,
        mockGetContextFunc,
      );
    },
  );

  var state = const HomeState();

  test('initialState should be Empty', () {
    // assert
    expect(bloc.state, equals(state));
  });

  group(
    'On Started Event',
    () {
      blocTest<HomeBloc, HomeState>(
        'Should emit success to all datas, when city already save in local',
        build: () => bloc,
        act: (bloc) {
          when(
            mockGetUserLocationUC.call(),
          ).thenAnswer(
            (_) async => DataState.success(
              data: LocationResultEntity.initial(),
            ),
          );
          when(
            mockGetCurrentCityWeatherUC.call(getCurrentCityWeatherParams),
          ).thenAnswer(
            (_) async => DataState.success(
              data: cityT,
            ),
          );
          bloc.add(const HomeEvent.started());
        },
        expect: () {
          var result = [
            state.copyWith(
              selectedIndexDay: 1,
              selectedLocation: const UIState.loading(),
              selectedWeatherCondition: const UIState.loading(),
              currentWeatherCondition: const UIState.loading(),
            ),
            state.copyWith(
              selectedIndexDay: 1,
              selectedLocation: UIState.success(data: locationResultT),
              selectedWeatherCondition: const UIState.loading(),
              currentWeatherCondition: const UIState.loading(),
            ),
            state.copyWith(
              selectedIndexDay: 1,
              selectedLocation: UIState.success(data: locationResultT),
              selectedWeatherCondition: UIState.success(
                data: cityT.forecastData.currentWeather!,
              ),
              currentWeatherCondition: UIState.success(
                data: cityT.forecastData.currentWeather!,
              ),
            ),
          ];
          return result;
        },
      );
    },
  );
}
