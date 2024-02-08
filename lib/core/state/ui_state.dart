import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UIState<T> with _$UIState<T> {
  const factory UIState.success({required T data}) = UIStateSuccess<T>;
  const factory UIState.empty({
    @Default('Sorry, your data is not available') String message,
  }) = UIStateEmpty<T>;
  const factory UIState.loading() = UIStateLoading<T>;
  const factory UIState.error({
    @Default('Upps, please try again') String message,
  }) = UIStateError<T>;
  const factory UIState.idle() = UIStateIdle<T>;
}
