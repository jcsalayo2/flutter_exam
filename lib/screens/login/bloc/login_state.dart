part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isLoggedIn;
  final bool loginError;
  final String userNameError;

  const LoginState({
    required this.isLoading,
    required this.isLoggedIn,
    required this.loginError,
    required this.userNameError,
  });

  LoginState.initial()
      : isLoading = false,
        isLoggedIn = false,
        loginError = false,
        userNameError = '';

  @override
  List<Object> get props => [
        isLoading,
        isLoggedIn,
        loginError,
        userNameError,
      ];

  LoginState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    bool? loginError,
    String? userNameError,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      loginError: loginError ?? this.loginError,
      userNameError: userNameError ?? this.userNameError,
    );
  }
}
