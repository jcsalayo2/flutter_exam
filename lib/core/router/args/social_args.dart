import 'package:flutter/material.dart';
import 'package:flutter_exam/models/social_model.dart';

class SocialArgs {
  final Social social;
  MaterialColor color;
  SocialArgs({
    required this.social,
    this.color = Colors.amber,
  });
}
