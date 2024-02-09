import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudy/app/features/pick_location/domain/usecases/get_location_uc.dart';
import 'package:cloudy/app/features/select_area/domain/usecases/get_user_location_uc.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'pick_location_cubit.freezed.dart';
part 'pick_location_state.dart';

@lazySingleton
class PickLocationCubit extends Cubit<PickLocationState> {
  final GetUserLocationUC _getUserLocationUC;
  final GetLocationUC _getLocationUC;

  PickLocationCubit(this._getUserLocationUC, this._getLocationUC)
      : super(const PickLocationState()) {
    _onStart();
  }

  Future<void> _onStart() async {
    emit(state.copyWith(
      selectedLocation: const UIState.loading(),
      selectedPosition: const UIState.loading(),
    ));
    final result = await _getUserLocationUC();
    result.map(
      success: (success) {
        emit(
          state.copyWith(
            selectedPosition: UIState.success(
              data: _getPostion(
                success.data.latitude,
                success.data.longitude,
              ),
            ),
            selectedLocation: UIState.success(data: success.data),
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(
            selectedPosition: UIState.error(
              message: error.message,
            ),
            selectedLocation: UIState.error(
              message: error.message,
            ),
          ),
        );
      },
    );
  }

  Future<void> onRefresh() async {
    await _onStart();
  }

  Future<void> onTapMap(double lat, double long) async {
    emit(
      state.copyWith(
        selectedPosition: UIState.success(
          data: _getPostion(lat, long),
        ),
      ),
    );
    emit(
      state.copyWith(
        selectedLocation: const UIState.loading(),
      ),
    );
    final result = await _getLocationUC.call(
      GetLocationParams(
        lat,
        long,
      ),
    );
    result.map(
      success: (success) {
        emit(
          state.copyWith(
            selectedLocation: UIState.success(data: success.data),
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(
            selectedLocation: UIState.error(
              message: error.message,
            ),
          ),
        );
      },
    );
  }

  Future<void> onTapSelect(
    LocationResultEntity location,
    BuildContext context,
  ) async {
    context.router.pop(location);
  }

  Position _getPostion(double lat, double long) {
    return Position(
      latitude: lat,
      longitude: long,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );
  }
}
