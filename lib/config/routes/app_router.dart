import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/home/presentation/pages/home_page.dart';
import 'package:cloudy/app/features/pick_location/presentation/pages/pick_location_page.dart';
import 'package:cloudy/app/features/select_area/presentation/pages/select_area_page.dart';
import 'package:cloudy/app/features/splash/presentation/pages/splash_page.dart';
import 'package:cloudy/config/routes/routes.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: "Route|Page,Route",
  generateForDir: [
    'lib/config/routes',
    'lib/app/features',
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: Routes.splashPage,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: Routes.homePage,
        ),
        AutoRoute(
          page: PickLocationRoute.page,
          path: Routes.pickLocationPage,
        ),
        AutoRoute(
          page: SelectAreaRoute.page,
          path: Routes.selectAreaPage,
        ),
      ];
}
