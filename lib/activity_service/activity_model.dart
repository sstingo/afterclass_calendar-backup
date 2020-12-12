import 'package:flutter/foundation.dart';

class ActivityPost {
  final String id;
  final String name;
  final String time;
  final String location;
  final int fee;
  final String clubId;
  final String url;

  ActivityPost({
    @required this.id,
    @required this.name,
    @required this.time,
    @required this.location,
    @required this.fee,
    @required this.clubId,
    @required this.url,
  });

  factory ActivityPost.fromJson(Map<String, dynamic> json) {
    return ActivityPost(
      id: json['id'] as String,
      name: json['name'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      fee: json['fee'] as int,
      clubId: json['ckubId'] as String,
      url: json['url'] as String,
    );
  }
}
