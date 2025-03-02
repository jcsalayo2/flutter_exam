// To parse this JSON data, do
//
//     final social = socialFromJson(jsonString);

import 'dart:convert';

List<Social> socialFromJson(String str) =>
    List<Social>.from(json.decode(str).map((x) => Social.fromJson(x)));

String socialToJson(List<Social> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Social {
  String name;
  String history;
  String iconUrl;
  String imgUrl;
  String webUrl;

  Social({
    required this.name,
    required this.history,
    required this.iconUrl,
    required this.imgUrl,
    required this.webUrl,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        name: json["name"],
        history: json["history"],
        iconUrl: json["iconUrl"],
        imgUrl: json["imgUrl"],
        webUrl: json["webUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "history": history,
        "iconUrl": iconUrl,
        "imgUrl": imgUrl,
        "webUrl": webUrl,
      };
}
