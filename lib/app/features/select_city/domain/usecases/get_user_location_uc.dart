import 'package:cloudy/app/features/select_city/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/no_params_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLocationUC extends NoParamsUseCase<LocationResultEntity> {
  final LocationRepository _locationRepository;

  GetUserLocationUC(
    this._locationRepository,
  );
  @override

  /// Retrieves the user's location and returns the detailed location information.
  ///
  /// This method calls the [_locationRepository.getUserPosition()] method to get the user's position.
  /// If the position retrieval is successful, it calls the [_locationRepository.getLocationDetail()] method
  /// with the latitude and longitude parameters to get the detailed location information.
  /// If any error occurs during the process, it returns a [DataState.error] object with the error message and exception.
  ///
  /// Returns a [Future] that resolves to a [DataState<LocationResultEntity>] object.
  Future<DataState<LocationResultEntity>> call() async {
    var resPosition = await _locationRepository.getUserPosition();
    return await resPosition.when(
      success: (position) async {
        return await _locationRepository.getLocationDetail(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      },
      error: (error, _, __, e, ___) {
        return DataState.error(
          message: error,
          exception: e,
        );
      },
    );
  }
}
