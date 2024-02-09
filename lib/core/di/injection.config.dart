// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloudy/app/features/home/data/datasources/local/weather_local_datasource.dart'
    as _i10;
import 'package:cloudy/app/features/home/data/datasources/remote/weather_remote_datasource.dart'
    as _i11;
import 'package:cloudy/app/features/home/data/repositories/weather_repository_impl.dart'
    as _i13;
import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart'
    as _i12;
import 'package:cloudy/app/features/home/domain/usecases/add_area_to_local_uc.dart'
    as _i14;
import 'package:cloudy/app/features/home/domain/usecases/get_current_city_weather_uc.dart'
    as _i16;
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weather_uc.dart'
    as _i17;
import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart'
    as _i22;
import 'package:cloudy/app/features/pick_location/domain/usecases/get_location_uc.dart'
    as _i20;
import 'package:cloudy/app/features/pick_location/presentation/blocs/pick_location/pick_location_cubit.dart'
    as _i23;
import 'package:cloudy/app/features/select_area/data/datasources/remote/location_remote_datasource.dart'
    as _i7;
import 'package:cloudy/app/features/select_area/data/repositories/location_repository_impl.dart'
    as _i9;
import 'package:cloudy/app/features/select_area/domain/repositories/location_repository.dart'
    as _i8;
import 'package:cloudy/app/features/select_area/domain/usecases/get_history_weather_area_uc.dart'
    as _i18;
import 'package:cloudy/app/features/select_area/domain/usecases/get_list_location_by_query_uc.dart'
    as _i19;
import 'package:cloudy/app/features/select_area/domain/usecases/get_user_location_uc.dart'
    as _i21;
import 'package:cloudy/app/features/select_area/presentation/blocs/select_area/select_area_cubit.dart'
    as _i24;
import 'package:cloudy/app/features/splash/presentation/blocs/splash/splash_cubit.dart'
    as _i25;
import 'package:cloudy/config/routes/app_router.dart' as _i3;
import 'package:cloudy/config/source_config/local/hive_config.dart' as _i6;
import 'package:cloudy/core/di/module/injection_module.dart' as _i26;
import 'package:cloudy/utils/functions/get_context_func.dart' as _i5;
import 'package:cloudy/utils/services/dialog_service.dart' as _i15;
import 'package:dio/dio.dart' as _i4;
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
  gh.lazySingleton<_i4.Dio>(() => injectionModules.dio);
  gh.lazySingleton<_i5.GetContextFunc>(
      () => _i5.GetContextFunc(gh<_i3.AppRouter>()));
  await gh.lazySingletonAsync<_i6.HiveConfig>(
    () => injectionModules.boxClient,
    preResolve: true,
  );
  gh.lazySingleton<_i7.LocationRemoteDataSource>(
      () => _i7.LocationRemoteDataSourceImpl());
  gh.lazySingleton<_i8.LocationRepository>(
      () => _i9.LocationRepositoryImpl(gh<_i7.LocationRemoteDataSource>()));
  gh.lazySingleton<_i10.WeatherLocalDataSource>(
      () => _i10.WeatherLocalDataSourceImpl(gh<_i6.HiveConfig>()));
  gh.lazySingleton<_i11.WeatherRemoteDataSource>(
      () => _i11.WeatherRemoteDataSourceImpl(gh<_i4.Dio>()));
  gh.lazySingleton<_i12.WeatherRepository>(() => _i13.WeatherRepositoryImpl(
        gh<_i10.WeatherLocalDataSource>(),
        gh<_i11.WeatherRemoteDataSource>(),
      ));
  gh.lazySingleton<_i14.AddAreaToLocalUC>(
      () => _i14.AddAreaToLocalUC(gh<_i12.WeatherRepository>()));
  gh.lazySingleton<_i15.DialogService>(
      () => _i15.DialogService(gh<_i5.GetContextFunc>()));
  gh.lazySingleton<_i16.GetCurrentCityWeatherUC>(
      () => _i16.GetCurrentCityWeatherUC(gh<_i12.WeatherRepository>()));
  gh.lazySingleton<_i17.GetForecastWeatherUC>(
      () => _i17.GetForecastWeatherUC(gh<_i12.WeatherRepository>()));
  gh.lazySingleton<_i18.GetHistoryWeatherByAreaUC>(
      () => _i18.GetHistoryWeatherByAreaUC(gh<_i12.WeatherRepository>()));
  gh.lazySingleton<_i19.GetListLocationByQueryUC>(
      () => _i19.GetListLocationByQueryUC(gh<_i8.LocationRepository>()));
  gh.lazySingleton<_i20.GetLocationUC>(
      () => _i20.GetLocationUC(gh<_i8.LocationRepository>()));
  gh.lazySingleton<_i21.GetUserLocationUC>(
      () => _i21.GetUserLocationUC(gh<_i8.LocationRepository>()));
  gh.lazySingleton<_i22.HomeBloc>(() => _i22.HomeBloc(
        gh<_i17.GetForecastWeatherUC>(),
        gh<_i14.AddAreaToLocalUC>(),
        gh<_i21.GetUserLocationUC>(),
        gh<_i16.GetCurrentCityWeatherUC>(),
        gh<_i5.GetContextFunc>(),
      ));
  gh.lazySingleton<_i23.PickLocationCubit>(() => _i23.PickLocationCubit(
        gh<_i21.GetUserLocationUC>(),
        gh<_i20.GetLocationUC>(),
      ));
  gh.lazySingleton<_i24.SelectAreaCubit>(() => _i24.SelectAreaCubit(
        gh<_i18.GetHistoryWeatherByAreaUC>(),
        gh<_i19.GetListLocationByQueryUC>(),
        gh<_i5.GetContextFunc>(),
      ));
  gh.lazySingleton<_i25.SplashCubit>(() => _i25.SplashCubit(
        gh<_i5.GetContextFunc>(),
        gh<_i15.DialogService>(),
      ));
  return getIt;
}

class _$InjectionModules extends _i26.InjectionModules {}
