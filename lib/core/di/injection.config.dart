// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weateher_uc.dart'
    as _i5;
import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart'
    as _i16;
import 'package:cloudy/app/features/select_city/data/datasources/remote/location_remote_datasource.dart'
    as _i9;
import 'package:cloudy/app/features/select_city/data/repositories/location_repository_impl.dart'
    as _i11;
import 'package:cloudy/app/features/select_city/domain/repositories/location_repository.dart'
    as _i10;
import 'package:cloudy/app/features/select_city/domain/usecases/get_history_city_uc.dart'
    as _i6;
import 'package:cloudy/app/features/select_city/domain/usecases/get_list_city_by_query_uc.dart'
    as _i7;
import 'package:cloudy/app/features/select_city/domain/usecases/get_user_location_uc.dart'
    as _i15;
import 'package:cloudy/app/features/select_city/domain/usecases/save_city_uc.dart'
    as _i12;
import 'package:cloudy/app/features/select_city/presentation/blocs/select_city/select_city_cubit.dart'
    as _i13;
import 'package:cloudy/app/features/splash/presentation/blocs/splash/splash_cubit.dart'
    as _i17;
import 'package:cloudy/config/routes/app_router.dart' as _i3;
import 'package:cloudy/config/source_config/local/hive_config.dart' as _i8;
import 'package:cloudy/core/di/module/injection_module.dart' as _i18;
import 'package:cloudy/utils/functions/get_context_func.dart' as _i4;
import 'package:cloudy/utils/services/dialog_service.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModules = _$InjectionModules();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.GetContextFunc>(
      () => _i4.GetContextFunc(gh<_i3.AppRouter>()));
  gh.lazySingleton<_i5.GetForecastWeatherUC>(() => _i5.GetForecastWeatherUC());
  gh.lazySingleton<_i6.GetHistoryCityUC>(() => _i6.GetHistoryCityUC());
  gh.lazySingleton<_i7.GetListCityByQueryUC>(() => _i7.GetListCityByQueryUC());
  await gh.lazySingletonAsync<_i8.HiveConfig>(
    () => injectionModules.boxClient,
    preResolve: true,
  );
  gh.lazySingleton<_i9.LocationRemoteDataSource>(
      () => _i9.LocationRemoteDataSourceImpl());
  gh.lazySingleton<_i10.LocationRepository>(
      () => _i11.LocationRepositoryImpl(gh<_i9.LocationRemoteDataSource>()));
  gh.lazySingleton<_i12.SaveCityUC>(() => _i12.SaveCityUC());
  gh.lazySingleton<_i13.SelectCityCubit>(() => _i13.SelectCityCubit(
        gh<_i12.SaveCityUC>(),
        gh<_i6.GetHistoryCityUC>(),
        gh<_i7.GetListCityByQueryUC>(),
      ));
  gh.lazySingleton<_i14.DialogService>(
      () => _i14.DialogService(gh<_i4.GetContextFunc>()));
  gh.lazySingleton<_i15.GetUserLocationUC>(
      () => _i15.GetUserLocationUC(gh<_i10.LocationRepository>()));
  gh.lazySingleton<_i16.HomeBloc>(() => _i16.HomeBloc(
        gh<_i5.GetForecastWeatherUC>(),
        gh<_i12.SaveCityUC>(),
        gh<_i15.GetUserLocationUC>(),
      ));
  gh.lazySingleton<_i17.SplashCubit>(() => _i17.SplashCubit(
        gh<_i4.GetContextFunc>(),
        gh<_i14.DialogService>(),
      ));
  return getIt;
}

class _$InjectionModules extends _i18.InjectionModules {}
