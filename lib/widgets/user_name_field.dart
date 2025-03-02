import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/screens/login/bloc/login_bloc.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    required this.userNameController,
  });

  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          forceErrorText: state.userNameError.isNotEmpty ? '' : null,
          keyboardType: TextInputType.text,
          controller: userNameController,
          onChanged: (value) {
            context.read<LoginBloc>().add(ValidateUserName(userName: value));
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Colors.blueAccent)),
            labelText: "Username",
          ),
          style: const TextStyle(
            fontSize: 18,
          ),
        );
      },
    );
  }
}
