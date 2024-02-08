import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/home/domain/usecases/add_city_to_local_uc.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_current_city_weather_uc.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weather_uc.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/get_user_location_uc.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/config/routes/routes.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_context_func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetForecastWeatherUC _getForecastWeatherUC;
  final GetUserLocationUC _getUserLocationUC;
  final GetCurrentCityWeatherUC _getCurrentCityWeatherUC;
  final AddCityToLocalUC _addCityToLocalUC;
  final GetContextFunc _getContextFunc;
  HomeBloc(
    this._getForecastWeatherUC,
    this._addCityToLocalUC,
    this._getUserLocationUC,
    this._getCurrentCityWeatherUC,
    this._getContextFunc,
  ) : super(const HomeState()) {
    on<_Started>(_onStart);
    on<_OnDaySelected>(_onDaySelected);
    on<_OnRefresh>(_onRefresh);
    on<_OnTapSelectCity>(_onTapSelectCity);
  }

  late ForecastWeatherEntity _foreCastWeatherEntity;

  FutureOr<void> _onStart(event, emit) async {
    /// * Set Loading State
    emit(
      state.copyWith(
        currentWeatherCondition: const UIState.loading(),
        selectedWeatherCondition: const UIState.loading(),
        selectedLocation: const UIState.loading(),
      ),
    );
    var resPosition = await _getUserLocationUC.call();
    await resPosition.when(
      success: (dataLocation) async {
        emit(
          state.copyWith(
            selectedLocation: UIState.success(data: dataLocation),
          ),
        );

        /// * Check if already saved
        var resCurrentCity = await _getCurrentCityWeatherUC.call(
          GetCurrentCityWeatherParams(location: dataLocation),
        );

        resCurrentCity.map(
          success: (successCurrentCity) {
            _foreCastWeatherEntity = successCurrentCity.data.forecastData;
            var selectedWeather = _getEntityByIndex(state.selectedIndexDay);
            var currentWeather = _getEntityByIndex(1);

            /// * Jika tidak ada refresh
            if (selectedWeather == null || currentWeather == null) {
              add(const _OnRefresh());
              return;
            }
            emit(
              state.copyWith(
                selectedWeatherCondition: UIState.success(
                  data: selectedWeather,
                ),
                currentWeatherCondition: UIState.success(
                  data: currentWeather,
                ),
                selectedLocation: UIState.success(
                  data: successCurrentCity.data.locationData,
                ),
              ),
            );
          },
          error: (errorData) {
            AppLogger.logData(errorData.message);
            if (errorData.message == 'not-found') {
              add(const HomeEvent.onRefresh());
              return;
            }

            emit(
              state.copyWith(
                currentWeatherCondition: UIState.error(
                  message: errorData.message,
                ),
                selectedWeatherCondition: UIState.error(
                  message: errorData.message,
                ),
              ),
            );

            AppLogger.logData('kok gak ganti');
          },
        );
      },
      error: (error, _, __, e, ___) {
        emit(
          state.copyWith(
            currentWeatherCondition: UIState.error(message: error),
            selectedWeatherCondition: UIState.error(message: error),
            selectedLocation: UIState.error(message: error),
          ),
        );
      },
    );
  }

  FutureOr<void> _onDaySelected(event, emit) async {
    event as _OnDaySelected;
    var selectedWeather = _getEntityByIndex(event.index);
    if (selectedWeather == null) {
      await _onRefresh(event, emit);
      return;
    }
    selectedWeather = _getEntityByIndex(event.index);
    if (selectedWeather == null) return;
    emit(
      state.copyWith(
        selectedWeatherCondition: UIState.success(data: selectedWeather),
        selectedIndexDay: event.index,
      ),
    );
    return null;
  }

  FutureOr<void> _onRefresh(event, emit) async {
    await state.selectedLocation.maybeWhen(
      success: (dataLocation) async {
        emit(
          state.copyWith(
            selectedLocation: UIState.success(data: dataLocation),
            selectedWeatherCondition: const UIState.loading(),
            currentWeatherCondition: const UIState.loading(),
          ),
        );
        var res = await _getForecastWeatherUC.call(
          GetForecastWeatherParams(
            latitude: dataLocation.latitude,
            longitude: dataLocation.longitude,
          ),
        );
        res.when(
          success: (dataForecast) {
            _foreCastWeatherEntity = dataForecast;
            var selectedWeather = _getEntityByIndex(state.selectedIndexDay);
            var currentWeather = _getEntityByIndex(1);
            if (currentWeather == null || selectedWeather == null) {
              return;
            }

            /// * Save To Local
            _addCityToLocalUC.call(
              AddCityToLocalParams(
                replace: true,
                city: CityEntity(
                  locationData: dataLocation,
                  forecastData: dataForecast,
                ),
              ),
            );

            emit(
              state.copyWith(
                selectedWeatherCondition: UIState.success(
                  data: selectedWeather,
                ),
                currentWeatherCondition: UIState.success(
                  data: currentWeather,
                ),
              ),
            );
          },
          error: (_, __, ___, ____, _____) {
            emit(
              state.copyWith(
                selectedWeatherCondition: UIState.error(message: _),
                currentWeatherCondition: UIState.error(message: _),
              ),
            );
          },
        );
      },
      loading: () {
        return;
      },
      orElse: () async {
        var resPosition = await _getUserLocationUC.call();
        resPosition.when(
          success: (data) {
            emit(
              state.copyWith(
                selectedLocation: UIState.success(data: data),
              ),
            );
            add(const HomeEvent.onRefresh());
          },
          error: (error, _, __, e, ___) {
            emit(
              state.copyWith(
                selectedLocation: UIState.error(message: error),
              ),
            );
          },
        );
      },
    );
  }

  WeatherEntity? _getEntityByIndex(int index) {
    try {
      WeatherEntity? result = switch (index) {
        0 => _foreCastWeatherEntity.yesterdayWeather,
        1 => _foreCastWeatherEntity.currentWeather,
        2 => _foreCastWeatherEntity.tommorowWeather,
        _ => null,
      };
      return result;
    } catch (e) {
      return null;
    }
  }

  FutureOr<void> _onTapSelectCity(event, emit) async {
    var res = await _getContextFunc.i.router.pushNamed(Routes.selectCityPage);
    if (res == null) return;
    if (res is LocationResultEntity) {
      emit(
        state.copyWith(
          selectedLocation: UIState.success(data: res),
        ),
      );
      add(const HomeEvent.onRefresh());

      return;
    }
    if (res is CityEntity) {
      _foreCastWeatherEntity = res.forecastData;
      var selectedWeather = _getEntityByIndex(state.selectedIndexDay);
      var currentWeather = _getEntityByIndex(1);

      /// * Jika tidak ada refresh
      if (selectedWeather == null || currentWeather == null) {
        add(const _OnRefresh());
        return;
      }
      emit(
        state.copyWith(
          selectedLocation: UIState.success(data: res.locationData),
          selectedWeatherCondition: UIState.success(
            data: selectedWeather,
          ),
          currentWeatherCondition: UIState.success(
            data: currentWeather,
          ),
        ),
      );
    }
  }
}
