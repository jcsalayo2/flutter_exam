import 'package:flutter/material.dart';
import 'package:flutter_exam/models/social_model.dart';

final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
final socialColors = {
  "youtube": Colors.red,
  "facebook": Colors.blue,
  "spotify": Colors.green,
};

final otherSocials = [
  Social(
    name: "Samsung",
    history: "",
    iconUrl: "assets/images/samsung.png",
    imgUrl: "",
    webUrl: "https://www.samsung.com/ph/",
  ),
  Social(
    name: "Apple",
    history: "",
    iconUrl: "assets/images/apple.png",
    imgUrl: "",
    webUrl: "https://www.apple.com/",
  ),
  Social(
    name: "Windows",
    history: "",
    iconUrl: "assets/images/windows.png",
    imgUrl: "",
    webUrl: "https://www.microsoft.com/en-us/windows?r=1",
  ),
];
