import 'package:easy_localization/easy_localization.dart';
import 'package:tfc/generated/locale_keys.g.dart';

abstract class Failure {
  String message = tr(LocaleKeys.common_default_error);

  Failure({String? message}) {
    this.message = message ?? this.message;
  }
}
