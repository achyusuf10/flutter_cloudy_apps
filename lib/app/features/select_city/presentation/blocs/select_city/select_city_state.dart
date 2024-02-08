part of 'select_city_cubit.dart';

@freezed
class SelectCityState with _$SelectCityState {
  const factory SelectCityState({
    @Default(UIState.idle()) UIState<List<CityEntity>> stateDataCity,
    @Default(UIState.idle())
    UIState<List<LocationResultEntity>> stateDataLocation,
  }) = _SelectCityState;
}
