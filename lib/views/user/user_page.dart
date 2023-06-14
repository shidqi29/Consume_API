import 'package:consume_api/controllers/user_controller.dart';
import 'package:consume_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: userController.fetchAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            AppRoutes.user,
                            extra: snapshot.data![index],
                          );
                        },
                        title: Text(snapshot.data![index].name),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return Text("Tidak ada data");
              }
            } else {
              return Text("Err");
            }
          },
        ),
      ),
    );
  }
}
