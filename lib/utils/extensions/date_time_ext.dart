import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  /// Default format 'yyyy-MM-dd'
  /// Converts the [DateTime] object to a formatted string.
  ///
  /// The [outputDateFormat] parameter specifies the format of the output string.
  /// The default format is 'yyyy-MM-dd'.
  ///
  /// Returns the formatted string representation of the [DateTime] object.
  /// If the [DateTime] object is null, it returns '-'.
  String extToFormattedString({String outputDateFormat = 'yyyy-MM-dd'}) {
    if (this == null) return '-';
    return DateFormat(
      outputDateFormat,
    ).format(this ?? DateTime.now());
  }

  /// Converts a [DateTime] object to a formatted time string.
  ///
  /// The [formatToTime] parameter specifies the desired format of the time string.
  /// The default format is "HH:mm".
  ///
  /// Returns the formatted time string.
  /// If the [DateTime] object is null, returns a dash ("-").
  String extToTimeString({String formatToTime = "HH:mm"}) {
    if (this == null) return '-';
    return DateFormat(
      formatToTime,
    ).format(this ?? DateTime.now());
  }

  /// Converts the [DateTime] object to a formatted string in the format "dd MMMM yyyy".
  /// If the [DateTime] object is null, it returns a dash ("-").
  /// The format is based on the current language set in [LocalizationService].
  String extToDateStringDDMMMMYYYY() {
    if (this == null) return '-';
    return DateFormat(
      "dd MMMM yyyy",
    ).format(this ?? DateTime.now());
  }
}
