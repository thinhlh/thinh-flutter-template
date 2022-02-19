import 'package:flutter/material.dart';
import 'package:tfc/app/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tfc/app/home/presentation/pages/home_page.dart';
import 'package:tfc/util/route_util.dart';

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
          builder: (_) => RouteUtil.createPageBlocProvider<HomeBloc>(
            bloc: (_) => HomeBloc(),
            child: HomePage(),
          ),
        );
      case Routes.about:

      default:
        return null;
    }
  }
}
