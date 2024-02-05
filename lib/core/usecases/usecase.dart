import 'package:cloudy/core/state/data_state.dart';

abstract class UseCase<ReturnSuccessType, Params> {
  const UseCase();
  Future<DataState<ReturnSuccessType>> call(Params params);
}
