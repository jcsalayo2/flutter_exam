import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exam/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<LoginResponse?> login(String username, String otp) async {
    final response = await http.post(
      Uri.parse('${dotenv.env['INDEX_CODEX_API']}/login'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "CLIENT_ID": dotenv.env['CLIENT_ID'].toString()
      },
      body: jsonEncode(
        <String, Object>{
          "userName": username,
          "otp": otp,
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return null;
    }
  }
}
