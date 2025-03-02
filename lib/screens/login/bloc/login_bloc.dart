import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam/models/singleton/user_details_singleton.dart';
import 'package:flutter_exam/utilities/constants.dart';
import 'package:flutter_exam/utilities/login_services.dart';
import 'package:flutter_exam/utilities/shared_preference/shared_preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<GetCredentials>(_getCredentials);
    on<LoginButtonPressed>(_loginButtonPressed);
    on<ValidateUserName>(_validateUserName);
  }

  Future _getCredentials(GetCredentials event, Emitter<LoginState> emit) async {
    var currentUser = await SharedPreferencesManager().getCredentials();

    if (currentUser.loginStatus == '' ||
        currentUser.profilePicture == '' ||
        currentUser.userId == '' ||
        currentUser.userName == '') {
      return;
    } else {
      CurrentUser().setUserDetails(currentUser);
      emit(state.copyWith(
        isLoggedIn: true,
      ));
    }
  }

  Future _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    var result = await LoginServices().login(event.username, event.otp);

    if (result != null) {
      CurrentUser().setUserDetails(result);
      SharedPreferencesManager().saveCredentials(result);

      emit(state.copyWith(
        isLoggedIn: true,
      ));
    } else {
      emit(state.copyWith(
        isLoggedIn: false,
        isLoading: false,
        loginError: true,
      ));
      emit(state.copyWith(
        loginError: false,
      ));
    }
  }

  Future _validateUserName(
      ValidateUserName event, Emitter<LoginState> emit) async {
    if (event.userName.isEmpty) {
      emit(state.copyWith(userNameError: "please enter your username"));
      return;
    } else if (event.userName.length > 24) {
      emit(state.copyWith(userNameError: "Must not exceed 24 characters"));
      return;
    } else if (!validCharacters.hasMatch(event.userName)) {
      emit(state.copyWith(userNameError: "Values must be alphanumeric"));
      return;
    }

    emit(state.copyWith(userNameError: ""));
  }
}
