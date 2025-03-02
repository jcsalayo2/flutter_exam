part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String otp;

  const LoginButtonPressed({
    required this.username,
    required this.otp,
  });
}

class GetCredentials extends LoginEvent {
  const GetCredentials();
  @override
  List<Object> get props => [];
}

class ValidateUserName extends LoginEvent {
  final String userName;
  const ValidateUserName({required this.userName});
}
