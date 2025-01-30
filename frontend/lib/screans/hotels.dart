// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service
// import 'package:frontend/components/hotel_controller.dart'; // Import the controller
// import 'package:frontend/screans/booking.dart'; // Import the booking page

// class HotelsDetail extends StatelessWidget {
//   final String? id;

//   const HotelsDetail({super.key, this.id});

//   @override
//   Widget build(BuildContext context) {
//     final hotelController = Get.find<HotelController>();

//     IconData _getAmenityIcon(String amenity) {
//       switch (amenity) {
//         case 'Pool':
//           return Icons.pool;
//         case 'WiFi':
//           return Icons.wifi;
//         case 'Parking':
//           return Icons.local_parking;
//         case 'Spa':
//           return Icons.spa;
//         case 'Gym':
//           return Icons.fitness_center;
//         default:
//           return Icons.help;
//       }
//     }

//     Widget _facilityIcon(IconData icon, String name) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 40, color: Colors.blue),
//           SizedBox(height: 8),
//           Text(
//             name,
//             style: TextStyle(fontSize: 16, color: Colors.black),
//           ),
//         ],
//       );
//     }

//     return Scaffold(
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: HotelService()
//             .fetchHotelById(id ?? ''), // Fetch hotel details by ID
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotel details available'));
//           }

//           var hotel = snapshot.data!;

//           return Column(
//             children: [
//               const SizedBox(height: 60), // Space at the top
//               // Hotel image
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(
//                     hotel['image'] ?? '',
//                     fit: BoxFit.cover,
//                     height: 350,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Hotel Details
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Hotel name and price
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           hotel['name'] ?? 'N/A',
//                           style: const TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: '\$${hotel['pricePerNight']}',
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const TextSpan(
//                                 text: '/Night',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on,
//                             size: 25, color: Colors.red),
//                         const SizedBox(width: 5),
//                         Text(
//                           hotel['location'] ?? 'N/A',
//                           style:
//                               const TextStyle(color: Colors.grey, fontSize: 20),
//                         ),
//                         const SizedBox(width: 10),
//                         const Icon(Icons.star, size: 25, color: Colors.orange),
//                         Text(
//                           hotel['rating'].toString(),
//                           style:
//                               const TextStyle(color: Colors.grey, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'Description',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       hotel['description'] ?? 'No description available.',
//                       style: const TextStyle(color: Colors.grey, fontSize: 18),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),

//                     const SizedBox(height: 25),
//                     const Text(
//                       'Amenities',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 15),
//                     // Displaying amenities list
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: hotel['amenities']
//                           .map<Widget>((amenity) => Text(
//                                 amenity,
//                                 style: const TextStyle(
//                                     color: Colors.grey, fontSize: 18),
//                               ))
//                           .toList(),
//                     ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //   children: hotel['amenities']
//                     //       .map<Widget>((amenity) => _facilityIcon(
//                     //           _getAmenityIcon(amenity),
//                     //           amenity)) // Use dynamic icons
//                     //       .toList(),
//                     // ),
//                     const SizedBox(height: 25),
//                     const Text(
//                       'Facilities',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 25),
//                     // Book Now Button
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color.fromARGB(255, 75, 84, 207),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           minimumSize: const Size(double.infinity, 50),
//                         ),
//                         onPressed: () {
//                           Get.to(() => const Booking());
//                         },
//                         child: const Text(
//                           'Book Now',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend/services/hotel_service.dart'; // Import the service
import 'package:frontend/components/hotel_controller.dart'; // Import the controller
import 'package:frontend/screans/booking.dart'; // Import the booking page

class HotelsDetail extends StatelessWidget {
  final String? id;

  const HotelsDetail({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final hotelController = Get.find<HotelController>();

    IconData getAmenityIcon(String amenity) {
      switch (amenity) {
        case 'Pool':
          return Icons.pool;
        case 'WiFi':
          return Icons.wifi;
        case 'Parking':
          return Icons.local_parking;
        case 'Spa':
          return Icons.spa;
        case 'Gym':
          return Icons.fitness_center;
        default:
          return Icons.help;
      }
    }

    Widget facilityIcon(IconData icon, String name) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      );
    }

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: HotelService()
            .fetchHotelById(id ?? ''), // Fetch hotel details by ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hotel details available'));
          }

          var hotel = snapshot.data!;

          return Column(
            children: [
              const SizedBox(height: 60), // Space at the top
              // Hotel image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    hotel['image'] ?? '',
                    fit: BoxFit.cover,
                    height: 350,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Hotel Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel name and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotel['name'] ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$${hotel['pricePerNight']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '/Night',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 25, color: Colors.red),
                        const SizedBox(width: 5),
                        Text(
                          hotel['location'] ?? 'N/A',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.star, size: 25, color: Colors.orange),
                        Text(
                          hotel['rating'].toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      hotel['description'] ?? 'No description available.',
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 25),
                    const Text(
                      'Amenities',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    // Displaying amenities as icons with text
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: hotel['amenities']
                          .map<Widget>((amenity) => facilityIcon(
                              getAmenityIcon(amenity), amenity)) // Icons + Name
                          .toList(),
                    ),

                    const SizedBox(height: 25),
                    const Text(
                      'Facilities',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    // Book Now Button
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 75, 84, 207),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                          ),
                        onPressed: () {
                          Get.to(() => Booking(
                                hotelId: hotel["_id"],
                              ));
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
