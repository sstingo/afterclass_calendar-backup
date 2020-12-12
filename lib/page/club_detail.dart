import 'package:afterclass_calendar/club_service/club_http.dart';
import 'package:afterclass_calendar/club_service/club_model.dart';
import 'package:flutter/material.dart';

class ClubDetail extends StatelessWidget {
  final ClubPost post;
  final ClubHttp clubHttp = ClubHttp();
//  final Set<WordPair> _saved = new Set<WordPair>();

  ClubDetail({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.name),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // showSearch(
              // context: context,
              //  delegate: ActivitySearch(),
              // );
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () async {
      //     await httpService.deletePost(post2.id);
      //     Navigator.of(context).pop();
      //   },
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                    title: post.logo != null
                        ? Image.network(post.logo)
                        : Image.asset(
                            "images/圖片顯示中.jpg",
                            width: 100,
                          )),
                ListTile(
                  title: Text(post.name),
                  subtitle: Text(post.id),
                ),
                ListTile(
                  title: Text("性質"),
                  subtitle: Text(post.type),
                ),
                ListTile(
                  title: Text("社辦地點"),
                  subtitle:
                      post.office != null ? Text(post.office) : Text("社辦地點"),
                ),
                ListTile(
                  title: Text("屆數"),
                  subtitle: post.session != null
                      ? Text("第${post.session}屆")
                      : Text("第?屆"),
                ),
                ListTile(
                  title: Text("指導老師"),
                  subtitle:
                      post.teacher != null ? Text(post.teacher) : Text("指導老師"),
                ),
                ListTile(
                  title: Text("社費"),
                  subtitle: post.teacher != null
                      ? Text("${post.fee}元/學期")
                      : Text("社費"),
                ),
                ListTile(
                  title: Text("簡介"),
                  subtitle: post.introduction != null
                      ? Text(post.introduction)
                      : Text(""),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
