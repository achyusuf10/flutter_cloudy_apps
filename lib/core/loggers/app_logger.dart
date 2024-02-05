import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static logData(
    String message, {
    String name = 'LOG',
  }) {
    if (kDebugMode) {
      log(message, name: name);
    }
  }

  static printData(
    String message,
  ) {
    if (kDebugMode) {
      print(message);
    }
  }
}
