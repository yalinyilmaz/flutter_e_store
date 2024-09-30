import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/auth/view/admin_login_page.dart';
import 'package:flutter_e_store/feature/auth/view/choose_your_panel.dart';
import 'package:flutter_e_store/feature/auth/view/login_page.dart';
import 'package:flutter_e_store/feature/auth/view/register_page.dart';
import 'package:flutter_e_store/feature/auth/view/splash_page.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/view/admin_home_page.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/feature/home/view/home_profile_page.dart';
import 'package:flutter_e_store/feature/home/view/product_detail_page.dart';
import 'package:flutter_e_store/feature/home/view/products_list_page.dart';
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
            path: ChoosePanelPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const ChoosePanelPage()),
        GoRoute(
            path: AdminLoginPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const AdminLoginPage()),
        GoRoute(
            path: AdminHomePage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const AdminHomePage()),
        GoRoute(
            path: HomePage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage()),
        GoRoute(
            path: ProductsListPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const ProductsListPage()),
        GoRoute(
            path: ProductsDetailPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) {
              final product = state.extra as ProductModel;
              return ProductsDetailPage(product: product);
            }),
        GoRoute(
            path: LoginPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const LoginPage()),
        GoRoute(
            path: RegisterPage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const RegisterPage()),
        GoRoute(
            path: ProfilePage.routeName.makeGoRouterPath,
            builder: (BuildContext context, GoRouterState state) =>
                const ProfilePage()),
      ],
    ),
  ],
);

extension GoRouterExt on String {
  String get makeGoRouterPath => substring(1);
}
