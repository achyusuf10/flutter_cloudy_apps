import 'dart:io';

import 'module_generator.dart';

String getImportCurPackage() {
  var package = Directory.current;
  String namePackage = (package.path).split('/').last;
  return "import 'package:$namePackage";
}

class ConfigData {
  /// * Config data file
  static String appFonts = """
class AppFonts{
  AppFonts._();
}
""";

  static String appColors = """
import 'package:flutter/material.dart';
class AppColors{
  AppColors._();
  static const primary = Color(0xff41D7BE);
  static const secondary = Color(0xff6370E7);
}
""";

  static String appThemes = """
import 'package:flutter/material.dart';
${getImportCurPackage()}/config/themes/app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    focusColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'openSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      displaySmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        
        height: 1.219,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        
        height: 1.219,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        
        height: 1.219,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        
        height: 1.219,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        
        height: 1.219,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        
        height: 1.219,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        
        height: 1.219,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        
        height: 1.219,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        
        height: 1.219,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}

""";

  static String routeData = """
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig( replaceInRouteName: "Route|Page,Route",
  generateForDir: [
    'lib/config/routes',
    'lib/app/features',
  ],)
class AppRouter extends _\$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [];
  }
""";
}

class ConstantsData {
  /// * Constants data file
  static String appConst = """
class AppConst{
  AppConst._();
}
""";
  static String imageAsset = """
class ImageAssetsConst{
  ImageAssetsConst._();
}
""";
}

class CoreData {
  static String usecase = """
${getImportCurPackage()}/app/global_activities/data_activities.dart';
abstract class UseCase<ReturnSuccessType,Params> {
  const UseCase();
  Future<DataActivities<ReturnSuccessType>> call(Params params);
}
""";
  static String noParamsUsecase = """
${getImportCurPackage()}/app/global_activities/data_activities.dart';
abstract class NoParamsUseCase<ReturnSuccessType> {
  const NoParamsUseCase();
  Future<DataActivities<ReturnSuccessType>> call();
}
""";
}

class AppData {
  static String dataActivites = """
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_activities.freezed.dart';
@freezed
class DataActivities<T> with _\$DataActivities<T> {
  const factory DataActivities.success({required T data}) = DataActivitiesSuccess<T>;
  const factory DataActivities.error({
    required String message,
    T? data,
    int? code,
    Exception? exception,
    StackTrace? stackTrace,
  }) = DataActivitiesError<T>;
}

""";

  static String abstractRepositories({
    required String nameRepository,
  }) =>
      """
abstract class ${nameRepository}Repository {

}
""";
  static String implRepositories({
    required String nameRepository,
    required String nameFeature,
  }) {
    String temp = featuresPath.replaceAll('lib/', '');
    String repoSnakeCase = DataConverter.pascalCaseToSnakeCase(nameRepository);
    return """
${getImportCurPackage()}/$temp$nameFeature/data/repositories/${repoSnakeCase}_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ${nameRepository}Repository)
class ${nameRepository}RepositoryImpl extends ${nameRepository}Repository{

}
""";
  }

  static String dataSources({
    required String nameFeature,
    required String nameDataSource,
    bool isRemote = true,
  }) {
    String prefix = isRemote ? 'Remote' : 'Local';
    return """

import 'package:injectable/injectable.dart';
abstract class $nameDataSource${prefix}DataSource {

}

@LazySingleton(as:  $nameDataSource${prefix}DataSource)
class  $nameDataSource${prefix}DataSourceImpl extends  $nameDataSource${prefix}DataSource{

}
""";
  }
}

class DataConverter {
  static String camelCaseToSnakeCase(String value) {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    String result =
        value.replaceAllMapped(exp, (m) => '_${m.group(0)}').toLowerCase();
    return result;
  }

  static String camelCaseToPascalCase(String value) {
    String temp = value[0].toUpperCase();
    return value.replaceRange(0, 1, temp);
  }

  static String pascalCaseToCamelCase(String value) {
    String temp = value[0].toLowerCase();

    return value.replaceRange(0, 1, temp);
  }

  static String pascalCaseToSnakeCase(String value) {
    String temp = pascalCaseToCamelCase(value);
    return camelCaseToSnakeCase(temp);
  }
}
