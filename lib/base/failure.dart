import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  String message = tr('Default Failure Message');

  Failure({String? message}) {
    this.message = message ?? this.message;
  }
}
