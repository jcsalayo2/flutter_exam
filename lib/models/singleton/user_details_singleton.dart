import 'package:flutter_exam/models/login_response_model.dart';

class CurrentUser {
  late String userName;
  late String userId;
  late String loginStatus;
  late String profilePicture;

  static final CurrentUser _userDetails = CurrentUser._internal();

  factory CurrentUser() {
    return _userDetails;
  }

  CurrentUser._internal();

  void setUserDetails(LoginResponse loginResponse) {
    userName = loginResponse.userName;
    userId = loginResponse.userId;
    loginStatus = loginResponse.loginStatus;
    profilePicture = loginResponse.profilePicture;
  }

  void clearUser() {
    userName = '';
    userId = '';
    loginStatus = '';
    profilePicture = '';
  }
}
