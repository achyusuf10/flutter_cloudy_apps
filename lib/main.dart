import 'dart:async';
import 'dart:io';

import 'package:cloudy/config/routes/app_router.dart';
import 'package:cloudy/config/themes/app_themes.dart';
import 'package:cloudy/constants/common/app_const.dart';
import 'package:cloudy/core/di/injection.dart';
import 'package:cloudy/core/loggers/auto_route_logger.dart';
import 'package:cloudy/core/loggers/bloc_event_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = MyHttpOverrides();

      await configureDependencies();
      Bloc.observer = BlocEventLogger();
      runApp(const MyApp());
    },
    (error, stack) {
      /// * Todo : Implement Logger like sentry
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConst.designAppSize,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          theme: AppThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: getIt.get<AppRouter>().config(
                navigatorObservers: () => [
                  AutoRouteEventLogger(),
                ],
              ),
        );
      },
    );
  }
}
