import 'package:flutter/widgets.dart';

abstract class AppLanguages {
  static const Locale defaultLanguage = Locale('vi');

  static const List<Locale> supportedLocales = [
    Locale('vi'),
    Locale('en'),
  ];

  static Locale defaultLocale = supportedLocales.first;

  static String? defaultLocaleString = supportedLocales.first.countryCode;

  static Locale fallbackLocale = supportedLocales[0];
}
