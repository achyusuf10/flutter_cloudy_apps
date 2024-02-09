import 'dart:convert';

import 'package:cloudy/config/source_config/local/hive_config.dart';
import 'package:cloudy/constants/core/hive_const.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:injectable/injectable.dart';

abstract class WeatherLocalDataSource {
  Future<DataState<String>> saveWeatherByArea(List<Map<String, dynamic>> data);

  Future<DataState<List<Map<String, dynamic>>>> getWeatherByArea();
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final HiveConfig _hive;

  WeatherLocalDataSourceImpl(this._hive);

  @override
  Future<DataState<String>> saveWeatherByArea(
      List<Map<String, dynamic>> data) async {
    try {
      await _hive.set(
        key: HiveConst.keyWeatherByCity,
        data: data.map((e) => jsonEncode(e)).toList(),
      );
      return const DataState.success(data: 'success');
    } catch (e, stackTrace) {
      return DataState.error(
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<DataState<List<Map<String, dynamic>>>> getWeatherByArea() async {
    try {
      var resList = await _hive.get(
        key: HiveConst.keyWeatherByCity,
      );

      if (resList == null) {
        return const DataState.success(
          data: [],
        );
      }

      List<Map<String, dynamic>> resData = (resList as List)
          .map(
            (e) => jsonDecode(e as String) as Map<String, dynamic>,
          )
          .toList();
      return DataState.success(
        data: resData,
      );
    } catch (e, stackTrace) {
      AppLogger.logData(e.toString());
      return DataState.error(
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }
}
