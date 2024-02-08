part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(1) int selectedIndexDay,
    @Default(UIState<ForecastWeatherEntity>.idle())
    UIState<ForecastWeatherEntity> selectedWeatherCondition,
    @Default(UIState<ForecastWeatherEntity>.idle())
    UIState<ForecastWeatherEntity> currentWeatherCondition,
    @Default(UIState<LocationResultEntity>.idle())
    UIState<LocationResultEntity> selectedLocation,
  }) = _HomeState;
}
