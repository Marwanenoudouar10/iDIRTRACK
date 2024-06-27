// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:idirtrack/constant.dart';

// class AuthService {
//   final String apiUrl = 'http://$kIpAddress:8081/api/locations/auth/login';

//   Future<Map<String, dynamic>> authenticate(
//       String username, String password) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'username': username,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       final token = responseData['jwt']; // Use 'jwt' instead of 'token'
//       return {
//         'token': token,
//       };
//     } else {
//       throw Exception('Failed to authenticate');
//     }
//   }

  // Future<String> loginUser(String username, String password) async {
  //   final apiUrl =
  //       Uri.parse('http://192.168.1.26:8081/api/locations/auth/login');
  //   final response = await http.post(
  //     apiUrl,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"username": username, "password": password}),
  //   );

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     throw Exception('Failed to login: ${response.body}');
  //   }
  // }

  // Future<String?> handleLogin(String username, String password) async {
  //   try {
  //     final response = await loginUser(username, password);
  //     if (response != null) {
  //       return response;
  //     } else {
  //       print("No response: $response");
  //       return null;
  //     }
  //   } on Exception catch (error) {
  //     print("Error during login: $error");
  //     return null;
  //   }
  // }

  // int? extractLocationIdFromResponse(String? response) {
  //   final parts = response?.split(',');
  //   if (parts!.isNotEmpty) {
  //     final locationIdString = parts[0].trim();
  //     return int.tryParse(locationIdString);
  //   }
  //   return null;
  // }
//}
