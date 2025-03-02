import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/screens/login/bloc/login_bloc.dart';
import 'package:flutter_exam/utilities/constants.dart';
import 'package:flutter_exam/widgets/login_icons.dart';
import 'package:flutter_exam/widgets/otp_dialog.dart';
import 'package:flutter_exam/widgets/user_name_field.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(GetCredentials()),
      child: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userNameController = TextEditingController();
  var otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginError) {
          showDialog(
              context: context,
              builder: (BuildContext _) {
                return loginErrorDialog();
              });
        }
        if (state.isLoggedIn) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Theme(
                    data: ThemeData(platform: TargetPlatform.iOS),
                    child: const CircularProgressIndicator.adaptive()),
                Center(child: Text("Loggin In"))
              ],
            ),
          );
        }
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: LoginIcons(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UserNameField(userNameController: userNameController),
                      if (state.userNameError.isNotEmpty)
                        Center(
                            child: Text(
                          state.userNameError,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FilledButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            )),
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                userNameController.text.isEmpty ||
                                        state.userNameError.isNotEmpty
                                    ? Colors.grey
                                    : Colors.green),
                          ),
                          onPressed: userNameController.text.isEmpty ||
                                  state.userNameError.isNotEmpty
                              ? null
                              : () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext _) {
                                        otpController.text = '';
                                        return otpDialog(login: context);
                                      });
                                },
                          child: const Text(
                            'Enter',
                            style: TextStyle(fontSize: 18, height: 3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget otpDialog({required BuildContext login}) {
    return OtpDialog(
        otpController: otpController,
        userNameController: userNameController,
        login: login);
  }

  Widget loginErrorDialog() {
    return CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text("Login Failed, please try again"),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Close',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ))
      ],
    );
  }
}
