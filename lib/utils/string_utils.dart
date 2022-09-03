import 'dart:math';

abstract class StringUtils {
  static final Random _random = Random();

  // ignore: constant_identifier_names
  static const _CHARS =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
  static String getRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _CHARS.codeUnitAt(
          _random.nextInt(_CHARS.length),
        ),
      ),
    );
  }
}
