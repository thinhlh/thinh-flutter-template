import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tfc/core/env/app_config.dart';
import 'package:tfc/core/env/env.dart';
import 'package:tfc/services/services/local/shared_preferences/app_preference.dart';

import 'app/app.dart';

class AppRunner {
  AppRunner._internal();

  static final AppRunner instance = AppRunner._internal();

  Future<void> runApplication() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(const Duration(seconds: 3));
    await Future.wait([
      _initializeDependencies(),
      _initServices(),
      _appConfigurations(),
    ]);
    runApp(const App());
  }

  /// Initalize application internal dependencies
  Future<void> _initializeDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Initalize external application service
  Future<void> _initServices() async {
    await AppPreferences.instance.init();
    await EasyLocalization.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
  }

  /// Initialize application configuration
  Future<void> _appConfigurations() async {
    Intl.defaultLocale = AppLanguages.defaultLanguage.countryCode;
    AppConfig.initialize(env: Env.dev());

    await SystemChrome.setPreferredOrientations(AppValue.deviceOrientations);
    EasyLocalization.logger.enableLevels = [];
  }
}
