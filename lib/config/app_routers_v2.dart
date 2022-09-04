import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/home/domain/services/home_service.dart';
import 'package:tfc/app/home/views/home_page.dart';
import 'package:tfc/app/home/views/home_provider.dart';
import 'package:tfc/app/login_success/domain/services/login_success_service.dart';
import 'package:tfc/app/login_success/view/pages/login_success_page.dart';
import 'package:tfc/app/login_success/view/providers/login_success_provider.dart';
import 'package:tfc/utils/routes_utils.dart';

class AppRoutesV2 {
  static final AppRoutesV2 instance = AppRoutesV2._internal();
  AppRoutesV2._internal();

  String get initial => home;

  final String home = '/home';
  final String about = '/about';
  final String loginSuccess = '/login-success';

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: initial,
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('404'),
      ),
    ),
    routes: <GoRoute>[
      GoRoute(
          path: home,
          builder: (context, state) => RouteUtils.createPageProvider(
                provider: (_) => HomeProvider(
                  context.read<HomeService>(),
                ),
                child: const HomePage(),
              ),
          routes: <GoRoute>[
            GoRoute(
                path: 'login-success',
                builder: (context, state) => RouteUtils.createPageProvider(
                      provider: (_) => LoginSuccessProvider(
                        context.read<LoginSuccessService>(),
                      ),
                      child: const LoginSuccessPage(),
                    ),
                routes: <GoRoute>[
                  GoRoute(
                    path: 'home',
                    builder: (context, state) => RouteUtils.createPageProvider(
                      provider: (_) => HomeProvider(
                        context.read<HomeService>(),
                      ),
                      child: const HomePage(),
                    ),
                  ),
                ])
          ]),
      GoRoute(
        path: loginSuccess,
        builder: (context, state) => RouteUtils.createPageProvider(
          provider: (_) => LoginSuccessProvider(
            context.read<LoginSuccessService>(),
          ),
          child: const LoginSuccessPage(),
        ),
      )
    ],
  );
}