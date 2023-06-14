import 'package:consume_api/models/album.dart';
import 'package:consume_api/models/user.dart';
import 'package:consume_api/views/album/album_page.dart';
import 'package:consume_api/views/album/detail_album_page.dart';
import 'package:consume_api/views/post/detail_post_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/post.dart';
import '../views/post/add_post_page.dart';
import '../views/home_page.dart';
import '../views/user/detail_user_page.dart';

class AppRoutes {
  static const home = 'home';
  static const post = 'post';
  static const addPost = 'add-post';
  static const editPost = 'edit-post';
  static const album = 'album';
  static const user = 'user';

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: HomePage(),
    );
  }

  static Page _postPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: DetailPostPage(
        post: state.extra as Post,
      ),
    );
  }

  static Page _addPostPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: AddPostPage(),
    );
  }

  static Page _editPostPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: AddPostPage(
        post: state.extra as Post,
      ),
    );
  }

  static Page _albumPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: DetailAlbumPage(
        album: state.extra as Album,
      ),
    );
  }
  static Page _userPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: DetailUserPage(
        user: state.extra as User,
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
          GoRoute(
            name: addPost,
            path: 'add-post',
            pageBuilder: _addPostPageBuilder,
          ),
          GoRoute(
            name: editPost,
            path: 'edit-post',
            pageBuilder: _editPostPageBuilder,
          ),
          GoRoute(
            name: album,
            path: 'album',
            pageBuilder: _albumPageBuilder,
          ),
          GoRoute(
            name: user,
            path: 'user',
            pageBuilder: _userPageBuilder,
          ),
        ],
      ),
    ],
  );
}
