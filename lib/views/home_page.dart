import 'package:consume_api/controllers/post_controller.dart';
import 'package:consume_api/views/post/post_page.dart';
import 'package:consume_api/views/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_routes.dart';
import 'album/album_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  tapBottomItem(int index) {
    if (index != 3) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    _pageController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          PostPage(),
          AlbumPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: tapBottomItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album_outlined),
            label: "Album",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "User",
          ),
        ],
      ),
    );
  }
}
