// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloudy/app/features/splash/presentation/blocs/splash/splash_cubit.dart'
    as _i7;
import 'package:cloudy/config/routes/app_router.dart' as _i3;
import 'package:cloudy/config/source_config/local/hive_config.dart' as _i5;
import 'package:cloudy/core/di/module/injection_module.dart' as _i8;
import 'package:cloudy/utils/functions/get_context_func.dart' as _i4;
import 'package:cloudy/utils/services/dialog_service.dart' as _i6;
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
  await gh.lazySingletonAsync<_i5.HiveConfig>(
    () => injectionModules.boxClient,
    preResolve: true,
  );
  gh.lazySingleton<_i6.DialogService>(
      () => _i6.DialogService(gh<_i4.GetContextFunc>()));
  gh.lazySingleton<_i7.SplashCubit>(() => _i7.SplashCubit(
        gh<_i4.GetContextFunc>(),
        gh<_i6.DialogService>(),
      ));
  return getIt;
}

class _$InjectionModules extends _i8.InjectionModules {}
