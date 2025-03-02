import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/screens/login/bloc/login_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpDialog extends StatelessWidget {
  const OtpDialog({
    super.key,
    required this.otpController,
    required this.userNameController,
    required this.login,
  });

  final TextEditingController otpController;
  final TextEditingController userNameController;
  final BuildContext login;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        "Verify it's you",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            if (otpController.text.length < 6) {
              return;
            }
            Navigator.pop(context);
            login.read<LoginBloc>().add(LoginButtonPressed(
                username: userNameController.text, otp: otpController.text));
          },
          child: Text(
            "Enter",
            style: TextStyle(
              fontSize: 18,
              color: Colors.green,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
          ),
        )
      ],
      content: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please enter your 6 digit PIN",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Pinput(
              autofocus: true,
              preFilledWidget: Text(
                '-',
                style: TextStyle(fontSize: 28),
              ),
              defaultPinTheme: PinTheme(
                width: 35,
                height: 56,
                textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              controller: otpController,
              length: 6,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
