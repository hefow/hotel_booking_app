import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RoomService {
  // final String baseUrl =
  //     "http://10.0.2.2:5000/api/rooms"; // Your backend API base URL

  // Fetch rooms by hotel ID
  static const String apiUrl = 'http://192.168.1.18:5000/api/rooms';

  // Fetch rooms from the backend
  Future<List<dynamic>> fetchRooms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print("You need to login first.");
      return [];
    }

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization':
            'Bearer $token', // Send token in the Authorization header
      },
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load hotels');
    }
  }

  Future<List<dynamic>> getRoomsByHotel(String hotelId) async {
    final response = await http
        .get(Uri.parse('http://192.168.1.18:5000/api/rooms?hotelId=$hotelId'));

    // Print out the status code and the response body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('_id $hotelId');

    if (response.statusCode == 200) {
      return List<dynamic>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load rooms');
    }
  }
}
