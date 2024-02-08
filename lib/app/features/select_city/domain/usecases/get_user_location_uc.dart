import 'package:cloudy/app/features/select_city/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
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
  Future<DataState<LocationResultEntity>> call() async {
    var resPosition = await _locationRepository.getUserPosition();

    return await resPosition.when(
      success: (position) async {
        AppLogger.logData(position.toString());
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
