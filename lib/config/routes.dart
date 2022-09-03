import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tfc/app/home/data/services/home_service_impl.dart';
import 'package:tfc/app/home/views/home_page.dart';
import 'package:tfc/app/home/views/home_provider.dart';
import 'package:tfc/utils/routes_utils.dart';

class Routes {
  Routes._internal();

  static String get initial => home;

  static const String home = '/home';
  static const String about = '/about';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => RouteUtils.createPageProvider<HomeProvider>(
            provider: (_) => HomeProvider(HomeServiceImpl()),
            child: const HomePage(),
          ),
          fullscreenDialog: true,
        );
      case Routes.about:

      default:
        return null;
    }
  }
}
