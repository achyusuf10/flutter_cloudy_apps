import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UIState<T> with _$UIState<T> {
  const factory UIState.success({required T data}) = UIStateSuccess<T>;
  const factory UIState.empty({
    @Default('Maaf, saat ini data kamu tidak tersedia') String message,
  }) = UIStateEmpty<T>;
  const factory UIState.loading() = UIStateLoading<T>;
  const factory UIState.error({
    @Default('Terjadi Kesalahan, Silahkan Coba Lagi') String message,
  }) = UIStateError<T>;
  const factory UIState.idle() = UIStateIdle<T>;
}
