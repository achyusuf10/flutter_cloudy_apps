// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickLocationState {
  UIState<Position> get selectedPosition => throw _privateConstructorUsedError;
  UIState<LocationResultEntity> get selectedLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PickLocationStateCopyWith<PickLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickLocationStateCopyWith<$Res> {
  factory $PickLocationStateCopyWith(
          PickLocationState value, $Res Function(PickLocationState) then) =
      _$PickLocationStateCopyWithImpl<$Res, PickLocationState>;
  @useResult
  $Res call(
      {UIState<Position> selectedPosition,
      UIState<LocationResultEntity> selectedLocation});

  $UIStateCopyWith<Position, $Res> get selectedPosition;
  $UIStateCopyWith<LocationResultEntity, $Res> get selectedLocation;
}

/// @nodoc
class _$PickLocationStateCopyWithImpl<$Res, $Val extends PickLocationState>
    implements $PickLocationStateCopyWith<$Res> {
  _$PickLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPosition = null,
    Object? selectedLocation = null,
  }) {
    return _then(_value.copyWith(
      selectedPosition: null == selectedPosition
          ? _value.selectedPosition
          : selectedPosition // ignore: cast_nullable_to_non_nullable
              as UIState<Position>,
      selectedLocation: null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as UIState<LocationResultEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<Position, $Res> get selectedPosition {
    return $UIStateCopyWith<Position, $Res>(_value.selectedPosition, (value) {
      return _then(_value.copyWith(selectedPosition: value) as $Val);
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
abstract class _$$PickLocationStateImplCopyWith<$Res>
    implements $PickLocationStateCopyWith<$Res> {
  factory _$$PickLocationStateImplCopyWith(_$PickLocationStateImpl value,
          $Res Function(_$PickLocationStateImpl) then) =
      __$$PickLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIState<Position> selectedPosition,
      UIState<LocationResultEntity> selectedLocation});

  @override
  $UIStateCopyWith<Position, $Res> get selectedPosition;
  @override
  $UIStateCopyWith<LocationResultEntity, $Res> get selectedLocation;
}

/// @nodoc
class __$$PickLocationStateImplCopyWithImpl<$Res>
    extends _$PickLocationStateCopyWithImpl<$Res, _$PickLocationStateImpl>
    implements _$$PickLocationStateImplCopyWith<$Res> {
  __$$PickLocationStateImplCopyWithImpl(_$PickLocationStateImpl _value,
      $Res Function(_$PickLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPosition = null,
    Object? selectedLocation = null,
  }) {
    return _then(_$PickLocationStateImpl(
      selectedPosition: null == selectedPosition
          ? _value.selectedPosition
          : selectedPosition // ignore: cast_nullable_to_non_nullable
              as UIState<Position>,
      selectedLocation: null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as UIState<LocationResultEntity>,
    ));
  }
}

/// @nodoc

class _$PickLocationStateImpl implements _PickLocationState {
  const _$PickLocationStateImpl(
      {this.selectedPosition = const UIState.idle(),
      this.selectedLocation = const UIState.idle()});

  @override
  @JsonKey()
  final UIState<Position> selectedPosition;
  @override
  @JsonKey()
  final UIState<LocationResultEntity> selectedLocation;

  @override
  String toString() {
    return 'PickLocationState(selectedPosition: $selectedPosition, selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickLocationStateImpl &&
            (identical(other.selectedPosition, selectedPosition) ||
                other.selectedPosition == selectedPosition) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedPosition, selectedLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickLocationStateImplCopyWith<_$PickLocationStateImpl> get copyWith =>
      __$$PickLocationStateImplCopyWithImpl<_$PickLocationStateImpl>(
          this, _$identity);
}

abstract class _PickLocationState implements PickLocationState {
  const factory _PickLocationState(
          {final UIState<Position> selectedPosition,
          final UIState<LocationResultEntity> selectedLocation}) =
      _$PickLocationStateImpl;

  @override
  UIState<Position> get selectedPosition;
  @override
  UIState<LocationResultEntity> get selectedLocation;
  @override
  @JsonKey(ignore: true)
  _$$PickLocationStateImplCopyWith<_$PickLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
