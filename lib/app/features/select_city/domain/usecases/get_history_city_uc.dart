import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/core/usecases/no_params_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHistoryCityUC extends NoParamsUseCase<List<CityEntity>> {
  @override
  Future<DataState<List<CityEntity>>> call() async {
    return DataState.success(
      data: [
        CityEntity.initial(),
        CityEntity.initial(),
        CityEntity.initial(),
      ],
    );
  }
}
