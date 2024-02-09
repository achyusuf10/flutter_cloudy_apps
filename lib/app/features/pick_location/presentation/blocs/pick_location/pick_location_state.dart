part of 'pick_location_cubit.dart';

@freezed
class PickLocationState with _$PickLocationState {
  const factory PickLocationState({
    @Default(UIState.idle()) UIState<Position> selectedPosition,
    @Default(UIState.idle()) UIState<LocationResultEntity> selectedLocation,
  }) = _PickLocationState;
}
