import 'package:tfc/config/env/env.dart';

class AppConfig {
  AppConfig._internal();
  static final AppConfig instance = AppConfig._internal();

  Env env = Env.dev();

  factory AppConfig({required Env env}) {
    instance.env = env;
    return instance;
  }
}
