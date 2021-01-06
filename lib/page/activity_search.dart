import 'dart:convert';

import 'package:afterclass_calendar/activity_service/activity_http.dart';
import 'package:afterclass_calendar/activity_service/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'activity_detail.dart';

final ActivityHttp activityhttp = ActivityHttp();

class ActivitySearch extends SearchDelegate<ActivityPost> {
  // final UnmodifiableListView<Post2> post2;
  // SearchClub(this.post2);
  Future<List<ActivityPost>> sendData() async {
    var search = {'search': '$query'};
    var json = jsonEncode(search);

    var url = 'http://140.134.79.128:40130/activity';
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<dynamic> body = jsonDecode(response.body);
    List<ActivityPost> posts =
        body.map((dynamic item) => ActivityPost.fromJson(item)).toList();
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
    sendData();
    return FutureBuilder(
      future: sendData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ActivityPost>> snapshot) {
        if (snapshot.hasData) {
          List<ActivityPost> posts = snapshot.data;
          return GridView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 0,
              // childAspectRatio: 1,
            ),
            children: posts
                .map(
                  (ActivityPost post) => Column(
                    children: <Widget>[
                      FlatButton(
                        child: Image.asset(
                          'images/unnamed.jpg',
                          width: 110,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ActivityDetail(
                                    post: post,
                                  )));
                        },
                      ),
                      Text(post.name)
                    ],
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
