part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.onDaySelected(int index) = _OnDaySelected;
  const factory HomeEvent.onRefresh() = _OnRefresh;
}
