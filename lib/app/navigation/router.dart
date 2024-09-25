import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/auth/view/splash_page.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:go_router/go_router.dart';

BuildContext get globalCtx =>
    router.routerDelegate.navigatorKey.currentContext!;

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: SplashPage.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashPage(),
      routes: <GoRoute>[
        GoRoute(
            path: HomePage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage()),
      ],
    ),
  ],
);

extension GoRouterExt on String {
  String get makeGoRouterPath => substring(1);
}
