import 'dart:convert';
import 'dart:io';

import 'package:consume_api/models/post.dart';

import '../models/comment.dart';
import '../services/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Post.fromMap(
            jsonData[index],
          ),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<List<Comment>> fetchComment(int id) async {
    return await PostService().fetchComments(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Comment.fromMap(jsonData[index]),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> delete(int id) async {
    return await PostService()
        .delete(id)
        .then((res) => res.statusCode == HttpStatus.ok ? true : false);
  }
}
