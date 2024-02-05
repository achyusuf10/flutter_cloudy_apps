import 'package:auto_route/auto_route.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AutoRouteEventLogger extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (kDebugMode == false) return;
    AppLogger.logData(
      'New route pushed: ${route.settings.name}',
      name: 'Auto Route',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode == false) return;
    AppLogger.logData(
      'Route popped: ${route.settings.name}',
      name: 'Auto Route',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode == false) return;
    AppLogger.logData(
      'Route removed: ${route.settings.name}',
      name: 'Auto Route',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode == false) return;
    AppLogger.logData(
      '${oldRoute?.settings.name} Has Replaced By ${newRoute?.settings.name}',
      name: 'Auto Route',
    );
  }
}
