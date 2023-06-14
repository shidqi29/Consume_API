import 'package:consume_api/controllers/album_controller.dart';
import 'package:consume_api/models/album.dart';
import 'package:flutter/material.dart';

class DetailAlbumPage extends StatefulWidget {
  const DetailAlbumPage({
    super.key,
    required this.album,
  });
  final Album album;
  @override
  State<DetailAlbumPage> createState() => _DetailAlbumPageState();
}

class _DetailAlbumPageState extends State<DetailAlbumPage> {
  @override
  Widget build(BuildContext context) {
    final AlbumController albumController = AlbumController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Album"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              Text(
                widget.album.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
