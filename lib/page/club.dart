import 'package:afterclass_calendar/page/club_detail.dart';
import 'package:afterclass_calendar/page/club_search.dart';
import 'package:flutter/material.dart';
import '../club_service/club_http.dart';
import '../club_service/club_model.dart';

final ClubHttp clubhttp = ClubHttp();

class Club extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //    final bool alreadySaved = _saved.contains(pair);
    //  bool alreadySaved = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("社團"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ClubSearch(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: clubhttp.getClubPost(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ClubPost>> snapshot) {
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
                      //  trailing: Icon(Icons.keyboard_arrow_right),
                      // trailing:
                      // new Icon(
                      //    alreadySaved ? Icons.favorite : Icons.favorite_border,
                      //    color: alreadySaved ? Colors.red : null,
                      // ),
                      // trailing: new Icon(
                      //   alreadySaved ? Icons.favorite_border : Icons.favorite,
                      //   color: alreadySaved ? Colors.red : null,
                      // ),
                      // trailing:
                      //   IconButton (
                      //     icon: Icon(Icons.favorite_border),
                      //     onPressed: () {

                      //     }

                      //   ),
                      trailing: IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: () {}),
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
      ),
    );
  }
//   void _toggleFavorite() {
// //  setState(() {
//     if (alreadySaved) {
//       alreadySaved = false;
//     } else {
//      alreadySaved = true;
//     }
//   );
// }
}
