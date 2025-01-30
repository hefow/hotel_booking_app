import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthService {
  static const String baseUrl = 'http://10.0.2.2:5000/api/users';

  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If login is successful, parse the response and return it
      return json.decode(response.body);
    } else {
      // If login failed, show the error message
      final errorMessage =
          response.body.isNotEmpty ? response.body : 'Unknown error occurred';
      throw Exception('Login failed: $errorMessage');
    }
  }

  // Future<Map<String, dynamic>> login(String email, String password) async {
  //   final url = Uri.parse('$baseUrl/users/login');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({'email': email, 'password': password}),
  //   );

  //   if (response.statusCode == 200) {
  //       // Return the login data
  //       return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to login: ${response.body}');
  //   }
  // }

  // Future<void> login(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/users/login'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // If login is successful, save the token
  //     final data = json.decode(response.body);
  //     final token = data['token']; // assuming 'token' is in the response body

  //     // Store token in SharedPreferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('token', token);
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to login: ${response.body}');
  //   }
  // }

  // Future<Map<String, dynamic>> login(String email, String password) async {
  //   final url = Uri.parse('$baseUrl/users/login');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({'email': email, 'password': password}),
  //   );

  //   if (response.statusCode == 200) {
  //     // Check if the server returned a cookie with the token
  //     final cookie = response.headers['set-cookie'];
  //     if (cookie != null) {
  //       // Store the cookies in the cookieJar manually
  //       cookieJar.saveFromResponse(url, [Cookie.fromSetCookieValue(cookie)]);

  //       // Debugging: Print the stored cookies
  //       final cookies = await cookieJar.loadForRequest(url);
  //       print('Cookies after login: $cookies');
  //       // Return the login data (optional)
  //       return json.decode(response.body);
  //     }
  //     throw Exception('No cookie found in the response');
  //   } else {
  //     throw Exception('Failed to login: ${response.body}');
  //   }
  // }
}
