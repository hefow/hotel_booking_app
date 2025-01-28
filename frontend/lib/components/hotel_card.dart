// import 'package:flutter/material.dart';

// class HotelCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String location;
//   final String price;

//   const HotelCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.location,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: double.infinity,
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image Container with Bookmark Button
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.network(
//                   'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D',
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 180,
//                 right: 12,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFF5A5F),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.bookmark_outline,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Content Container
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 const Text(
//                   'Blue Nature',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 // Location
//                 Row(
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.location_on,
//                             size: 20,
//                             color: Colors.red,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             'South Kuta',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                           Container(
//                             child: Row(
//                               children: [
//                                 Text(
//                                   '\$80',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFFFF5A5F),
//                                   ),
//                                 ),
//                                 Text(
//                                   '/Night',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class HotelCard extends StatelessWidget {
// //   const HotelCard({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       clipBehavior: Clip.antiAlias,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Stack(
// //         children: [
// //           // Image with gradient overlay
// //           Container(
// //             height: 200,
// //             decoration: const BoxDecoration(
// //               image: DecorationImage(
// //                 image: NetworkImage(
// //                     'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D'),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             foregroundDecoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 begin: Alignment.topCenter,
// //                 end: Alignment.bottomCenter,
// //                 colors: [
// //                   Colors.transparent,
// //                   Colors.black.withOpacity(0.7),
// //                 ],
// //                 stops: const [0.5, 1.0],
// //               ),
// //             ),
// //           ),

// //           // Content
// //           const Positioned(
// //             bottom: 16,
// //             left: 16,
// //             right: 16,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Blue Nature',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Row(
// //                   children: [
// //                     Icon(
// //                       Icons.location_on,
// //                       color: Colors.white,
// //                       size: 16,
// //                     ),
// //                     SizedBox(width: 4),
// //                     Text(
// //                       'South Kuta',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 14,
// //                       ),
// //                     ),
// //                     Spacer(),
// //                     Text(
// //                       '\$80',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Text(
// //                       '/Night',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 14,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),

// //           // Bookmark button
// //           Positioned(
// //             top: 16,
// //             right: 16,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.red,
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               padding: const EdgeInsets.all(8),
// //               child: const Icon(
// //                 Icons.bookmark,
// //                 color: Colors.white,
// //                 size: 20,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';

import 'package:frontend/screans/hotels.dart';
import 'package:get/get.dart';

class HotelCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String pricePerNight;
  final String id;

  const HotelCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.pricePerNight,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to HotelDetail page and pass hotel details
        Get.to(() => HotelsDetail(
              id: id,
            ));
      },
      child: Container(
        width: 300,
        height: 300,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container with Bookmark Button
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF5A5F),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            // Content Container
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Location and Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            pricePerNight,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF5A5F),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '/Night',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
