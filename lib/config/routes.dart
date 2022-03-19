import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tfc/app/home/presentation/bloc/home_bloc.dart';
import 'package:tfc/app/home/presentation/pages/home_page.dart';
import 'package:tfc/utils/route_util.dart';

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
          builder: (_) => RouteUtil.createPageBloc<HomeBloc>(
            bloc: (_) => HomeBloc(GetIt.I()),
            child: HomePage(),
          ),
        );
      case Routes.about:

      default:
        return null;
    }
  }
}
