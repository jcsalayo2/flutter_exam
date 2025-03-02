import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/screens/home/home_page.dart';
import 'package:flutter_exam/screens/login/login_page.dart';
import 'package:flutter_exam/screens/social/other_social_page.dart';
import 'package:flutter_exam/screens/social/social_page.dart';

/*This file uses Fluro [https://pub.dev/packages/fluro] because fluro is a 
straightforward package when it comes to routing with params */
class FloruRouter {
  static FluroRouter fluroRouter = FluroRouter();

  static var homePageHandler = Handler(
      handlerFunc: ((BuildContext? context, Map<String, dynamic> params) {
    return HomePage();
  }));

  static var loginPageHandler = Handler(
      handlerFunc: ((BuildContext? context, Map<String, dynamic> params) {
    return LoginPage();
  }));

  static var socialPageHandler = Handler(
      handlerFunc: ((BuildContext? context, Map<String, dynamic> params) {
    return SocialPage();
  }));

  static var otherSocialPageHandler = Handler(
      handlerFunc: ((BuildContext? context, Map<String, dynamic> params) {
    return OtherSocialPage();
  }));

  static initRoutes() {
    fluroRouter.define('/home', handler: homePageHandler);
    fluroRouter.define('/', handler: loginPageHandler);
    fluroRouter.define('/social/:social', handler: socialPageHandler);
    fluroRouter.define('/other', handler: otherSocialPageHandler);
  }
}
