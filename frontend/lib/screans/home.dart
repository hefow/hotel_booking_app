// import 'package:flutter/material.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';

// class HotelSearchPage extends StatelessWidget {
//   const HotelSearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Let\'s Find The Best Hotel',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         // Wrap the entire body with a vertical scroll view
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // TabBar for Categories
//               const DefaultTabController(
//                 length: 4,
//                 child: Column(
//                   children: [
//                     TabBar(
//                       indicatorColor: Colors.blue,
//                       labelColor: Colors.blue,
//                       unselectedLabelColor: Colors.grey,
//                       tabs: [
//                         Tab(text: 'Apartment'),
//                         Tab(text: 'Luxury'),
//                         Tab(text: 'Resorts'),
//                         Tab(text: 'Boats'),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                   ],
//                 ),
//               ),

//               // Horizontal Scroll for Hotels
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: const [
//                     HotelCard(
//                       imageUrl:
//                           'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Example image
//                       title: 'Sand Edge',
//                       location: 'Nusa Dua Beach',
//                       price: '\$95/Night',
//                     ),
//                     HotelCard(
//                       imageUrl:
//                           'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Example image
//                       title: 'Blue Nature',
//                       location: 'South Kuta',
//                       price: '\$80/Night',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // "Recommended Hotels" Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Text(
//                   'Recommended Hotels',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               // Vertical scroll for recommended hotels
//               SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: const [
//                     Recomended(),
//                     Recomended(),
//                     Recomended(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/hotel_card.dart';
import 'package:frontend/components/recomended.dart';
import 'package:frontend/services/hotel_service.dart'; // Import the service

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  late Future<List<dynamic>> hotels;

  @override
  void initState() {
    super.initState();
    hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Let\'s Find The Best Hotel',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: hotels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hotels available'));
          }

          // List of hotels fetched successfully
          var hotelList = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // TabBar for Categories (You can keep it or modify)
                  const DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'Apartment'),
                            Tab(text: 'Luxury'),
                            Tab(text: 'Resorts'),
                            Tab(text: 'Boats'),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),

                  // Horizontal Scroll for Hotels
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList.map<Widget>((hotel) {
                        return HotelCard(
                          imageUrl: hotel['image'] != null &&
                                  hotel['image']['data'] != null
                              ? 'data:image/png;base64,${base64Encode(hotel['image']['data'])}'
                              : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
                          title: hotel['name'],
                          location: hotel['location'],
                          price: '\$${hotel['pricePerNight']}/Night',
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // "Recommended Hotels" Section (You can keep it or modify)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Recommended Hotels',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Vertical scroll for recommended hotels
                  const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Recomended(),
                        Recomended(),
                        Recomended(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
