// import 'package:flutter/material.dart';
// import 'package:frontend/model/room_model.dart';
// import 'package:frontend/services/room_service.dart';

// class Booking extends StatefulWidget {
//   final String? hotelId;
//   const Booking({super.key, this.hotelId});

//   @override
//   State<Booking> createState() => _BookingState();
// }

// class _BookingState extends State<Booking> {
//   final BookingService _bookingService = BookingService();
//   late Future<List<Room>> _roomsFuture;

//     void initState() {
//     super.initState();
//     // Fetch the rooms when the screen is initialized
//     _roomsFuture = _bookingService.getRoomsByHotel(hotelId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select Room')),
//       body: FutureBuilder<List<Room>>(
//         future: _roomsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No rooms available'));
//           } else {
//             final rooms = snapshot.data!;

//             return ListView.builder(
//               itemCount: rooms.length,
//               itemBuilder: (context, index) {
//                 final room = rooms[index];

//                 return Card(
//                   margin: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text('${room.roomNumber} (${room.type})'),
//                     subtitle: Text(room.description),
//                     trailing: Icon(
//                       room.isAvailable ? Icons.check_circle : Icons.cancel,
//                       color: room.isAvailable ? Colors.green : Colors.red,
//                     ),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text('Room Details'),
//                             content: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text('Room Number: ${room.roomNumber}'),
//                                 Text('Type: ${room.type}'),
//                                 Text(
//                                     'Price: \$${room.price.toStringAsFixed(2)}'),
//                                 Text(
//                                     'Available: ${room.isAvailable ? 'Yes' : 'No'}'),
//                                 Text('Description: ${room.description}'),
//                                 SizedBox(height: 10),
//                                 Text('Amenities:'),
//                                 for (var amenity in room.amenities)
//                                   Text('- $amenity'),
//                                 if (room.photos.isNotEmpty) ...[
//                                   SizedBox(height: 10),
//                                   Text('Photos:'),
//                                   for (var photo in room.photos)
//                                     Image.network(photo),
//                                 ]
//                               ],
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text('OK'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/room_service.dart';

class Booking extends StatefulWidget {
  final String? hotelId;  // Hotel ID passed from the HotelsDetail page
  const Booking({super.key, this.hotelId});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final RoomService _bookingService = RoomService();

  late Future<List<Room>> _roomsFuture;

  @override
  void initState() {
    super.initState();
    // Use widget.hotelId to access the hotelId passed from HotelsDetail
    _roomsFuture = _bookingService.getRoomsByHotel(widget.hotelId!); // This will ensure hotelId is passed correctly
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Room')),
      body: FutureBuilder<List<Room>>(
        future: _roomsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No rooms available'));
          } else {
            final rooms = snapshot.data!;

            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];

                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('${room.roomNumber} (${room.type})'),
                    subtitle: Text(room.description),
                    trailing: Icon(
                      room.isAvailable ? Icons.check_circle : Icons.cancel,
                      color: room.isAvailable ? Colors.green : Colors.red,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Room Details'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Room Number: ${room.roomNumber}'),
                                Text('Type: ${room.type}'),
                                Text(
                                    'Price: \$${room.price.toStringAsFixed(2)}'),
                                Text(
                                    'Available: ${room.isAvailable ? 'Yes' : 'No'}'),
                                Text('Description: ${room.description}'),
                                SizedBox(height: 10),
                                Text('Amenities:'),
                                for (var amenity in room.amenities)
                                  Text('- $amenity'),
                                if (room.photos.isNotEmpty) ...[
                                  SizedBox(height: 10),
                                  Text('Photos:'),
                                  for (var photo in room.photos)
                                    Image.network(photo),
                                ]
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

