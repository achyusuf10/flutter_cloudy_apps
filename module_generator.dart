// ignore_for_file: avoid_print
import 'dart:io';

import 'module_data.dart';

String rootPath = "lib/";

/// * Config
String configPath = "${rootPath}config/";
String routesPath = "${configPath}routes/";
String themesPath = "${configPath}themes/";
String networkPath = "${configPath}network/";

/// * Constants
String constantsPath = "${rootPath}constants/";
String commonConstantPath = "${constantsPath}common/";
String coreConstantPath = "${constantsPath}core/";

/// * Core
String corePath = "${rootPath}core/";
String usecasesCorePath = "${corePath}usecases/";
String diPath = "${corePath}di/";
String loggersPath = "${corePath}loggers/";

/// * Utils
String utilsPath = "${rootPath}utils/";

/// * APP
String appPath = "${rootPath}app/";
String featuresPath = "${appPath}features/";
void main(List<String> args) {
  print('\n----------------------Choose--------------------------\n'
      '0. Init App\n'
      '1. Create Fitur\n'
      '2. Create Repository\n'
      '3. Create DataSource\n'
      'h. Help\n'
      '------------------------------------------------------\n');

  String indexMenu = InputUser.input();

  switch (indexMenu) {
    case "0":
      initApp();
      break;
    case "1":
      print('Masukkan Nama Fitur : Example (ProductCart)');
      String nameFeature = InputUser.input();
      createFeature(nameFeature: nameFeature);
      break;
    case "2":
      print('Pilih  Fitur : \n');
      String? selectedFitur = InputUser.inputFeature();
      if (selectedFitur == null) {
        print('Fitur tidak ditemukan');
        return;
      }
      print('Input Repo Name : Example (RegisterLogin)');
      String nameRepository = InputUser.input();
      if (nameRepository.isEmpty) return;
      createRepository(
        nameFeature: selectedFitur,
        nameRepository: nameRepository,
      );
      break;
    case "3":
      print('Pilih  Fitur : \n');
      String? selectedFitur = InputUser.inputFeature();
      if (selectedFitur == null) {
        print('Fitur tidak ditemukan');
        return;
      }
      print('Input Data Source Name : Example (Profile)');
      String nameDataSource = InputUser.input();
      if (nameDataSource.isEmpty) return;
      print('Is Remote ? : (y/n)');
      String isRemote = InputUser.input();
      String isRemoteResult = switch (isRemote) {
        'y' => 'remote',
        'n' => 'local',
        'Y' => 'remote',
        'N' => 'local',
        'Yes' => 'remote',
        'No' => 'local',
        _ => '',
      };
      if (isRemoteResult.isEmpty) return;

      createDataSource(
        nameFeature: selectedFitur,
        nameDataSource: nameDataSource,
        from: isRemoteResult,
      );
      break;
    default:
  }
}

void showHelp() {
  String help = """
-h  --> Show Help
--help  --> Show Help

initApp --> Create on First Time
example : dart module_generator initApp

create={name feature} --> Create Feature
example : dart module_generator create=Login

repository={name feature}={name repo} --> Create Repo
example : dart module_generator repository=auth=Login

datasource={name feature}={from}={name datasource} --> Create datasource
example : dart module_generator datasource=auth=local=Login

Nb: Nama Repo and Data Source must PascalCase

""";

  print(help);
}

void initApp() async {
  /// * Create Config

  await createFolder(networkPath);
  await createFile(
    name: '${themesPath}app_colors.dart',
    content: ConfigData.appColors,
  );
  await createFile(
    name: '${themesPath}app_fonts.dart',
    content: ConfigData.appFonts,
  );
  await createFile(
    name: '${themesPath}app_themes.dart',
    content: ConfigData.appThemes,
  );
  await createFile(
    name: '${routesPath}app_router.dart',
    content: ConfigData.routeData,
  );

  /// * Create Constans

  await createFile(
    name: '${commonConstantPath}app_const.dart',
    content: ConstantsData.appConst,
  );
  await createFile(
    name: '${coreConstantPath}image_assets_const.dart',
    content: ConstantsData.imageAsset,
  );

  /// * Create Core

  await createFile(
    name: '${usecasesCorePath}usecase.dart',
    content: CoreData.usecase,
  );
  await createFile(
    name: '${usecasesCorePath}no_params_usecase.dart',
    content: CoreData.noParamsUsecase,
  );
  await createFolder(diPath);
  await createFolder(loggersPath);

  /// * Create Utils
  await createFolder('${utilsPath}enums/');
  await createFolder('${utilsPath}extensions/');
  await createFolder('${utilsPath}services/');
  await createFolder('${utilsPath}functions/');

  /// * Create App
  await createFolder(featuresPath);
  await createFolder('${appPath}global_bloc');
  await createFolder('${appPath}widgets');
  await createFile(
    name: '${appPath}global_activities/data_activities.dart',
    content: AppData.dataActivites,
  );
}

Future<Directory> createFolder(String name) async {
  return await Directory(name).create(recursive: true);
}

Future<void> createFile({
  required String name,
  String content = '',
}) async {
  var temp = File(name);
  temp.createSync(recursive: true);
  if (content.isEmpty) return;
  temp.writeAsStringSync(content);
}

void createFeature({
  required String nameFeature,
}) async {
  String snakeCaseFeature = DataConverter.pascalCaseToSnakeCase(nameFeature);

  /// Domain
  await createFolder('$featuresPath$snakeCaseFeature/domain/repositories');
  await createFolder('$featuresPath$snakeCaseFeature/domain/entities');
  await createFolder('$featuresPath$snakeCaseFeature/domain/usecases');
  await createFolder('$featuresPath$snakeCaseFeature/domain/activities');

  /// Data
  await createFolder('$featuresPath$snakeCaseFeature/data/repositories');
  await createFolder('$featuresPath$snakeCaseFeature/data/models');
  await createFolder('$featuresPath$snakeCaseFeature/data/datasources/local');
  await createFolder('$featuresPath$snakeCaseFeature/data/datasources/remote');

  /// Presentation
  await createFolder('$featuresPath$snakeCaseFeature/presentation/pages');
  await createFolder('$featuresPath$snakeCaseFeature/presentation/components');
  await createFolder('$featuresPath$snakeCaseFeature/presentation/blocs');
}

void createRepository({
  required String nameFeature,
  required String nameRepository,
}) async {
  String snakeCaseRepo = DataConverter.pascalCaseToSnakeCase(nameRepository);
  await createFile(
    name:
        '$featuresPath$nameFeature/domain/repositories/${snakeCaseRepo}_repository.dart',
    content: AppData.abstractRepositories(nameRepository: nameRepository),
  );
  await createFile(
      name:
          '$featuresPath$nameFeature/data/repositories/${snakeCaseRepo}_repository_impl.dart',
      content: AppData.implRepositories(
        nameRepository: nameRepository,
        nameFeature: nameFeature,
      ));
}

void createDataSource({
  required String nameFeature,
  required String nameDataSource,
  required String from,
}) async {
  String snakeCase = DataConverter.pascalCaseToSnakeCase(nameDataSource);

  await createFile(
    name:
        '$featuresPath$nameFeature/data/datasources/$from/${snakeCase}_${from}_datasource.dart',
    content: AppData.dataSources(
      nameFeature: nameFeature,
      nameDataSource: nameDataSource,
      isRemote: from.contains('remote'),
    ),
  );
}

class InputUser {
  static String input() {
    String? result = stdin.readLineSync();
    if (result == null || result.isEmpty) {
      print('Inputan Tidak Boleh Kosong');
    }
    return result ?? '';
  }

  static String? inputFeature() {
    /// Get All Feature
    print('\n--------------------List Fitur------------------------');
    List<String> listFeature = Directory(featuresPath)
        .listSync()
        .map((e) => e.path.split('/').last)
        .toList();
    listFeature.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    int indexType = 0;
    for (var data in listFeature) {
      print('$indexType. $data');
      indexType++;
    }
    print('------------------------------------------------------\n');

    /// Input Index Feature
    print('Pilih Fitur sesuai dengan index:');
    String indexFeature = input();
    if (indexFeature.isEmpty) return null;
    int? tryParse = int.tryParse(indexFeature);
    if (tryParse == null) {
      return null;
    }

    if (tryParse >= listFeature.length) {
      print('Index yang diinputkan tidak ditemukan');
      return null;
    }
    return listFeature[tryParse];
  }
}


/// auto_route,cached_network_image,cloud_firestore,firebase_core,firebase_storage,flutter_bloc,flutter_conditional_rendering,flutter_image_compress,flutter_screenutil,flutter_secure_storage,freezed_annotation,geolocator,get_it,hive_flutter,image_cropper,image_picker,injectable,json_annotation,path_provider,shimmer
/// auto_route_generator,build_runner,freezed,hive_generator,injectable_generator,json_serializable