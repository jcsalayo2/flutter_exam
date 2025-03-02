import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exam/models/social_model.dart';
import 'package:http/http.dart' as http;

class SocialServices {
  Future<List<Social>> getSocials() async {
    final response = await http.get(
      Uri.parse('${dotenv.env['INDEX_CODEX_API']}/socials'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "CLIENT_ID": dotenv.env['CLIENT_ID'].toString()
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return socialFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return [];
    }
  }
}
