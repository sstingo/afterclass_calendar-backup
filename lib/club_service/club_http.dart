import 'dart:convert';
import 'package:http/http.dart';

import 'club_model.dart';

class ClubHttp {
  // final String url = "http://140.134.79.128:40130/club";
  final String url = "http://192.168.100.40:40130/club";

  Future<List<ClubPost>> getClubPost() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ClubPost> posts =
          body.map((dynamic item) => ClubPost.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
