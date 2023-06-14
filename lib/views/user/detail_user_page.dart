import 'package:consume_api/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/user.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.user.email),
              ],
            )),
      ),
    );
  }
}
