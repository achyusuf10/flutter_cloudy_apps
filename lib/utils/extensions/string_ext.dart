import 'package:cloudy/utils/extensions/date_time_ext.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Converts the given phone number string to the +62 format.
  ///
  /// If the length of the string is less than 3, it returns the original string.
  ///
  /// If the string starts with '+62', it removes the '+' sign.
  ///
  /// If the string starts with '0', it replaces the '0' with '62'.
  ///
  /// If the string starts with '62', it returns the original string.
  ///
  /// Otherwise, it prepends '62' to the original string.
  String extTo62Format({String? costume}) {
    if (length < 3) return this;
    if (substring(0, 3) == '+${costume ?? '62'}') return substring(1);
    if (this[0] == '0') return '${costume ?? '62'}${substring(1)}';
    if (substring(0, 2) == (costume ?? '62')) return this;
    return '${costume ?? '62'}$this';
  }

  String extToCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String extToDeleteBlank() {
    return replaceAll('.', '');
  }

  /// Converts the string to title case.
  ///
  /// If the string is empty, it returns an empty string.
  /// If the string length is less than or equal to 1, it returns the string in uppercase.
  /// Otherwise, it splits the string into multiple words, capitalizes the first letter of each word,
  /// and joins all the words back into one string.
  ///
  /// Example:
  /// ```dart
  /// String input = 'hello world';
  /// String result = input.extToTitleCase();
  /// print(result); // Output: 'Hello World'
  /// ```
  String extToTitleCase() {
    if (isEmpty) return '';
    if (length <= 1) return toUpperCase();

    // Split string into multiple words
    final List<String> words = toLowerCase().split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map(
      (word) {
        if (word.trim().isNotEmpty) {
          final String firstLetter = word.trim().substring(0, 1).toUpperCase();
          final String remainingLetters = word.trim().substring(1);
          return '$firstLetter$remainingLetters';
        }
        return '';
      },
    );

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  String extCapitalizeFirstLetter() {
    if (isEmpty) return this;
    if (length <= 1) return toUpperCase();
    // Split string into multiple words
    final List<String> words = toLowerCase().split(' ');
    if (words.isEmpty) return this;
    if (words[0].isNotEmpty) {
      words[0] = words[0].extToCapitalize();
    }
    return words.join(' ');
  }

  /// Converts a string to a DateTime object.
  ///
  /// The [originFormatDate] parameter specifies the format of the string representation of the date.
  /// The default value is 'yyyy-MM-dd'.
  ///
  /// Returns the parsed DateTime object.
  /// If the string cannot be parsed, returns the current DateTime.
  DateTime extToDateTime({
    String originFormatDate = 'yyyy-MM-dd',
  }) {
    try {
      var res = DateFormat(originFormatDate).parse(this);
      return res;
    } catch (e) {
      var res = DateTime.tryParse(this);
      if (res == null) throw e.toString();
      return res;
    }
  }

  /// Converts a string date time to a custom formatted date.
  ///
  /// The [outputDateFormat] parameter specifies the desired format of the final output. The default value is 'dd-MM-yyyy'.
  ///
  /// The [originFormatDate] parameter specifies the original format of the date string that will be converted. The default value is 'yyyy-MM-dd'.
  ///
  /// Example usage: "09-01-2000".extToCustomFormattedDate(formatDateString: 'dd-MM-yyyy')
  String extToCustomFormattedDate({
    String outputDateFormat = 'dd-MM-yyyy',
    String originFormatDate = 'yyyy-MM-dd',
  }) {
    DateTime temp = extToDateTime(
      originFormatDate: originFormatDate,
    );
    return temp.extToFormattedString(outputDateFormat: outputDateFormat);
  }

  String extGetInitialWord() {
    if (isEmpty) return '';
    List<String> temp = split(' ');

    List<String> res = [];

    for (var element in temp) {
      if (res.length < 2) {
        res.add(
          element[0].toUpperCase(),
        );
      }
    }
    return res.join('');
  }

  String extToConvertToLocal() {
    try {
      var tempString = '$this.000+0700';
      return DateFormat("dd-MM-yyyy - HH:mm")
          .format(DateTime.parse(tempString).toLocal());
    } catch (e) {
      return this;
    }
  }

  /// Capitalizes the first letter of each word in a string.
  ///
  /// If the string is empty, an empty string is returned.
  /// Each word in the string is separated by a space.
  /// If a word is empty or consists of only one character, it is capitalized.
  /// Otherwise, the first letter of the word is capitalized and the rest of the word remains unchanged.
  /// The capitalized words are then concatenated with spaces and returned as a single string.
  String extCapitalizeWord() {
    if (isEmpty) return '';
    // Each sentence becomes an array element
    List<String> words = split(' ');
    if (words.isEmpty) return this;
    // Initialize string as empty string
    String output = '';
    // Loop through each sentence
    for (var word in words) {
      String capitalized = '';
      if (word.isEmpty) {
        capitalized = '';
      } else if (word.length > 1) {
        capitalized = word[0].toUpperCase() + word.substring(1);
      } else {
        capitalized = word[0].toUpperCase();
      }
      // Add current sentence to output with a period
      output += "$capitalized ";
    }
    return output;
  }
}

extension StringNullExtension on String? {
  /// Replaces an empty or null string with a specified replacement string.
  ///
  /// If the string is null or empty, it will be replaced with the [replacement] string.
  /// If the string is not null or empty, it will be returned as is.
  ///
  /// Example:
  /// ```dart
  /// String name = '';
  /// String result = name.extEmptyNullReplacement(replacement: 'John Doe');
  /// print(result); // Output: 'John Doe'
  /// ```
  String extEmptyNullReplacement({String replacement = '-'}) {
    if (this == null) return replacement;
    if ((this ?? '').isEmpty) return replacement;
    return this ?? replacement;
  }

  /// Checks if the string is empty or null.
  /// Returns true if the string is empty or null, otherwise returns false.
  bool extIsEmptyOrNull() {
    if (this == null) return true;
    if ((this ?? '').isEmpty) return true;
    return false;
  }
}
