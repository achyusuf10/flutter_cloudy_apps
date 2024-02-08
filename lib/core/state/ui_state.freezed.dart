// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UIState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStateCopyWith<T, $Res> {
  factory $UIStateCopyWith(UIState<T> value, $Res Function(UIState<T>) then) =
      _$UIStateCopyWithImpl<T, $Res, UIState<T>>;
}

/// @nodoc
class _$UIStateCopyWithImpl<T, $Res, $Val extends UIState<T>>
    implements $UIStateCopyWith<T, $Res> {
  _$UIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UIStateSuccessImplCopyWith<T, $Res> {
  factory _$$UIStateSuccessImplCopyWith(_$UIStateSuccessImpl<T> value,
          $Res Function(_$UIStateSuccessImpl<T>) then) =
      __$$UIStateSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$UIStateSuccessImplCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UIStateSuccessImpl<T>>
    implements _$$UIStateSuccessImplCopyWith<T, $Res> {
  __$$UIStateSuccessImplCopyWithImpl(_$UIStateSuccessImpl<T> _value,
      $Res Function(_$UIStateSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$UIStateSuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UIStateSuccessImpl<T> implements UIStateSuccess<T> {
  const _$UIStateSuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'UIState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIStateSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UIStateSuccessImplCopyWith<T, _$UIStateSuccessImpl<T>> get copyWith =>
      __$$UIStateSuccessImplCopyWithImpl<T, _$UIStateSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UIStateSuccess<T> implements UIState<T> {
  const factory UIStateSuccess({required final T data}) =
      _$UIStateSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$UIStateSuccessImplCopyWith<T, _$UIStateSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UIStateEmptyImplCopyWith<T, $Res> {
  factory _$$UIStateEmptyImplCopyWith(_$UIStateEmptyImpl<T> value,
          $Res Function(_$UIStateEmptyImpl<T>) then) =
      __$$UIStateEmptyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UIStateEmptyImplCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UIStateEmptyImpl<T>>
    implements _$$UIStateEmptyImplCopyWith<T, $Res> {
  __$$UIStateEmptyImplCopyWithImpl(
      _$UIStateEmptyImpl<T> _value, $Res Function(_$UIStateEmptyImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UIStateEmptyImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UIStateEmptyImpl<T> implements UIStateEmpty<T> {
  const _$UIStateEmptyImpl(
      {this.message = 'Sorry, your data is not available'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UIState<$T>.empty(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIStateEmptyImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UIStateEmptyImplCopyWith<T, _$UIStateEmptyImpl<T>> get copyWith =>
      __$$UIStateEmptyImplCopyWithImpl<T, _$UIStateEmptyImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) {
    return empty(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) {
    return empty?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class UIStateEmpty<T> implements UIState<T> {
  const factory UIStateEmpty({final String message}) = _$UIStateEmptyImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$UIStateEmptyImplCopyWith<T, _$UIStateEmptyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UIStateLoadingImplCopyWith<T, $Res> {
  factory _$$UIStateLoadingImplCopyWith(_$UIStateLoadingImpl<T> value,
          $Res Function(_$UIStateLoadingImpl<T>) then) =
      __$$UIStateLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UIStateLoadingImplCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UIStateLoadingImpl<T>>
    implements _$$UIStateLoadingImplCopyWith<T, $Res> {
  __$$UIStateLoadingImplCopyWithImpl(_$UIStateLoadingImpl<T> _value,
      $Res Function(_$UIStateLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIStateLoadingImpl<T> implements UIStateLoading<T> {
  const _$UIStateLoadingImpl();

  @override
  String toString() {
    return 'UIState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIStateLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UIStateLoading<T> implements UIState<T> {
  const factory UIStateLoading() = _$UIStateLoadingImpl<T>;
}

/// @nodoc
abstract class _$$UIStateErrorImplCopyWith<T, $Res> {
  factory _$$UIStateErrorImplCopyWith(_$UIStateErrorImpl<T> value,
          $Res Function(_$UIStateErrorImpl<T>) then) =
      __$$UIStateErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UIStateErrorImplCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UIStateErrorImpl<T>>
    implements _$$UIStateErrorImplCopyWith<T, $Res> {
  __$$UIStateErrorImplCopyWithImpl(
      _$UIStateErrorImpl<T> _value, $Res Function(_$UIStateErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UIStateErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UIStateErrorImpl<T> implements UIStateError<T> {
  const _$UIStateErrorImpl({this.message = 'Upps, please try again'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UIState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIStateErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UIStateErrorImplCopyWith<T, _$UIStateErrorImpl<T>> get copyWith =>
      __$$UIStateErrorImplCopyWithImpl<T, _$UIStateErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UIStateError<T> implements UIState<T> {
  const factory UIStateError({final String message}) = _$UIStateErrorImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$UIStateErrorImplCopyWith<T, _$UIStateErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UIStateIdleImplCopyWith<T, $Res> {
  factory _$$UIStateIdleImplCopyWith(_$UIStateIdleImpl<T> value,
          $Res Function(_$UIStateIdleImpl<T>) then) =
      __$$UIStateIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UIStateIdleImplCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UIStateIdleImpl<T>>
    implements _$$UIStateIdleImplCopyWith<T, $Res> {
  __$$UIStateIdleImplCopyWithImpl(
      _$UIStateIdleImpl<T> _value, $Res Function(_$UIStateIdleImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIStateIdleImpl<T> implements UIStateIdle<T> {
  const _$UIStateIdleImpl();

  @override
  String toString() {
    return 'UIState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIStateIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) empty,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? empty,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? empty,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIStateSuccess<T> value) success,
    required TResult Function(UIStateEmpty<T> value) empty,
    required TResult Function(UIStateLoading<T> value) loading,
    required TResult Function(UIStateError<T> value) error,
    required TResult Function(UIStateIdle<T> value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIStateSuccess<T> value)? success,
    TResult? Function(UIStateEmpty<T> value)? empty,
    TResult? Function(UIStateLoading<T> value)? loading,
    TResult? Function(UIStateError<T> value)? error,
    TResult? Function(UIStateIdle<T> value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIStateSuccess<T> value)? success,
    TResult Function(UIStateEmpty<T> value)? empty,
    TResult Function(UIStateLoading<T> value)? loading,
    TResult Function(UIStateError<T> value)? error,
    TResult Function(UIStateIdle<T> value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class UIStateIdle<T> implements UIState<T> {
  const factory UIStateIdle() = _$UIStateIdleImpl<T>;
}
