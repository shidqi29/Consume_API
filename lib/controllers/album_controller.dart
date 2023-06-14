import 'dart:convert';
import 'dart:io';

import 'package:consume_api/models/album.dart';
import 'package:consume_api/services/album_service.dart';

class AlbumController {
  Future<List<Album>> fetchAllAlbum() async {
    return await AlbumService().fetchAlbum().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Album.fromMap(
            jsonData[index],
          ),
        );
      } else {
        throw Exception();
      }
    });
  }
}
