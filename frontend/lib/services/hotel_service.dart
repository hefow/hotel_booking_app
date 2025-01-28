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
   // Fetch hotel by ID
  Future<Map<String, dynamic>> fetchHotelById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      // return json.decode(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load hotel');
    }
  }

   // Search hotels by location or price range
  Future<List<dynamic>> searchHotels({String? location, double? minPrice, double? maxPrice}) async {
    try {
      final queryParameters = {
        if (location != null && location.isNotEmpty) 'location': location,
        if (minPrice != null) 'minPrice': minPrice.toString(),
        if (maxPrice != null) 'maxPrice': maxPrice.toString(),
      };

      final response = await http.get(
        Uri.parse('$apiUrl/search')
          .replace(queryParameters: queryParameters),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}



