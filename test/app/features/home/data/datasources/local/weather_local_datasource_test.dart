import 'package:cloudy/app/features/home/data/datasources/local/weather_local_datasource.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/config/source_config/local/hive_config_impl.dart';
import 'package:cloudy/constants/core/hive_const.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_local_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HiveConfigImpl>()])
void main() {
  late WeatherLocalDataSourceImpl dataSource;
  late MockHiveConfigImpl hive;

  AreaEntity cityEntity = AreaEntity(
    locationData: LocationResultEntity.initial(),
    forecastData: ForecastWeatherEntity(
      datas: List.generate(
        4,
        (index) => WeatherEntity(
          date: DateTime.now(),
          listItem: [],
        ),
      ).toList(),
    ),
  );

  var listData = List.generate(4, (index) => cityEntity).toList();
  var listDataMap = listData.map((e) => e.toJson()).toList();

  setUp(() {
    hive = MockHiveConfigImpl();
    dataSource = WeatherLocalDataSourceImpl(hive);
  });

  group(
    'Save Location Test',
    () {
      test(
        'Should Save Func Return Success',
        () async {
          /// * Arrange
          when(
            hive.set(
              key: HiveConst.keyWeatherByCity,
              data: listDataMap,
            ),
          ).thenAnswer(
            (_) async => true,
          );

          ///*  Act
          var result = await dataSource.saveWeatherByArea(listDataMap);

          ///* Assert
          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<String>(),
          );
        },
      );
    },
  );

  group(
    'Get Weather By Location Test',
    () {
      test(
        'Should Get Func Return Valid data',
        () async {
          /// * Arrange
          when(
            hive.get(
              key: HiveConst.keyWeatherByCity,
            ),
          ).thenAnswer(
            (_) async => [],
          );

          ///*  Act
          var result = await dataSource.getWeatherByArea();

          ///* Assert
          var data = result.whenOrNull(success: (data) => data);
          expect(
            data,
            isA<List<Map<String, dynamic>>>(),
          );
        },
      );
    },
  );
}
