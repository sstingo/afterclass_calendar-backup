import 'dart:convert';

import 'package:afterclass_calendar/club_service/club_model.dart';
import 'package:afterclass_calendar/page/club.dart';
import 'package:afterclass_calendar/page/club_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClubSearch extends SearchDelegate<ClubPost> {
  // final Stream<List<ClubPost>> post;
  // ClubSearch(this.post);

  Future<List<ClubPost>> sendData() async {
    var search = {'search': '$query'};
    var json = jsonEncode(search);

    // var url = 'http://140.134.79.128:40130/club';
    var url = "http://192.168.100.54:40130/club";
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<dynamic> body = jsonDecode(response.body);
    List<ClubPost> posts =
        body.map((dynamic item) => ClubPost.fromJson(item)).toList();
    return posts;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // sendData();

    return FutureBuilder(
      future: sendData(),
      builder: (BuildContext context, AsyncSnapshot<List<ClubPost>> snapshot) {
        if (snapshot.hasData) {
          List<ClubPost> posts = snapshot.data;
          return ListView(
            children: posts
                .map(
                  (ClubPost post) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: post.logo != null
                          ? NetworkImage(post.logo)
                          : AssetImage(
                              "images/圖片顯示中.jpg",
                            ),
                    ),
                    title: Text(post.name),
                    subtitle: Text(
                      post.id.toString(),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ClubDetail(
                              post: post,
                            ))),
                  ),
                )
                .toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

//https://flutter.dev/docs/cookbook/networking/send-data
//https://www.linkedin.com/pulse/how-send-data-from-flutter-app-mysql-database-raushan-jha?articleId=6630201449903153152
