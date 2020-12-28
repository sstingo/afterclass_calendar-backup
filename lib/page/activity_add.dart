import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ActivityAdd extends StatelessWidget {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _moneyController = TextEditingController();
  var a = '';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新增活動'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _unameController, //設定

              decoration: InputDecoration(
                labelText: "活動名稱",
                hintText: "輸入該次活動名稱",
                prefixIcon: Icon(Icons.business_center),
              ),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                  labelText: "地點",
                  hintText: "您的活動地點",
                  prefixIcon: Icon(Icons.place)),
            ),
            TextField(
              controller: _moneyController,
              // ignore: deprecated_member_use
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: "入場費",
                  hintText: "活動費用",
                  prefixIcon: Icon(Icons.attach_money)),
            ),
            RaisedButton(
              child: Text("送出"),
              onPressed: () async {
                var url = 'http://140.134.79.128:40130/addActivity';
                var search = {
                  'name': _unameController.text,
                  'location': _locationController.text,
                  'money': _moneyController.text
                };
                var json = jsonEncode(search);
                // ignore: unused_local_variable
                var response = await http.post(url,
                    headers: {
                      'Content-Type': 'application/json; charset=UTF-8'
                    },
                    body: json);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
