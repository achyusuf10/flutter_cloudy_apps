import 'package:cloudy/app/features/select_city/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListCityByQueryUC
    extends UseCase<List<LocationResultEntity>, GetListCityByQueryParams> {
  final LocationRepository _locationRepository;

  GetListCityByQueryUC(this._locationRepository);
  @override

  /// Calls the [_locationRepository.searchLocation] method to retrieve a list of [LocationResultEntity] objects based on the provided query.
  ///
  /// The [params] parameter is used to pass the query string.
  /// Returns a [Future] that resolves to a [DataState] containing a list of [LocationResultEntity] objects.
  Future<DataState<List<LocationResultEntity>>> call(params) async {
    return _locationRepository.searchLocation(query: params.query);
  }
}

class GetListCityByQueryParams {
  final String query;

  GetListCityByQueryParams({required this.query});
}
