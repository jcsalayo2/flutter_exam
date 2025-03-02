import 'package:flutter/material.dart';
import 'package:flutter_exam/screens/login/login_page.dart';
import 'package:flutter_exam/widgets/login_single_icon.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 340,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: LoginSingleIcon(asset: "assets/images/youtube.png")),
          LoginSingleIcon(asset: "assets/images/spotify.png"),
          Positioned(
            right: 0,
            bottom: 0,
            child: LoginSingleIcon(asset: "assets/images/facebook.png"),
          ),
        ],
      ),
    );
  }
}
