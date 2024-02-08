// Mocks generated by Mockito 5.4.4 from annotations
// in cloudy/test/app/features/home/presentation/bloc/home_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart'
    as _i6;
import 'package:cloudy/app/features/home/domain/usecases/add_city_to_local_uc.dart'
    as _i11;
import 'package:cloudy/app/features/home/domain/usecases/get_current_city_weather_uc.dart'
    as _i9;
import 'package:cloudy/app/features/home/domain/usecases/get_forecast_weather_uc.dart'
    as _i4;
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart'
    as _i10;
import 'package:cloudy/app/features/select_city/domain/usecases/get_user_location_uc.dart'
    as _i7;
import 'package:cloudy/app/global_entity/location_result_entity.dart' as _i8;
import 'package:cloudy/core/state/data_state.dart' as _i2;
import 'package:cloudy/utils/functions/get_context_func.dart' as _i12;
import 'package:flutter/material.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBuildContext_1 extends _i1.SmartFake implements _i3.BuildContext {
  _FakeBuildContext_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetForecastWeatherUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetForecastWeatherUC extends _i1.Mock
    implements _i4.GetForecastWeatherUC {
  @override
  _i5.Future<_i2.DataState<_i6.ForecastWeatherEntity>> call(
          _i4.GetForecastWeatherParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i2.DataState<_i6.ForecastWeatherEntity>>.value(
            _FakeDataState_0<_i6.ForecastWeatherEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.DataState<_i6.ForecastWeatherEntity>>.value(
                _FakeDataState_0<_i6.ForecastWeatherEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.DataState<_i6.ForecastWeatherEntity>>);
}

/// A class which mocks [GetUserLocationUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserLocationUC extends _i1.Mock implements _i7.GetUserLocationUC {
  @override
  _i5.Future<_i2.DataState<_i8.LocationResultEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i2.DataState<_i8.LocationResultEntity>>.value(
            _FakeDataState_0<_i8.LocationResultEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.DataState<_i8.LocationResultEntity>>.value(
                _FakeDataState_0<_i8.LocationResultEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i2.DataState<_i8.LocationResultEntity>>);
}

/// A class which mocks [GetCurrentCityWeatherUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentCityWeatherUC extends _i1.Mock
    implements _i9.GetCurrentCityWeatherUC {
  @override
  _i5.Future<_i2.DataState<_i10.CityEntity>> call(
          _i9.GetCurrentCityWeatherParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i2.DataState<_i10.CityEntity>>.value(
            _FakeDataState_0<_i10.CityEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.DataState<_i10.CityEntity>>.value(
                _FakeDataState_0<_i10.CityEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.DataState<_i10.CityEntity>>);
}

/// A class which mocks [AddCityToLocalUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddCityToLocalUC extends _i1.Mock implements _i11.AddCityToLocalUC {
  @override
  _i5.Future<_i2.DataState<String>> call(_i11.AddCityToLocalParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i5.Future<_i2.DataState<String>>.value(_FakeDataState_0<String>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.DataState<String>>.value(_FakeDataState_0<String>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.DataState<String>>);
}

/// A class which mocks [GetContextFunc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetContextFunc extends _i1.Mock implements _i12.GetContextFunc {
  @override
  _i3.BuildContext get i => (super.noSuchMethod(
        Invocation.getter(#i),
        returnValue: _FakeBuildContext_1(
          this,
          Invocation.getter(#i),
        ),
        returnValueForMissingStub: _FakeBuildContext_1(
          this,
          Invocation.getter(#i),
        ),
      ) as _i3.BuildContext);
}
