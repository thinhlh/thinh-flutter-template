import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tfc/config/app_languages.dart';
import 'package:tfc/config/app_routers.dart';
import 'package:tfc/config/app_sizes.dart';
import 'package:tfc/config/global_providers.dart';
import 'package:tfc/config/app_themes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: GlobalProviders.providers,
      builder: (_, child) => child!,
      child: EasyLocalization(
        supportedLocales: AppLanguages.supportedLocales,
        path: 'assets/translations',
        fallbackLocale: AppLanguages.fallbackLocale,
        child: ScreenUtilInit(
          designSize: AppSizes.designSize,
          builder: (ctx, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: ctx.localizationDelegates,
            locale: ctx.locale,
            supportedLocales: ctx.supportedLocales,
            routeInformationProvider:
                AppRoutes.instance.router.routeInformationProvider,
            routeInformationParser:
                AppRoutes.instance.router.routeInformationParser,
            routerDelegate: AppRoutes.instance.router.routerDelegate,
            // initialRoute: AppRoutes.initial,
            // onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
            themeMode: ThemeMode.system,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            builder: (_, child) => ResponsiveWrapper.builder(
              child,
              defaultScale: true,
              maxWidth: 2460,
              minWidth: 350,
              breakpoints: const [
                ResponsiveBreakpoint.resize(350, name: MOBILE),
                ResponsiveBreakpoint.autoScale(600, name: TABLET),
                ResponsiveBreakpoint.resize(800, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
