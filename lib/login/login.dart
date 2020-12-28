import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //    final bool alreadySaved = _saved.contains(pair);
    //  bool alreadySaved = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('登入'),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              Text("NID登入"),
              Text("訪客登入"),
            ],
          ),
        ),
      ),
    );
  }
}
