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
        child: Container(
          width: 200,
          height: 150,
          // decoration: BoxDecoration(color: Colors.red), /////////////////
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //, backgroundColor: Color(0xAARRGGBB)
                  Image.asset(
                    "images/ic_launcher.png",
                    width: 50,
                  ),
                  // ListTile(
                  //   title: Text("NID登入"),
                  //   onTap: () {},
                  // ),
                  Text("NID登入", style: TextStyle(fontSize: 18)),
                  Text("訪客登入", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
