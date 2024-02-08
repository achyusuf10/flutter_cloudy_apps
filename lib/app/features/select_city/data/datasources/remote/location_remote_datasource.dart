import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRemoteDataSource {
  Future<DataState<List<LocationResultEntity>>> searchLocation({
    required String query,
  });

  Future<DataState<Position>> getUserPosition();

  Future<DataState<LocationResultEntity>> getLocationDetail({
    required double latitude,
    required double longitude,
  });
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  @override
  Future<DataState<LocationResultEntity>> getLocationDetail(
      {required double latitude, required double longitude}) async {
    try {
      var placemarkEachItems = await placemarkFromCoordinates(
        latitude,
        longitude,
        localeIdentifier: 'id_ind',
      );
      var result = LocationResultEntity.initial();
      result = result.copyWith(
        latitude: latitude,
        longitude: longitude,
      );
      if ((placemarkEachItems.first.locality ?? '').isNotEmpty) {
        result = result.copyWith(locality: placemarkEachItems.first.locality);
      }
      if ((placemarkEachItems.first.subAdministrativeArea ?? '').isNotEmpty) {
        result = result.copyWith(
            subAdministrativeArea:
                placemarkEachItems.first.subAdministrativeArea);
      }
      if ((placemarkEachItems.first.administrativeArea ?? '').isNotEmpty) {
        result = result.copyWith(
            administrativeArea: placemarkEachItems.first.administrativeArea);
      }
      if ((placemarkEachItems.first.country ?? '').isNotEmpty) {
        result = result.copyWith(country: placemarkEachItems.first.country);
      }

      return DataState.success(data: result);
    } catch (e) {
      return DataState.error(
        message: 'Error : $e',
        exception: Exception(e),
      );
    }
  }

  @override
  Future<DataState<Position>> getUserPosition() async {
    try {
      var currentPosition = await Geolocator.getCurrentPosition();
      return DataState.success(data: currentPosition);
    } catch (e, stackTrace) {
      return DataState.error(
        message: 'Error : $e',
        stackTrace: stackTrace,
        exception: Exception(e),
      );
    }
  }

  @override
  Future<DataState<List<LocationResultEntity>>> searchLocation(
      {required String query}) async {
    try {
      List<LocationResultEntity> result = [];
      var resListLocation = await locationFromAddress(
        query,
        localeIdentifier: 'id_ind',
      );
      for (var item in resListLocation) {
        var resItemLocation = await getLocationDetail(
          latitude: item.latitude,
          longitude: item.longitude,
        );
        resItemLocation.when(
          success: (data) {
            result.add(data);
          },
          error: (message, __, ___, e, _____) {
            throw e ?? Exception(message);
          },
        );
      }
      return DataState.success(data: result);
    } catch (e, stackTrace) {
      return DataState.error(
        message: 'Error : $e',
        stackTrace: stackTrace,
        exception: Exception(e),
      );
    }
  }
}
