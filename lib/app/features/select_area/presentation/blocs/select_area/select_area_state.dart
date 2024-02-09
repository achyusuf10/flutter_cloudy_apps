part of 'select_area_cubit.dart';

@freezed
class SelectAreaState with _$SelectAreaState {
  const factory SelectAreaState({
    @Default(UIState.idle()) UIState<List<AreaEntity>> stateDataCity,
    @Default(UIState.idle())
    UIState<List<LocationResultEntity>> stateDataLocation,
  }) = _SelectAreaState;
}
