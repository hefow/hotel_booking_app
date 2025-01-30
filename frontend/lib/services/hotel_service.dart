import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HotelService {
  static const String apiUrl = 'http://10.0.2.2:5000/api/hotels';

  // Fetch hotels from the backend
  Future<List<dynamic>> fetchHotels() async {
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
//   Future<void> fetchHotels() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');

//   if (token == null) {
//     print("You need to login first.");
//     return;
//   }

//   final response = await http.get(
//     Uri.parse('http://localhost:5000/api/hotels'),
//     headers: {
//       'Authorization': 'Bearer $token', // Send token in the Authorization header
//     },
//   );

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     // Handle the response, for example, display the hotels
//     print("Hotels: $data");
//   } else if (response.statusCode == 401) {
//     print("Not authorized, please login");
//   } else {
//     print("Error fetching hotels: ${response.body}");
//   }
// }
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
    Future<List<dynamic>> searchHotels(
        {String? location, double? minPrice, double? maxPrice}) async {
      try {
        final queryParameters = {
          if (location != null && location.isNotEmpty) 'location': location,
          if (minPrice != null) 'minPrice': minPrice.toString(),
          if (maxPrice != null) 'maxPrice': maxPrice.toString(),
        };

        final response = await http.get(
          Uri.parse('$apiUrl/search').replace(queryParameters: queryParameters),
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
