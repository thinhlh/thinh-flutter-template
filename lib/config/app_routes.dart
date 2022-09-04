import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/home/views/home_page.dart';
import 'package:tfc/app/home/views/home_provider.dart';
import 'package:tfc/app/login_success/view/pages/login_success_page.dart';
import 'package:tfc/app/login_success/view/providers/login_success_provider.dart';
import 'package:tfc/utils/routes_utils.dart';

class AppRoutes {
  AppRoutes._internal();

  static AppRoutes get instance => AppRoutes._internal();

  // Navigation
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Routes
  static String get initial => home;

  static const String home = '/home';
  static const String about = '/about';
  static const String loginSuccess = '/login-success';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => RouteUtils.createPageProvider<HomeProvider>(
            provider: (context) => HomeProvider(context.read()),
            child: const HomePage(),
          ),
          fullscreenDialog: true,
        );
      case AppRoutes.loginSuccess:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => RouteUtils.createPageProvider<LoginSuccessProvider>(
            provider: (context) => LoginSuccessProvider(context.read()),
            child: const LoginSuccessPage(),
          ),
          fullscreenDialog: true,
        );

      default:
        return null;
    }
  }
}
