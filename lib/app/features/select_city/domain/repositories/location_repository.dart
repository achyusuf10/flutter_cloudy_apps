import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<DataState<List<LocationResultEntity>>> searchLocation({
    required String query,
  });

  Future<DataState<Position>> getUserPosition();

  Future<DataState<LocationResultEntity>> getLocationDetail({
    required double latitude,
    required double longitude,
  });
}
