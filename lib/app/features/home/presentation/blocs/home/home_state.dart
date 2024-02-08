part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(1) int selectedIndexDay,
    @Default(UIState<WeatherEntity>.idle())
    UIState<WeatherEntity> selectedWeatherCondition,
    @Default(UIState<WeatherEntity>.idle())
    UIState<WeatherEntity> currentWeatherCondition,
    @Default(UIState<LocationResultEntity>.idle())
    UIState<LocationResultEntity> selectedLocation,
  }) = _HomeState;
}
