import 'package:consume_api/controllers/album_controller.dart';
import 'package:consume_api/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final AlbumController albumController = AlbumController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Page"),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: albumController.fetchAllAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
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
                          AppRoutes.album,
                          extra: snapshot.data![index],
                        );
                      },
                      title: Text(snapshot.data![index].title),
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
      )),
    );
  }
}
