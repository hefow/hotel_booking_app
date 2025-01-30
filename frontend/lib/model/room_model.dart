class Room {
  final String id;
  final String roomNumber;
  final String type;
  final double price;
  final bool isAvailable;
  final List<String> amenities;
  final List<String> photos;
  final String description;

  Room({
    required this.id,
    required this.roomNumber,
    required this.type,
    required this.price,
    required this.isAvailable,
    required this.amenities,
    required this.photos,
    required this.description,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['_id'],
      roomNumber: json['roomNumber'],
      type: json['type'],
      price: json['price'],
      isAvailable: json['isAvailable'],
      amenities: List<String>.from(json['amenities']),
      photos: List<String>.from(json['photos']),
      description: json['description'] ?? '',
    );
  }
}
