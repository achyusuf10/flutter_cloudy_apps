import 'package:cloudy/app/features/select_area/data/datasources/remote/location_remote_datasource.dart';
import 'package:cloudy/app/features/select_area/domain/repositories/location_repository.dart';
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
    var res = await _remoteDataSource.getLocationDetail(
      latitude: latitude,
      longitude: longitude,
    );

    return res.map(
      success: (success) {
        var result = LocationResultEntity.initial();
        result = result.copyWith(
          latitude: latitude,
          longitude: longitude,
        );
        if ((success.data.locality ?? '').isNotEmpty) {
          result = result.copyWith(locality: success.data.locality);
        }
        if ((success.data.subAdministrativeArea ?? '').isNotEmpty) {
          result = result.copyWith(
              subAdministrativeArea: success.data.subAdministrativeArea);
        }
        if ((success.data.administrativeArea ?? '').isNotEmpty) {
          result = result.copyWith(
              administrativeArea: success.data.administrativeArea);
        }
        if ((success.data.country ?? '').isNotEmpty) {
          result = result.copyWith(country: success.data.country);
        }
        return DataState.success(
          data: result,
        );
      },
      error: (error) {
        return DataState.error(
          message: error.message,
          exception: error.exception,
          stackTrace: error.stackTrace,
        );
      },
    );
  }

  @override
  Future<DataState<Position>> getUserPosition() async {
    return await _remoteDataSource.getUserPosition();
  }

  @override
  Future<DataState<List<LocationResultEntity>>> searchLocation(
      {required String query}) async {
    var res = await _remoteDataSource.searchLocation(query: query);

    return res.map(
      success: (success) {
        var result = <LocationResultEntity>[];

        for (var element in success.data) {
          var placeMark = element.placemark;
          var location = element.location;
          var entity = LocationResultEntity.initial();
          entity = entity.copyWith(
            latitude: location.latitude,
            longitude: location.longitude,
          );

          if ((placeMark.locality ?? '').isNotEmpty) {
            entity = entity.copyWith(locality: placeMark.locality);
          }
          if ((placeMark.subAdministrativeArea ?? '').isNotEmpty) {
            entity = entity.copyWith(
                subAdministrativeArea: placeMark.subAdministrativeArea);
          }
          if ((placeMark.administrativeArea ?? '').isNotEmpty) {
            entity = entity.copyWith(
                administrativeArea: placeMark.administrativeArea);
          }
          if ((placeMark.country ?? '').isNotEmpty) {
            entity = entity.copyWith(country: placeMark.country);
          }
          result.add(entity);
        }

        return DataState.success(
          data: result,
        );
      },
      error: (error) {
        return DataState.error(
          message: error.message,
          exception: error.exception,
          stackTrace: error.stackTrace,
        );
      },
    );
  }
}
