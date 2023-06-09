import 'package:consume_api/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/post.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static const home = 'home';
  static const post = 'post';

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: HomePage(),
    );
  }

  static Page _postPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: PostPage(
        post: state.extra as Post,
      ),
    );
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: home,
        path: '/home',
        pageBuilder: _homePageBuilder,
        routes: [
          GoRoute(
            name: post,
            path: 'post',
            pageBuilder: _postPageBuilder,
          ),
        ],
      ),
    ],
  );
}
