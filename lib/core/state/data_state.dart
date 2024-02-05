import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.success({required T data}) = DataStateSuccess<T>;
  const factory DataState.error({
    required String message,
    T? data,
    int? code,
    Exception? exception,
    StackTrace? stackTrace,
  }) = DataStateError<T>;
}
