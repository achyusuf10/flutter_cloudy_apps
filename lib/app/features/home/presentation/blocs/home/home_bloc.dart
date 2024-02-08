import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weateher_uc.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/get_user_location_uc.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/save_city_uc.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetForecastWeatherUC _getForecastWeatherUC;
  final GetUserLocationUC _getUserLocationUC;
  final SaveCityUC _saveCityUC;
  HomeBloc(
    this._getForecastWeatherUC,
    this._saveCityUC,
    this._getUserLocationUC,
  ) : super(const HomeState()) {
    on<_Started>(_onStart);
    on<_OnDaySelected>(_onDaySelected);
    on<_OnRefresh>(_onRefresh);
  }

  List<ForecastWeatherEntity> _weatherDatas = [];

  FutureOr<void> _onStart(event, emit) async {
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
            currentWeatherCondition: UIState.error(message: error),
            selectedWeatherCondition: UIState.error(message: error),
            selectedLocation: UIState.error(message: error),
          ),
        );
      },
    );
    return null;
  }

  FutureOr<void> _onDaySelected(event, emit) async {
    event as _OnDaySelected;
    var selectedWeather = _getEntityByIndex(event.index);
    if (selectedWeather == null) {
      await _onRefresh(event, emit);
      return;
    }
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
      error: (_) async {
        var resPosition = await _getUserLocationUC.call();
        resPosition.when(
          success: (data) {
            emit(
              state.copyWith(
                selectedLocation: UIState.success(data: data),
              ),
            );
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
      orElse: () async {
        /// do nothing
      },
    );

    emit(
      state.copyWith(
        selectedWeatherCondition: const UIState.loading(),
        currentWeatherCondition: const UIState.loading(),
      ),
    );
    var res = await _getForecastWeatherUC.call(GetForecastWeatherUCParams());
    res.when(
      success: (listData) {
        if (listData.isEmpty) {
          emit(
            state.copyWith(selectedWeatherCondition: const UIState.empty()),
          );
          return;
        }

        _weatherDatas = listData;
        var selectedWeather = _getEntityByIndex(state.selectedIndexDay);
        if (selectedWeather == null) return;
        var currentWeather = _getEntityByIndex(1);
        if (currentWeather == null) return;
        emit(
          state.copyWith(
            selectedWeatherCondition: UIState.success(data: selectedWeather),
            currentWeatherCondition: UIState.success(data: currentWeather),
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
  }

  ForecastWeatherEntity? _getEntityByIndex(int index) {
    int difference = switch (index) {
      0 => -1,
      1 => 0,
      2 => 1,
      _ => -1,
    };
    int indexDayOnData = (_weatherDatas).indexWhere(
      (element) => element.date.day == (DateTime.now().day + difference),
    );
    AppLogger.logData(indexDayOnData.toString());
    if (indexDayOnData == -1) return null;
    return _weatherDatas[indexDayOnData];
  }
}
