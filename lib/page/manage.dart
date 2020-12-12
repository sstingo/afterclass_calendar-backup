import 'package:afterclass_calendar/page/manage_datail.dart';
import 'package:flutter/material.dart';

class Manage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("社員"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "images/圖片顯示中.jpg",
                  ),
                ),
                title: Text("逢甲大學 iOS Club 志工隊"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ManageDetail())),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "images/圖片顯示中.jpg",
                  ),
                ),
                title: Text("熱門音樂社"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ManageDetail())),
              ),
              ListTile(
                title: Text("社幹"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "images/圖片顯示中.jpg",
                  ),
                ),
                title: Text("琴韻吉他社"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ManageDetail())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
