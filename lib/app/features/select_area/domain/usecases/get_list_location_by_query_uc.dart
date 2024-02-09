import 'package:cloudy/app/features/select_area/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListLocationByQueryUC
    extends UseCase<List<LocationResultEntity>, GetListLocationByQueryParams> {
  final LocationRepository _locationRepository;

  GetListLocationByQueryUC(this._locationRepository);
  @override

  /// Calls the location repository to search for locations based on the provided query.
  ///
  /// Returns a [Future] that resolves to a [DataState] containing a list of [LocationResultEntity].
  /// The [params] argument is used to specify the query for the location search.

  Future<DataState<List<LocationResultEntity>>> call(params) async {
    return _locationRepository.searchLocation(query: params.query);
  }
}

class GetListLocationByQueryParams {
  final String query;

  GetListLocationByQueryParams({required this.query});
}
