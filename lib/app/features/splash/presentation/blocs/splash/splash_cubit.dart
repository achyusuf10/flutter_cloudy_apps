import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudy/config/routes/routes.dart';
import 'package:cloudy/utils/functions/get_context_func.dart';
import 'package:cloudy/utils/services/dialog_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@lazySingleton
class SplashCubit extends Cubit<SplashState> {
  final GetContextFunc _getContext;
  final DialogService _dialogService;
  SplashCubit(
    this._getContext,
    this._dialogService,
  ) : super(const SplashState.initial()) {
    _onInit();
  }

  Future<void> _onInit() async {
    Future.delayed(const Duration(seconds: 2));
    var request = await Geolocator.requestPermission();
    if (request == LocationPermission.deniedForever) {
      _dialogService.dialogProblem(
        desc:
            'Location Must Be Allowed, Please Allow Location Permission From Settings',
      );
      return;
    }
    if (request == LocationPermission.denied) {
      await _onInit();
      return;
    }
    _getContext.i.router.replaceNamed(Routes.homePage);
  }
}
