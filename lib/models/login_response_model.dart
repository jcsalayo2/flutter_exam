// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String userId;
  String userName;
  String loginStatus;
  String profilePicture;

  LoginResponse({
    required this.userId,
    required this.userName,
    required this.loginStatus,
    required this.profilePicture,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["userId"],
        userName: json["userName"],
        loginStatus: json["loginStatus"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "loginStatus": loginStatus,
        "profilePicture": profilePicture,
      };
}
