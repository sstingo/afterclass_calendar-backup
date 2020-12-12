import 'package:flutter/foundation.dart';

class ClubPost {
  final String id;
  final String name;
  final String type;
  final String office;
  final int session;
  final String teacher;
  final int fee;
  final String introduction;
  final String logo;

  ClubPost({
    @required this.id, //社團id
    @required this.name, //社團名稱
    @required this.type, //社團
    @required this.office, //社辦位置
    @required this.session, //屆數
    @required this.teacher, //指導老師
    @required this.fee, //社費
    @required this.introduction, //簡介
    @required this.logo, //頭像,封面
  });

  factory ClubPost.fromJson(Map<String, dynamic> json) {
    return ClubPost(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      office: json['office'] as String,
      session: json['session'] as int,
      teacher: json['teacher'] as String,
      fee: json['fee'] as int,
      introduction: json['introduction'] as String,
      logo: json['logo'] as String,
    );
  }
}
