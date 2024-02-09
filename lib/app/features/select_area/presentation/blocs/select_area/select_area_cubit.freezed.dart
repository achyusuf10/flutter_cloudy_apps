// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_area_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectAreaState {
  UIState<List<AreaEntity>> get stateDataCity =>
      throw _privateConstructorUsedError;
  UIState<List<LocationResultEntity>> get stateDataLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectAreaStateCopyWith<SelectAreaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectAreaStateCopyWith<$Res> {
  factory $SelectAreaStateCopyWith(
          SelectAreaState value, $Res Function(SelectAreaState) then) =
      _$SelectAreaStateCopyWithImpl<$Res, SelectAreaState>;
  @useResult
  $Res call(
      {UIState<List<AreaEntity>> stateDataCity,
      UIState<List<LocationResultEntity>> stateDataLocation});

  $UIStateCopyWith<List<AreaEntity>, $Res> get stateDataCity;
  $UIStateCopyWith<List<LocationResultEntity>, $Res> get stateDataLocation;
}

/// @nodoc
class _$SelectAreaStateCopyWithImpl<$Res, $Val extends SelectAreaState>
    implements $SelectAreaStateCopyWith<$Res> {
  _$SelectAreaStateCopyWithImpl(this._value, this._then);

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
              as UIState<List<AreaEntity>>,
      stateDataLocation: null == stateDataLocation
          ? _value.stateDataLocation
          : stateDataLocation // ignore: cast_nullable_to_non_nullable
              as UIState<List<LocationResultEntity>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<List<AreaEntity>, $Res> get stateDataCity {
    return $UIStateCopyWith<List<AreaEntity>, $Res>(_value.stateDataCity,
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
abstract class _$$SelectAreaStateImplCopyWith<$Res>
    implements $SelectAreaStateCopyWith<$Res> {
  factory _$$SelectAreaStateImplCopyWith(_$SelectAreaStateImpl value,
          $Res Function(_$SelectAreaStateImpl) then) =
      __$$SelectAreaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIState<List<AreaEntity>> stateDataCity,
      UIState<List<LocationResultEntity>> stateDataLocation});

  @override
  $UIStateCopyWith<List<AreaEntity>, $Res> get stateDataCity;
  @override
  $UIStateCopyWith<List<LocationResultEntity>, $Res> get stateDataLocation;
}

/// @nodoc
class __$$SelectAreaStateImplCopyWithImpl<$Res>
    extends _$SelectAreaStateCopyWithImpl<$Res, _$SelectAreaStateImpl>
    implements _$$SelectAreaStateImplCopyWith<$Res> {
  __$$SelectAreaStateImplCopyWithImpl(
      _$SelectAreaStateImpl _value, $Res Function(_$SelectAreaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDataCity = null,
    Object? stateDataLocation = null,
  }) {
    return _then(_$SelectAreaStateImpl(
      stateDataCity: null == stateDataCity
          ? _value.stateDataCity
          : stateDataCity // ignore: cast_nullable_to_non_nullable
              as UIState<List<AreaEntity>>,
      stateDataLocation: null == stateDataLocation
          ? _value.stateDataLocation
          : stateDataLocation // ignore: cast_nullable_to_non_nullable
              as UIState<List<LocationResultEntity>>,
    ));
  }
}

/// @nodoc

class _$SelectAreaStateImpl implements _SelectAreaState {
  const _$SelectAreaStateImpl(
      {this.stateDataCity = const UIState.idle(),
      this.stateDataLocation = const UIState.idle()});

  @override
  @JsonKey()
  final UIState<List<AreaEntity>> stateDataCity;
  @override
  @JsonKey()
  final UIState<List<LocationResultEntity>> stateDataLocation;

  @override
  String toString() {
    return 'SelectAreaState(stateDataCity: $stateDataCity, stateDataLocation: $stateDataLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAreaStateImpl &&
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
  _$$SelectAreaStateImplCopyWith<_$SelectAreaStateImpl> get copyWith =>
      __$$SelectAreaStateImplCopyWithImpl<_$SelectAreaStateImpl>(
          this, _$identity);
}

abstract class _SelectAreaState implements SelectAreaState {
  const factory _SelectAreaState(
          {final UIState<List<AreaEntity>> stateDataCity,
          final UIState<List<LocationResultEntity>> stateDataLocation}) =
      _$SelectAreaStateImpl;

  @override
  UIState<List<AreaEntity>> get stateDataCity;
  @override
  UIState<List<LocationResultEntity>> get stateDataLocation;
  @override
  @JsonKey(ignore: true)
  _$$SelectAreaStateImplCopyWith<_$SelectAreaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
