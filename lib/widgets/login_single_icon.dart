import 'package:flutter/material.dart';

class LoginSingleIcon extends StatelessWidget {
  const LoginSingleIcon({super.key, required this.asset});
  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        asset,
        height: 135,
        width: 135,
      ),
    );
  }
}
