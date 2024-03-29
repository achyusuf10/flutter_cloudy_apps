import 'package:cloudy/app/features/home/data/datasources/local/weather_local_datasource.dart';
import 'package:cloudy/app/features/home/data/datasources/remote/weather_remote_datasource.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_by_hours_entity.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/home/domain/repositories/weather_repository.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/core/state/data_state.dart';
import 'package:cloudy/utils/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherLocalDataSource _localDataSource;
  final WeatherRemoteDataSource _remoteDataSource;

  WeatherRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  @override
  Future<DataState<List<WeatherEntity>>> getListWeather(
      {required double latitude, required double longitude}) async {
    try {
      var result = await _remoteDataSource.getForecastWeather(
          latitude: latitude, longitude: longitude);

      return result.when(
        success: (data) {
          var datas = (data.forecast?.forecastday ?? [])
              .map(
                (e) => WeatherEntity(
                  date: e.date!,
                  listItem: (e.hour!)
                      .map(
                        (dataByHour) => WeatherByHoursEntity(
                          conditionCode: dataByHour.condition!.code!,
                          time: TimeOfDay.fromDateTime(
                            dataByHour.time!.extToDateTime(
                                originFormatDate: 'yyyy-MM-dd HH:mm'),
                          ),
                          condition: dataByHour.condition!.text!,
                          temperature: dataByHour.tempC!,
                          windPressure: dataByHour.windKph!,
                          uvIndex: dataByHour.uv!.toDouble(),
                          humidity: dataByHour.humidity!.toDouble(),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList();

          return DataState.success(
            data: datas,
          );
        },
        error: (message, _, statusCode, e, stackTrace) {
          return DataState.error(
              message: message,
              code: statusCode,
              exception: e,
              stackTrace: stackTrace);
        },
      );
    } catch (e, stackTrace) {
      return DataState.error(
          message: e.toString(),
          exception: Exception(e),
          stackTrace: stackTrace);
    }
  }

  @override
  Future<DataState<WeatherEntity>> getYesterdayWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var result = await _remoteDataSource.getHistoryWeather(
        latitude: latitude,
        longitude: longitude,
      );

      return result.when(
        success: (data) {
          var listItem = (data.forecast!.forecastday!.first)
              .hour!
              .map(
                (dataByHour) => WeatherByHoursEntity(
                  conditionCode: dataByHour.condition!.code!,
                  time: TimeOfDay.fromDateTime(
                    dataByHour.time!.extToDateTime(
                      originFormatDate: 'yyyy-MM-dd HH:mm',
                    ),
                  ),
                  condition: dataByHour.condition!.text!,
                  temperature: dataByHour.tempC!,
                  windPressure: dataByHour.windKph!,
                  uvIndex: dataByHour.uv!.toDouble(),
                  humidity: dataByHour.humidity!.toDouble(),
                ),
              )
              .toList();

          return DataState.success(
            data: WeatherEntity(
              date: (data.forecast!.forecastday!.first).date!,
              listItem: listItem,
            ),
          );
        },
        error: (message, _, statusCode, e, stackTrace) {
          return DataState.error(
              message: message,
              code: statusCode,
              exception: e,
              stackTrace: stackTrace);
        },
      );
    } catch (e, stackTrace) {
      return DataState.error(
          message: e.toString(),
          exception: Exception(e),
          stackTrace: stackTrace);
    }
  }

  @override
  Future<DataState<String>> saveWeatherByAreaToLocal({
    required List<AreaEntity> listArea,
  }) async {
    try {
      var data = listArea
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var res = await _localDataSource.saveWeatherByArea(
        data,
      );

      return res.when(
        success: (data) {
          return DataState.success(data: data);
        },
        error: (message, _, statusCode, e, stackTrace) {
          return DataState.error(
              message: message,
              code: statusCode,
              exception: e,
              stackTrace: stackTrace);
        },
      );
    } catch (e, stackTrace) {
      return DataState.error(
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<DataState<List<AreaEntity>>> getListWeatherByAreaFromLocal() async {
    try {
      var res = await _localDataSource.getWeatherByArea();
      return res.when(
        success: (listMap) {
          var listCity = listMap.map((e) => AreaEntity.fromJson(e)).toList();
          return DataState.success(data: listCity);
        },
        error: (message, _, statusCode, e, stackTrace) {
          return DataState.error(
              message: message,
              code: statusCode,
              exception: e,
              stackTrace: stackTrace);
        },
      );
    } catch (e, stackTrace) {
      return DataState.error(
        message: e.toString(),
        exception: Exception(e),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<DataState<String>> addWeatherByAreaToLocal({
    required AreaEntity areaEntity,
  }) async {
    var savedResult = await getListWeatherByAreaFromLocal();
    return savedResult.when(
      success: (listData) async {
        return await saveWeatherByAreaToLocal(
          listArea: [
            areaEntity,
            ...listData,
          ],
        );
      },
      error: (message, _, statusCode, e, stackTrace) {
        return DataState.error(
          message: message,
          code: statusCode,
          exception: e,
          stackTrace: stackTrace,
        );
      },
    );
  }
}
