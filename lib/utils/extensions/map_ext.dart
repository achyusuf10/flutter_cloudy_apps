import 'package:flutter/material.dart';

extension MapExtension on Map<String, dynamic> {
  TimeOfDay extFromJsonTimeOfDay() {
    return TimeOfDay(
      hour: this['hour'],
      minute: this['minute'],
    );
  }
}
