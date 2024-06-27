import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/models/location.dart'; // Update the path to your Location model if needed

class AuthResponse {
  final String apiUrl =
      'http://$kIpAddress:8081/api/locations/auth/login'; // Replace with actual IP address

  Future<Location?> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return Location.fromJason(responseData);
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
