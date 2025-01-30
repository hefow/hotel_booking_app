import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/room_model.dart';  // Import the Room model file.

class RoomService {
  final String baseUrl = "http://10.0.2.2:5000/api/rooms"; // Your backend API base URL

  // Fetch rooms by hotel ID
  Future<List<Room>> getRoomsByHotel(String hotelId) async {
    final response = await http.get(Uri.parse('$baseUrl/$hotelId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Room.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }
}
