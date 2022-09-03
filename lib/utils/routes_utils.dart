import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class RouteUtils {
  static Widget createPageProvider<T extends ChangeNotifier>({
    required T Function(BuildContext context) provider,
    required Widget child,
    RouteSettings? settings,
  }) {
    return ChangeNotifierProvider<T>(
      create: provider,
      child: child,
    );
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
