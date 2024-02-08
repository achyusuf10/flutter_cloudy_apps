// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) onDaySelected,
    required TResult Function() onRefresh,
    required TResult Function() onTapSelectCity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? onDaySelected,
    TResult? Function()? onRefresh,
    TResult? Function()? onTapSelectCity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? onDaySelected,
    TResult Function()? onRefresh,
    TResult Function()? onTapSelectCity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnDaySelected value) onDaySelected,
    required TResult Function(_OnRefresh value) onRefresh,
    required TResult Function(_OnTapSelectCity value) onTapSelectCity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnDaySelected value)? onDaySelected,
    TResult? Function(_OnRefresh value)? onRefresh,
    TResult? Function(_OnTapSelectCity value)? onTapSelectCity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnDaySelected value)? onDaySelected,
    TResult Function(_OnRefresh value)? onRefresh,
    TResult Function(_OnTapSelectCity value)? onTapSelectCity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) onDaySelected,
    required TResult Function() onRefresh,
    required TResult Function() onTapSelectCity,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? onDaySelected,
    TResult? Function()? onRefresh,
    TResult? Function()? onTapSelectCity,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? onDaySelected,
    TResult Function()? onRefresh,
    TResult Function()? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnDaySelected value) onDaySelected,
    required TResult Function(_OnRefresh value) onRefresh,
    required TResult Function(_OnTapSelectCity value) onTapSelectCity,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnDaySelected value)? onDaySelected,
    TResult? Function(_OnRefresh value)? onRefresh,
    TResult? Function(_OnTapSelectCity value)? onTapSelectCity,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnDaySelected value)? onDaySelected,
    TResult Function(_OnRefresh value)? onRefresh,
    TResult Function(_OnTapSelectCity value)? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$OnDaySelectedImplCopyWith<$Res> {
  factory _$$OnDaySelectedImplCopyWith(
          _$OnDaySelectedImpl value, $Res Function(_$OnDaySelectedImpl) then) =
      __$$OnDaySelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$OnDaySelectedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$OnDaySelectedImpl>
    implements _$$OnDaySelectedImplCopyWith<$Res> {
  __$$OnDaySelectedImplCopyWithImpl(
      _$OnDaySelectedImpl _value, $Res Function(_$OnDaySelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$OnDaySelectedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnDaySelectedImpl implements _OnDaySelected {
  const _$OnDaySelectedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'HomeEvent.onDaySelected(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDaySelectedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDaySelectedImplCopyWith<_$OnDaySelectedImpl> get copyWith =>
      __$$OnDaySelectedImplCopyWithImpl<_$OnDaySelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) onDaySelected,
    required TResult Function() onRefresh,
    required TResult Function() onTapSelectCity,
  }) {
    return onDaySelected(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? onDaySelected,
    TResult? Function()? onRefresh,
    TResult? Function()? onTapSelectCity,
  }) {
    return onDaySelected?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? onDaySelected,
    TResult Function()? onRefresh,
    TResult Function()? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onDaySelected != null) {
      return onDaySelected(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnDaySelected value) onDaySelected,
    required TResult Function(_OnRefresh value) onRefresh,
    required TResult Function(_OnTapSelectCity value) onTapSelectCity,
  }) {
    return onDaySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnDaySelected value)? onDaySelected,
    TResult? Function(_OnRefresh value)? onRefresh,
    TResult? Function(_OnTapSelectCity value)? onTapSelectCity,
  }) {
    return onDaySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnDaySelected value)? onDaySelected,
    TResult Function(_OnRefresh value)? onRefresh,
    TResult Function(_OnTapSelectCity value)? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onDaySelected != null) {
      return onDaySelected(this);
    }
    return orElse();
  }
}

abstract class _OnDaySelected implements HomeEvent {
  const factory _OnDaySelected(final int index) = _$OnDaySelectedImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$OnDaySelectedImplCopyWith<_$OnDaySelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnRefreshImplCopyWith<$Res> {
  factory _$$OnRefreshImplCopyWith(
          _$OnRefreshImpl value, $Res Function(_$OnRefreshImpl) then) =
      __$$OnRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnRefreshImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$OnRefreshImpl>
    implements _$$OnRefreshImplCopyWith<$Res> {
  __$$OnRefreshImplCopyWithImpl(
      _$OnRefreshImpl _value, $Res Function(_$OnRefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnRefreshImpl implements _OnRefresh {
  const _$OnRefreshImpl();

  @override
  String toString() {
    return 'HomeEvent.onRefresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) onDaySelected,
    required TResult Function() onRefresh,
    required TResult Function() onTapSelectCity,
  }) {
    return onRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? onDaySelected,
    TResult? Function()? onRefresh,
    TResult? Function()? onTapSelectCity,
  }) {
    return onRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? onDaySelected,
    TResult Function()? onRefresh,
    TResult Function()? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onRefresh != null) {
      return onRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnDaySelected value) onDaySelected,
    required TResult Function(_OnRefresh value) onRefresh,
    required TResult Function(_OnTapSelectCity value) onTapSelectCity,
  }) {
    return onRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnDaySelected value)? onDaySelected,
    TResult? Function(_OnRefresh value)? onRefresh,
    TResult? Function(_OnTapSelectCity value)? onTapSelectCity,
  }) {
    return onRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnDaySelected value)? onDaySelected,
    TResult Function(_OnRefresh value)? onRefresh,
    TResult Function(_OnTapSelectCity value)? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onRefresh != null) {
      return onRefresh(this);
    }
    return orElse();
  }
}

abstract class _OnRefresh implements HomeEvent {
  const factory _OnRefresh() = _$OnRefreshImpl;
}

/// @nodoc
abstract class _$$OnTapSelectCityImplCopyWith<$Res> {
  factory _$$OnTapSelectCityImplCopyWith(_$OnTapSelectCityImpl value,
          $Res Function(_$OnTapSelectCityImpl) then) =
      __$$OnTapSelectCityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnTapSelectCityImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$OnTapSelectCityImpl>
    implements _$$OnTapSelectCityImplCopyWith<$Res> {
  __$$OnTapSelectCityImplCopyWithImpl(
      _$OnTapSelectCityImpl _value, $Res Function(_$OnTapSelectCityImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnTapSelectCityImpl implements _OnTapSelectCity {
  const _$OnTapSelectCityImpl();

  @override
  String toString() {
    return 'HomeEvent.onTapSelectCity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnTapSelectCityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) onDaySelected,
    required TResult Function() onRefresh,
    required TResult Function() onTapSelectCity,
  }) {
    return onTapSelectCity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? onDaySelected,
    TResult? Function()? onRefresh,
    TResult? Function()? onTapSelectCity,
  }) {
    return onTapSelectCity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? onDaySelected,
    TResult Function()? onRefresh,
    TResult Function()? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onTapSelectCity != null) {
      return onTapSelectCity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnDaySelected value) onDaySelected,
    required TResult Function(_OnRefresh value) onRefresh,
    required TResult Function(_OnTapSelectCity value) onTapSelectCity,
  }) {
    return onTapSelectCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnDaySelected value)? onDaySelected,
    TResult? Function(_OnRefresh value)? onRefresh,
    TResult? Function(_OnTapSelectCity value)? onTapSelectCity,
  }) {
    return onTapSelectCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnDaySelected value)? onDaySelected,
    TResult Function(_OnRefresh value)? onRefresh,
    TResult Function(_OnTapSelectCity value)? onTapSelectCity,
    required TResult orElse(),
  }) {
    if (onTapSelectCity != null) {
      return onTapSelectCity(this);
    }
    return orElse();
  }
}

abstract class _OnTapSelectCity implements HomeEvent {
  const factory _OnTapSelectCity() = _$OnTapSelectCityImpl;
}

/// @nodoc
mixin _$HomeState {
  int get selectedIndexDay => throw _privateConstructorUsedError;
  UIState<WeatherEntity> get selectedWeatherCondition =>
      throw _privateConstructorUsedError;
  UIState<WeatherEntity> get currentWeatherCondition =>
      throw _privateConstructorUsedError;
  UIState<LocationResultEntity> get selectedLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {int selectedIndexDay,
      UIState<WeatherEntity> selectedWeatherCondition,
      UIState<WeatherEntity> currentWeatherCondition,
      UIState<LocationResultEntity> selectedLocation});

  $UIStateCopyWith<WeatherEntity, $Res> get selectedWeatherCondition;
  $UIStateCopyWith<WeatherEntity, $Res> get currentWeatherCondition;
  $UIStateCopyWith<LocationResultEntity, $Res> get selectedLocation;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndexDay = null,
    Object? selectedWeatherCondition = null,
    Object? currentWeatherCondition = null,
    Object? selectedLocation = null,
  }) {
    return _then(_value.copyWith(
      selectedIndexDay: null == selectedIndexDay
          ? _value.selectedIndexDay
          : selectedIndexDay // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeatherCondition: null == selectedWeatherCondition
          ? _value.selectedWeatherCondition
          : selectedWeatherCondition // ignore: cast_nullable_to_non_nullable
              as UIState<WeatherEntity>,
      currentWeatherCondition: null == currentWeatherCondition
          ? _value.currentWeatherCondition
          : currentWeatherCondition // ignore: cast_nullable_to_non_nullable
              as UIState<WeatherEntity>,
      selectedLocation: null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as UIState<LocationResultEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<WeatherEntity, $Res> get selectedWeatherCondition {
    return $UIStateCopyWith<WeatherEntity, $Res>(
        _value.selectedWeatherCondition, (value) {
      return _then(_value.copyWith(selectedWeatherCondition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<WeatherEntity, $Res> get currentWeatherCondition {
    return $UIStateCopyWith<WeatherEntity, $Res>(_value.currentWeatherCondition,
        (value) {
      return _then(_value.copyWith(currentWeatherCondition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<LocationResultEntity, $Res> get selectedLocation {
    return $UIStateCopyWith<LocationResultEntity, $Res>(_value.selectedLocation,
        (value) {
      return _then(_value.copyWith(selectedLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedIndexDay,
      UIState<WeatherEntity> selectedWeatherCondition,
      UIState<WeatherEntity> currentWeatherCondition,
      UIState<LocationResultEntity> selectedLocation});

  @override
  $UIStateCopyWith<WeatherEntity, $Res> get selectedWeatherCondition;
  @override
  $UIStateCopyWith<WeatherEntity, $Res> get currentWeatherCondition;
  @override
  $UIStateCopyWith<LocationResultEntity, $Res> get selectedLocation;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndexDay = null,
    Object? selectedWeatherCondition = null,
    Object? currentWeatherCondition = null,
    Object? selectedLocation = null,
  }) {
    return _then(_$HomeStateImpl(
      selectedIndexDay: null == selectedIndexDay
          ? _value.selectedIndexDay
          : selectedIndexDay // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeatherCondition: null == selectedWeatherCondition
          ? _value.selectedWeatherCondition
          : selectedWeatherCondition // ignore: cast_nullable_to_non_nullable
              as UIState<WeatherEntity>,
      currentWeatherCondition: null == currentWeatherCondition
          ? _value.currentWeatherCondition
          : currentWeatherCondition // ignore: cast_nullable_to_non_nullable
              as UIState<WeatherEntity>,
      selectedLocation: null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as UIState<LocationResultEntity>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.selectedIndexDay = 1,
      this.selectedWeatherCondition = const UIState<WeatherEntity>.idle(),
      this.currentWeatherCondition = const UIState<WeatherEntity>.idle(),
      this.selectedLocation = const UIState<LocationResultEntity>.idle()});

  @override
  @JsonKey()
  final int selectedIndexDay;
  @override
  @JsonKey()
  final UIState<WeatherEntity> selectedWeatherCondition;
  @override
  @JsonKey()
  final UIState<WeatherEntity> currentWeatherCondition;
  @override
  @JsonKey()
  final UIState<LocationResultEntity> selectedLocation;

  @override
  String toString() {
    return 'HomeState(selectedIndexDay: $selectedIndexDay, selectedWeatherCondition: $selectedWeatherCondition, currentWeatherCondition: $currentWeatherCondition, selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.selectedIndexDay, selectedIndexDay) ||
                other.selectedIndexDay == selectedIndexDay) &&
            (identical(
                    other.selectedWeatherCondition, selectedWeatherCondition) ||
                other.selectedWeatherCondition == selectedWeatherCondition) &&
            (identical(
                    other.currentWeatherCondition, currentWeatherCondition) ||
                other.currentWeatherCondition == currentWeatherCondition) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndexDay,
      selectedWeatherCondition, currentWeatherCondition, selectedLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final int selectedIndexDay,
      final UIState<WeatherEntity> selectedWeatherCondition,
      final UIState<WeatherEntity> currentWeatherCondition,
      final UIState<LocationResultEntity> selectedLocation}) = _$HomeStateImpl;

  @override
  int get selectedIndexDay;
  @override
  UIState<WeatherEntity> get selectedWeatherCondition;
  @override
  UIState<WeatherEntity> get currentWeatherCondition;
  @override
  UIState<LocationResultEntity> get selectedLocation;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
