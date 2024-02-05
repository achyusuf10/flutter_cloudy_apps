import 'package:cloudy/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
  generateForDir: [
    'lib/app',
    'lib/core',
    'lib/config',
    'lib/utils/functions',
    'lib/utils/services',
  ],
)
Future<void> configureDependencies() async => $initGetIt(getIt);
