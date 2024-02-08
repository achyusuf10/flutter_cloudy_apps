import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveCityUC extends UseCase<String, SaveCityUseParams> {
  @override
  Future<DataState<String>> call(SaveCityUseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class SaveCityUseParams {}
