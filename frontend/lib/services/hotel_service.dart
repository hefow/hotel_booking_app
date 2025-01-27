import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelService {
  static const String apiUrl = 'http://10.0.2.2:5000/api/hotels';

  // Fetch hotels from the backend
  Future<List<dynamic>> fetchHotels() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
