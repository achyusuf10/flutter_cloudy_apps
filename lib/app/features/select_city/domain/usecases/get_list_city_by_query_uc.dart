import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListCityByQueryUC
    extends UseCase<List<LocationResultEntity>, GetListCityByQueryParams> {
  @override
  Future<DataState<List<LocationResultEntity>>> call(params) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetListCityByQueryParams {
  final String query;

  GetListCityByQueryParams({required this.query});
}
