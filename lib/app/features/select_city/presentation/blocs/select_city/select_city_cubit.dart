import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/get_history_city_uc.dart';
import 'package:cloudy/app/features/select_city/domain/usecases/get_list_city_by_query_uc.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_context_func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'select_city_cubit.freezed.dart';
part 'select_city_state.dart';

@lazySingleton
class SelectCityCubit extends Cubit<SelectCityState> {
  final GetHistoryCityUC _getHistoryCityUC;
  final GetListCityByQueryUC _getListCityByQueryUC;
  final GetContextFunc _getContextFunc;

  SelectCityCubit(
    this._getHistoryCityUC,
    this._getListCityByQueryUC,
    this._getContextFunc,
  ) : super(const SelectCityState()) {
    _onStarted();
  }

  Future<void> _onStarted() async {
    emit(state.copyWith(
      stateDataCity: const UIState.loading(),
      stateDataLocation: const UIState.idle(),
    ));
    var res = await _getHistoryCityUC.call();
    res.when(
      success: (listData) {
        if (listData.isEmpty) {
          emit(state.copyWith(
            stateDataCity: const UIState.empty(),
            stateDataLocation: const UIState.idle(),
          ));
          return;
        }
        emit(state.copyWith(
          stateDataCity: UIState.success(data: listData),
          stateDataLocation: const UIState.idle(),
        ));
      },
      error: (_, __, ___, ____, _____) {
        emit(state.copyWith(
          stateDataCity: UIState.error(message: _),
          stateDataLocation: const UIState.idle(),
        ));
      },
    );
  }

  void onChangeTextField(String? value) {
    if ((value ?? '').isEmpty) {
      emit(state.copyWith(
        stateDataLocation: const UIState.idle(),
      ));
      return;
    }
  }

  Future<void> onSubmitQuery(String? query) async {
    emit(state.copyWith(
      stateDataLocation: const UIState.loading(),
    ));
    var res = await _getListCityByQueryUC.call(
      GetListCityByQueryParams(
        query: query ?? '',
      ),
    );
    res.when(
      success: (listData) {
        if (listData.isEmpty) {
          emit(state.copyWith(
            stateDataLocation: const UIState.empty(),
          ));
          return;
        }
        emit(state.copyWith(
          stateDataLocation: UIState.success(data: listData),
        ));
      },
      error: (_, __, ___, ____, _____) {
        emit(state.copyWith(
          stateDataLocation: UIState.error(message: _),
        ));
      },
    );
  }

  Future<void> onTapLocation(LocationResultEntity value) async {
    _getContextFunc.i.router.pop<LocationResultEntity>(value);
  }

  Future<void> onTapCity(CityEntity value) async {
    _getContextFunc.i.router.pop<CityEntity>(value);
  }
}
