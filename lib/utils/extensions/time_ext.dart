import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  Map<String, dynamic> extToJson() {
    return {'hour': hour, 'minute': minute};
  }

  DateTime extToDateTime() {
    return DateTime(0, 0, 0, hour, minute);
  }

  static TimeOfDay extFromJsonTimeOfDay(Map<String, dynamic> map) {
    return TimeOfDay(
      hour: map['hour'],
      minute: map['minute'],
    );
  }
}
