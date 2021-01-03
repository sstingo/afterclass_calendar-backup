import 'package:url_launcher/url_launcher.dart';

class NidModel {
  static String _nid = null;
  //系級之類的資料
  static void getNidInServer() async {
    const url =
        'https://opendata.fcu.edu.tw/fcuOauth/Auth.aspx?client_id=637356179892.85900a2e0fa14118af35e182d64e0d7b.app.iosclub.tw&client_url=http://app.iosclub.tw:9080';
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'error ure $url';
    }
  }

  static String getnid() {
    return _nid;
  }
}
