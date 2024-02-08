// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_city_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectCityState {
  UIState<List<CityEntity>> get stateDataCity =>
      throw _privateConstructorUsedError;
  UIState<List<LocationResultEntity>> get stateDataLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectCityStateCopyWith<SelectCityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCityStateCopyWith<$Res> {
  factory $SelectCityStateCopyWith(
          SelectCityState value, $Res Function(SelectCityState) then) =
      _$SelectCityStateCopyWithImpl<$Res, SelectCityState>;
  @useResult
  $Res call(
      {UIState<List<CityEntity>> stateDataCity,
      UIState<List<LocationResultEntity>> stateDataLocation});

  $UIStateCopyWith<List<CityEntity>, $Res> get stateDataCity;
  $UIStateCopyWith<List<LocationResultEntity>, $Res> get stateDataLocation;
}

/// @nodoc
class _$SelectCityStateCopyWithImpl<$Res, $Val extends SelectCityState>
    implements $SelectCityStateCopyWith<$Res> {
  _$SelectCityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDataCity = null,
    Object? stateDataLocation = null,
  }) {
    return _then(_value.copyWith(
      stateDataCity: null == stateDataCity
          ? _value.stateDataCity
          : stateDataCity // ignore: cast_nullable_to_non_nullable
              as UIState<List<CityEntity>>,
      stateDataLocation: null == stateDataLocation
          ? _value.stateDataLocation
          : stateDataLocation // ignore: cast_nullable_to_non_nullable
              as UIState<List<LocationResultEntity>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<List<CityEntity>, $Res> get stateDataCity {
    return $UIStateCopyWith<List<CityEntity>, $Res>(_value.stateDataCity,
        (value) {
      return _then(_value.copyWith(stateDataCity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<List<LocationResultEntity>, $Res> get stateDataLocation {
    return $UIStateCopyWith<List<LocationResultEntity>, $Res>(
        _value.stateDataLocation, (value) {
      return _then(_value.copyWith(stateDataLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelectCityStateImplCopyWith<$Res>
    implements $SelectCityStateCopyWith<$Res> {
  factory _$$SelectCityStateImplCopyWith(_$SelectCityStateImpl value,
          $Res Function(_$SelectCityStateImpl) then) =
      __$$SelectCityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIState<List<CityEntity>> stateDataCity,
      UIState<List<LocationResultEntity>> stateDataLocation});

  @override
  $UIStateCopyWith<List<CityEntity>, $Res> get stateDataCity;
  @override
  $UIStateCopyWith<List<LocationResultEntity>, $Res> get stateDataLocation;
}

/// @nodoc
class __$$SelectCityStateImplCopyWithImpl<$Res>
    extends _$SelectCityStateCopyWithImpl<$Res, _$SelectCityStateImpl>
    implements _$$SelectCityStateImplCopyWith<$Res> {
  __$$SelectCityStateImplCopyWithImpl(
      _$SelectCityStateImpl _value, $Res Function(_$SelectCityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDataCity = null,
    Object? stateDataLocation = null,
  }) {
    return _then(_$SelectCityStateImpl(
      stateDataCity: null == stateDataCity
          ? _value.stateDataCity
          : stateDataCity // ignore: cast_nullable_to_non_nullable
              as UIState<List<CityEntity>>,
      stateDataLocation: null == stateDataLocation
          ? _value.stateDataLocation
          : stateDataLocation // ignore: cast_nullable_to_non_nullable
              as UIState<List<LocationResultEntity>>,
    ));
  }
}

/// @nodoc

class _$SelectCityStateImpl implements _SelectCityState {
  const _$SelectCityStateImpl(
      {this.stateDataCity = const UIState.idle(),
      this.stateDataLocation = const UIState.idle()});

  @override
  @JsonKey()
  final UIState<List<CityEntity>> stateDataCity;
  @override
  @JsonKey()
  final UIState<List<LocationResultEntity>> stateDataLocation;

  @override
  String toString() {
    return 'SelectCityState(stateDataCity: $stateDataCity, stateDataLocation: $stateDataLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCityStateImpl &&
            (identical(other.stateDataCity, stateDataCity) ||
                other.stateDataCity == stateDataCity) &&
            (identical(other.stateDataLocation, stateDataLocation) ||
                other.stateDataLocation == stateDataLocation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, stateDataCity, stateDataLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCityStateImplCopyWith<_$SelectCityStateImpl> get copyWith =>
      __$$SelectCityStateImplCopyWithImpl<_$SelectCityStateImpl>(
          this, _$identity);
}

abstract class _SelectCityState implements SelectCityState {
  const factory _SelectCityState(
          {final UIState<List<CityEntity>> stateDataCity,
          final UIState<List<LocationResultEntity>> stateDataLocation}) =
      _$SelectCityStateImpl;

  @override
  UIState<List<CityEntity>> get stateDataCity;
  @override
  UIState<List<LocationResultEntity>> get stateDataLocation;
  @override
  @JsonKey(ignore: true)
  _$$SelectCityStateImplCopyWith<_$SelectCityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
