import 'package:cloudy/app/features/select_city/data/datasources/remote/location_remote_datasource.dart';
import 'package:cloudy/app/features/select_city/domain/repositories/location_repository.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  final LocationRemoteDataSource _remoteDataSource;

  LocationRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<LocationResultEntity>> getLocationDetail(
      {required double latitude, required double longitude}) async {
    return await _remoteDataSource.getLocationDetail(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Future<DataState<Position>> getUserPosition() async {
    return await _remoteDataSource.getUserPosition();
  }

  @override
  Future<DataState<List<LocationResultEntity>>> searchLocation(
      {required String query}) async {
    return await _remoteDataSource.searchLocation(query: query);
  }
}
