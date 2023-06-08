import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

class AppRoutes {
  static const home = 'home';

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: HomePage(),
    );
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: home,
        path: '/home',
        pageBuilder: _homePageBuilder,
      ),
    ],
  );
}
