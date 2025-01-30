class Booking {
  final String id;
  final String userId;
  final String roomId;
  final String checkInDate;
  final String checkOutDate;
  final double totalPrice;
  final String bookingStatus;

  Booking({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.totalPrice,
    required this.bookingStatus,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'],
      userId: json['user_id'],
      roomId: json['room_id'],
      checkInDate: json['check_in_date'],
      checkOutDate: json['check_out_date'],
      totalPrice: json['total_price'],
      bookingStatus: json['booking_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'room_id': roomId,
      'check_in_date': checkInDate,
      'check_out_date': checkOutDate,
      'total_price': totalPrice,
      'booking_status': bookingStatus,
    };
  }
}
