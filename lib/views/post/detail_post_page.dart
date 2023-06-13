import 'package:consume_api/controllers/post_controller.dart';
import 'package:consume_api/models/comment.dart';
import 'package:consume_api/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key, required this.post});
  final Post post;

  @override
  State<DetailPostPage> createState() => _PostPageState();
}

class _PostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    final PostController postController = PostController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Post"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.post.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                widget.post.body,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Komentar"),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                child: FutureBuilder<List<Comment>>(
                  future: postController.fetchComment(widget.post.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        List<Comment> comments = snapshot.data!;
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(comments[index].name),
                                subtitle: Text(comments[index].body),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.0005,
                            );
                          },
                          itemCount: comments.length,
                        );
                      } else {
                        return Text("Belum ada komentar");
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Text("err");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
