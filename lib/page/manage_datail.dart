import 'package:afterclass_calendar/club_service/club_http.dart';
import 'package:afterclass_calendar/club_service/club_model.dart';
import 'package:afterclass_calendar/page/activity_add.dart';
import 'package:flutter/material.dart';

class ManageDetail extends StatelessWidget {
  // final ClubPost post;
  final ClubHttp clubHttp = ClubHttp();

  // ManageDetail({
  //   @required this.post,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("琴韻吉他社"),
        
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
                  title: Image.asset(
                    "images/圖片顯示中.jpg",
                    width: 100,
                  ),
                ),
                ListTile(
                  title: Text("測試"),
                ),
                RaisedButton(
                  child: Text("新增活動"),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ActivityAdd()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
