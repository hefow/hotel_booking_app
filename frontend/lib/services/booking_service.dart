import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/booking_model.dart';

class BookingService {
  final String baseUrl = "http://10.0.2.2:5000/api/book"; // Your backend API base URL

  // Add a new booking
  Future<Booking> addBooking(Booking booking) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(booking.toJson()),
    );

    if (response.statusCode == 200) {
      return Booking.fromJson(json.decode(response.body)['booking']);
    } else {
      throw Exception('Failed to add booking');
    }
  }

  // Get all bookings
  Future<List<Booking>> getBookings() async {
    final response = await http.get(Uri.parse('$baseUrl/bookings'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Booking.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  // Update booking status
  Future<Booking> updateBooking(String id, Booking booking) async {
    final response = await http.put(
      Uri.parse('$baseUrl/bookings/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(booking.toJson()),
    );

    if (response.statusCode == 200) {
      return Booking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update booking');
    }
  }

  // Delete booking
  Future<void> deleteBooking(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/bookings/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete booking');
    }
  }

  // Search bookings by user ID and booking status
  Future<List<Booking>> searchBookings({String? userId, String? bookingStatus}) async {
    final url = Uri.parse('$baseUrl/bookings/search?user_id=$userId&booking_status=$bookingStatus');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Booking.fromJson(item)).toList();
    } else {
      throw Exception('Failed to search bookings');
    }
  }
}
