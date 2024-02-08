import 'package:cloudy/config/source_config/local/hive_config.dart';
import 'package:cloudy/config/source_config/local/hive_config_impl.dart';
import 'package:cloudy/config/source_config/remote/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModules {
  @lazySingleton
  @preResolve
  Future<HiveConfig> get boxClient => HiveConfigImpl.instance();

  @lazySingleton
  Dio get dio => DioConfig.call();
}
