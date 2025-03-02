import 'package:flutter_exam/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String userid = "userId";
  static const String userName = "userName";
  static const String loginStatus = "loginStatus";
  static const String profilePicture = "profilePicture";

  SharedPreferencesManager();

  Future<void> removeCredentials() async {
    var pref = await SharedPreferences.getInstance();

    await pref.setString(userid, "");
    await pref.setString(userName, "");
    await pref.setString(loginStatus, "");
    await pref.setString(profilePicture, "");
  }

  Future<void> saveCredentials(LoginResponse loginResponse) async {
    var pref = await SharedPreferences.getInstance();

    await pref.setString(userid, loginResponse.userId);
    await pref.setString(userName, loginResponse.userName);
    await pref.setString(loginStatus, loginResponse.loginStatus);
    await pref.setString(profilePicture, loginResponse.profilePicture);
  }

  Future<LoginResponse> getCredentials() async {
    var pref = await SharedPreferences.getInstance();

    return LoginResponse(
      loginStatus: pref.getString(loginStatus) ?? '',
      userId: pref.getString(userid) ?? '',
      userName: pref.getString(userName) ?? '',
      profilePicture: pref.getString(profilePicture) ?? '',
    );
  }
}
