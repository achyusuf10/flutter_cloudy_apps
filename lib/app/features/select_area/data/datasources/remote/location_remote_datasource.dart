import 'dart:async';

import 'package:cloudy/app/features/select_area/data/models/res_search_location.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRemoteDataSource {
  Future<DataState<List<ResSearchLocation>>> searchLocation({
    required String query,
  });

  Future<DataState<Position>> getUserPosition();

  Future<DataState<Placemark>> getLocationDetail({
    required double latitude,
    required double longitude,
  });
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  @override
  Future<DataState<Placemark>> getLocationDetail(
      {required double latitude, required double longitude}) async {
    try {
      var placemarkEachItems = await placemarkFromCoordinates(
        latitude,
        longitude,
        localeIdentifier: 'id_ind',
      );

      return DataState.success(data: placemarkEachItems.first);
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
      var currentPosition = await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 10),
      );

      return DataState.success(data: currentPosition);
    } on TimeoutException catch (e) {
      return DataState.error(
        message: 'Get Location Time Out, Please try again',
        stackTrace: StackTrace.current,
        exception: Exception(e),
      );
    } catch (e, stackTrace) {
      return DataState.error(
        message: 'Error : $e',
        stackTrace: stackTrace,
        exception: Exception(e),
      );
    }
  }

  @override
  Future<DataState<List<ResSearchLocation>>> searchLocation(
      {required String query}) async {
    try {
      List<ResSearchLocation> result = [];
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
            result.add(ResSearchLocation(
              location: item,
              placemark: data,
            ));
          },
          error: (message, __, ___, e, _____) {
            throw e ?? Exception(message);
          },
        );
      }
      return DataState.success(data: result);
    } catch (e, stackTrace) {
      if (e.toString().contains('Could not find any result')) {
        return const DataState.success(
          data: [],
        );
      }
      return DataState.error(
        message: 'Error : $e',
        stackTrace: stackTrace,
        exception: Exception(e),
      );
    }
  }
}
