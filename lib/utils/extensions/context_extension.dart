import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;

  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  T? getArguments<T>() => ModalRoute.of(this)?.settings.arguments as T?;

  GoRouter get navigator {
    return GoRouter.of(this);
  }
}
