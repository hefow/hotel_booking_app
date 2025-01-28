// // import 'package:flutter/material.dart';
// // import 'package:frontend/components/hotel_controller.dart';
// // import 'package:frontend/screans/booking.dart';
// // import 'package:get/get.dart';

// // class HotelsDetail extends StatefulWidget {
// //   const HotelsDetail({super.key});

// //   @override
// //   State<HotelsDetail> createState() => _HotelsState();
// // }

// // final List<String> hotelImages = [
// //   'assets/images/a.jpg', // Replace with your image paths
// //   'assets/images/Bath1.jpg',
// //   'assets/images/Pool1.jpg',
// // ];

// // class _HotelsState extends State<HotelsDetail> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final hotelController = Get.find<HotelController>();
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           const SizedBox(height: 60), // Space at the top
// //           // Horizontal image carousel with "Details" text
// //           SizedBox(
// //             height: 345,
// //             child: PageView.builder(
// //               itemCount: hotelImages.length,
// //               scrollDirection: Axis.horizontal,
// //               itemBuilder: (context, index) {
// //                 return Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 10),
// //                   child: Stack(
// //                     children: [
// //                       // Hotel image with rounded corners
// //                       ClipRRect(
// //                         borderRadius: BorderRadius.circular(20),
// //                         child: Image.network(
// //                           hotelController.selectedHotel['imageUrl'] ?? '',
// //                           fit: BoxFit.cover,
// //                           height: 950,
// //                           width: double.infinity,
// //                         ),
// //                       ),
// //                       // Back button
// //                       const Positioned(
// //                         top: 40,
// //                         left: 20,
// //                         child: CircleAvatar(
// //                           backgroundColor: Colors.white,
// //                           child: Icon(Icons.arrow_back, color: Colors.black),
// //                         ),
// //                       ),
// //                       // Favorite button
// //                       const Positioned(
// //                         top: 40,
// //                         right: 20,
// //                         child: CircleAvatar(
// //                           backgroundColor: Colors.white,
// //                           child: Icon(Icons.favorite, color: Colors.red),
// //                         ),
// //                       ),
// //                       // Centered "Details" text
// //                       const Positioned(
// //                         top: 35,
// //                         left: 0,
// //                         right: 0,
// //                         child: Center(
// //                           child: Text(
// //                             'Details',
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                               shadows: [
// //                                 Shadow(
// //                                   blurRadius: 10.0,
// //                                   color: Colors.black,
// //                                   offset: Offset(0, 2),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           // Hotel Details
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Hotel name and price
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       hotelController.selectedHotel['title'] ?? 'N/A',
// //                       style: const TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     RichText(
// //                       text: TextSpan(
// //                         children: [
// //                           TextSpan(
// //                             text:
// //                                 hotelController.selectedHotel['price'] ?? '\$0',
// //                             style: const TextStyle(
// //                               fontSize: 20,
// //                               color: Colors.red,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           const TextSpan(
// //                             text: '/Night',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.grey,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 5),
// //                 const Row(
// //                   children: [
// //                     Icon(Icons.location_on, size: 16, color: Colors.red),
// //                     SizedBox(width: 5),
// //                     Text(
// //                       'South Kota',
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                     SizedBox(width: 10),
// //                     Icon(Icons.star, size: 16, color: Colors.orange),
// //                     Text(
// //                       '4.9',
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 15),
// //                 const Text(
// //                   'Description',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 15),
// //                 const Text(
// //                   'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center...',
// //                   style: TextStyle(color: Colors.grey),
// //                   maxLines: 3,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 GestureDetector(
// //                   onTap: () {},
// //                   child: const Text(
// //                     'Read More',
// //                     style: TextStyle(
// //                       color: Colors.blue,
// //                       decoration: TextDecoration.underline,
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 25),
// //                 const Text(
// //                   'Facilities',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 30),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     _facilityIcon(Icons.pool, 'Pool'),
// //                     _facilityIcon(Icons.wifi, 'WiFi'),
// //                     _facilityIcon(Icons.local_parking, 'Parking'),
// //                     _facilityIcon(Icons.spa, 'Spa'),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           // Divider Line
// //           const Divider(
// //             thickness: 1,
// //             color: Color.fromARGB(255, 230, 226, 226),
// //             indent: 20,
// //             endIndent: 20,
// //           ),
// //           const SizedBox(height: 25),
// //           // Book Now Button
// //           Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color.fromARGB(255, 75, 84, 207),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //                 minimumSize: const Size(double.infinity, 50),
// //               ),
// //               onPressed: () {
// //                 Get.to(() => const Booking());
// //               },
// //               child: const Text(
// //                 'Book Now',
// //                 style: TextStyle(fontSize: 18, color: Colors.white),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _facilityIcon(IconData icon, String label) {
// //     return Column(
// //       children: [
// //         CircleAvatar(
// //           backgroundColor: Colors.grey[200],
// //           child: Icon(icon, color: const Color.fromARGB(255, 9, 106, 185)),
// //         ),
// //         const SizedBox(height: 5),
// //         Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:frontend/components/hotel_controller.dart';
// import 'package:frontend/screans/booking.dart';

// class HotelsDetail extends StatelessWidget {
//   const HotelsDetail({super.key, required this.id});

//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     final hotelController = Get.find<HotelController>();

//     return Scaffold(
//       body: Obx(() {
//         final hotel = hotelController.selectedHotel.value;
//         return hotel.isEmpty
//             ? const Center(child: CircularProgressIndicator())
//             : Column(
//                 children: [
//                   const SizedBox(height: 60),
//                   // Displaying hotel images
//                   SizedBox(
//                     height: 345,
//                     child: PageView.builder(
//                       itemCount: hotel['image']?.length ?? 0,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(
//                               hotel['image'][index] ?? '',
//                               fit: BoxFit.cover,
//                               height: 950,
//                               width: double.infinity,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Hotel Details
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           hotel['name'] ?? 'N/A',
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 16, color: Colors.red),
//                             SizedBox(width: 5),
//                             Text(
//                               hotel['location'] ?? 'Location Not Available',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         const Text(
//                           'Description',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 15),
//                         Text(
//                           hotel['description'] ?? 'No description available.',
//                           style: TextStyle(color: Colors.grey),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 10),
//                         const SizedBox(height: 25),
//                         const Text(
//                           'Facilities',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             _facilityIcon(Icons.pool, 'Pool'),
//                             _facilityIcon(Icons.wifi, 'WiFi'),
//                             _facilityIcon(Icons.local_parking, 'Parking'),
//                             _facilityIcon(Icons.spa, 'Spa'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Book Now Button
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 75, 84, 207),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       onPressed: () {
//                         Get.to(() => const Booking());
//                       },
//                       child: const Text(
//                         'Book Now',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//       }),
//     );
//   }

//   Widget _facilityIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.grey[200],
//           child: Icon(icon, color: const Color.fromARGB(255, 9, 106, 185)),
//         ),
//         const SizedBox(height: 5),
//         Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
//       ],
//     );
//   }
// }
// ===============
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend/services/hotel_service.dart'; // Import the service
import 'package:frontend/components/hotel_controller.dart'; // Import the controller
import 'package:frontend/screans/booking.dart'; // Import the booking page

// class HotelsDetail extends StatelessWidget {
//   final String? id;

//   const HotelsDetail({super.key, this.id});

//   @override
//   Widget build(BuildContext context) {
//     final hotelController = Get.find<HotelController>();

//     return Scaffold(
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: HotelService().fetchHotelById(id ?? ''), // Fetch hotel details by ID
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
//                             fontSize: 22,
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
//                                   fontSize: 16,
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
//                         Icon(Icons.location_on, size: 16, color: Colors.red),
//                         const SizedBox(width: 5),
//                         Text(
//                           hotel['location'] ?? 'N/A',
//                           style: const TextStyle(color: Colors.grey),
//                         ),
//                         const SizedBox(width: 10),
//                         Icon(Icons.star, size: 16, color: Colors.orange),
//                         Text(
//                           hotel['rating'].toString(),
//                           style: const TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'Description',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       hotel['description'] ?? 'No description available.',
//                       style: const TextStyle(color: Colors.grey),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {},
//                       child: const Text(
//                         'Read More',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     const Text(
//                       'Amenities',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 15),
//                     // Displaying amenities list
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: hotel['amenities']
//                           .map<Widget>((amenity) => Text(
//                                 amenity,
//                                 style: const TextStyle(color: Colors.grey),
//                               ))
//                           .toList(),
//                     ),
//                     const SizedBox(height: 25),
//                     const Text(
//                       'Facilities',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         _facilityIcon(Icons.pool, 'Pool'),
//                         _facilityIcon(Icons.wifi, 'WiFi'),
//                         _facilityIcon(Icons.local_parking, 'Parking'),
//                         _facilityIcon(Icons.spa, 'Spa'),
//                       ],
//                     ),
//                     const SizedBox(height: 25),
//                     // Book Now Button
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(255, 75, 84, 207),
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

//   Widget _facilityIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.grey[200],
//           child: Icon(icon, color: const Color.fromARGB(255, 9, 106, 185)),
//         ),
//         const SizedBox(height: 5),
//         Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
//       ],
//     );
//   }
// }


class HotelsDetail extends StatelessWidget {
  final String? id;

  const HotelsDetail({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final hotelController = Get.find<HotelController>();

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: HotelService().fetchHotelById(id ?? ''), // Fetch hotel details by ID
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
                            fontSize: 22,
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
                                  fontSize: 16,
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
                        Icon(Icons.location_on, size: 16, color: Colors.red),
                        const SizedBox(width: 5),
                        Text(
                          hotel['location'] ?? 'N/A',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        Text(
                          hotel['rating'].toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      hotel['description'] ?? 'No description available.',
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Amenities',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    // Displaying amenities list
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: hotel['amenities']
                          .map<Widget>((amenity) => Text(
                                amenity,
                                style: const TextStyle(color: Colors.grey),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Facilities',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _facilityIcon(Icons.pool, 'Pool'),
                        _facilityIcon(Icons.wifi, 'WiFi'),
                        _facilityIcon(Icons.local_parking, 'Parking'),
                        _facilityIcon(Icons.spa, 'Spa'),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Book Now Button
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 75, 84, 207),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Get.to(() => const Booking());
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

  Widget _facilityIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: const Color.fromARGB(255, 9, 106, 185)),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}
