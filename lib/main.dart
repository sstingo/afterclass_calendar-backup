import 'package:flutter/material.dart';
import 'package:afterclass_calendar/page/activity.dart';
import 'package:afterclass_calendar/page/calendar.dart';
import 'package:afterclass_calendar/page/club.dart';
import 'package:afterclass_calendar/page/manage.dart';
import 'package:afterclass_calendar/page/account.dart';
import 'package:afterclass_calendar/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavigationController(),
        // body: Login(),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  BottomNavigationController({Key key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [Calendar(), Activity(), Club(), Manage(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('課外活動行事曆'),
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              // ignore: deprecated_member_use
              title: Text('行事曆')),
          BottomNavigationBarItem(
              icon: Icon(Icons.terrain),
              // ignore: deprecated_member_use
              title: Text("活動資訊")),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              // ignore: deprecated_member_use
              title: Text('社團')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              // ignore: deprecated_member_use
              title: Text('管理')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text('個人資料')),
        ],
        currentIndex: _currentIndex, //目前選擇頁索引值
        selectedItemColor: Colors.blue[900], //選擇頁顏色
        unselectedItemColor: Colors.blue[300],
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
