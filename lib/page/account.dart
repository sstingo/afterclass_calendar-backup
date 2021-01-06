import 'dart:convert';

import 'package:afterclass_calendar/account_service/account_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class Account extends StatelessWidget {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10,
    keepScrollOffset: true,
  );

  Future<List<AccountPost>> sendData() async {
    var search = {'id': 'D0783030'};
    var json = jsonEncode(search);

    var url = 'http://140.134.79.128:40130/account';
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    List<dynamic> body = jsonDecode(response.body);
    List<AccountPost> post =
        body.map((dynamic item) => AccountPost.fromJson(item)).toList();
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('個人資料'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "images/圖片顯示中.jpg",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("姓名:  XXX"),
                            Text("系級:  資訊工程學系 2年級"),
                          ]),
                    ),
                  ]),
                ),
                ExpansionTile(
                  leading: Icon(Icons.check_box, color: Colors.blue),
                  title: Text("社團"),
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/圖片顯示中.jpg",
                        ),
                      ),
                      title: Text("逢甲大學 iOS Club 志工隊"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/圖片顯示中.jpg",
                        ),
                      ),
                      title: Text("熱門音樂社"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/圖片顯示中.jpg",
                        ),
                      ),
                      title: Text("琴韻吉他社"),
                      onTap: () {},
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.local_activity, color: Colors.yellow),
                  title: Text("活動"),
                ),
                ExpansionTile(
                  leading: Icon(Icons.favorite, color: Colors.red),
                  title: Text("追蹤中"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("設定"),
                ),
                RaisedButton(
                  child: Text('打卡qrcode'),
                  onPressed: () {
                    var now =
                        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("打卡qrcode"),
                            content: new Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              // height: MediaQuery.of(context).size.height * 0.5,
                              child: QrImage(
                                data: "D0746460," + now,
                                version: QrVersions.auto,
                                // size: 200.0,
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "CANCEL",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: Text('個人資料'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Card(
//             child: Column(children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(children: <Widget>[
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage(
//                       "images/圖片顯示中.jpg",
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text("姓名:  XXX"),
//                               Text(student.name)
//                             ],
//                           ),
//                           Text("系級:  資訊工程學系 2年級"),
//                         ]),
//                   ),
//                 ]),
//               ),
//               ExpansionTile(
//                 leading: Icon(Icons.check_box, color: Colors.blue),
//                 title: Text("社團"),
//                 children: <Widget>[
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(
//                         "images/圖片顯示中.jpg",
//                       ),
//                     ),
//                     title: Text("逢甲大學 iOS Club 志工隊"),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(
//                         "images/圖片顯示中.jpg",
//                       ),
//                     ),
//                     title: Text("熱門音樂社"),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(
//                         "images/圖片顯示中.jpg",
//                       ),
//                     ),
//                     title: Text("琴韻吉他社"),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 leading: Icon(Icons.local_activity, color: Colors.yellow),
//                 title: Text("活動"),
//               ),
//               ExpansionTile(
//                 leading: Icon(Icons.favorite, color: Colors.red),
//                 title: Text("追蹤中"),
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text("設定"),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );

// FutureBuilder(
//       future: sendData(),
//       builder: (BuildContext context, AsyncSnapshot<List<AccountPost>> snapshot) {
//         if (snapshot.hasData) {
//           List<AccountPost> post = snapshot.data;
//           return ListView.builder(
//             controller: scrollController,
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return Text(post[index].name);
//             },
//         //     children: posts
//         //         .map(
//         //           (AccountPost post) => ListTile(

//         //           ),
//         //         )
//         //         .toList(),
//         //   );
//         // } else {
//         //   return Center(child: CircularProgressIndicator());
//         // }
//       // },
//           ),
//         },
//       },
//     ),
