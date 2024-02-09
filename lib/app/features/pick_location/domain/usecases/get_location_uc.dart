import 'package:cloudy/app/features/select_area/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLocationUC extends UseCase<LocationResultEntity, GetLocationParams> {
  final LocationRepository _locationRepository;

  GetLocationUC(this._locationRepository);
  @override

  /// Calls the [getLocationDetail] method of the location repository to retrieve the location details.
  ///
  /// The [params] parameter should contain the latitude and longitude of the location.
  /// Returns a [Future] that resolves to a [DataState] containing the [LocationResultEntity].
  Future<DataState<LocationResultEntity>> call(params) async {
    return await _locationRepository.getLocationDetail(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class GetLocationParams {
  final double latitude;
  final double longitude;

  GetLocationParams(this.latitude, this.longitude);
}
