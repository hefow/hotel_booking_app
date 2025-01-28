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
// ===============================
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
//   }

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
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           // List of hotels fetched successfully
//           var hotelList = snapshot.data!;
//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // TabBar for Categories (You can keep it or modify)
//                   const DefaultTabController(
//                     length: 4,
//                     child: Column(
//                       children: [
//                         TabBar(
//                           indicatorColor: Colors.blue,
//                           labelColor: Colors.blue,
//                           unselectedLabelColor: Colors.grey,
//                           tabs: [
//                             Tab(text: 'Apartment'),
//                             Tab(text: 'Luxury'),
//                             Tab(text: 'Resorts'),
//                             Tab(text: 'Boats'),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                       ],
//                     ),
//                   ),

//                   // Horizontal Scroll for Hotels
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: hotelList.map<Widget>((hotel) {
//                         return HotelCard(
//                           imageUrl: hotel['image'] != null &&
//                                   hotel['image']['data'] != null
//                               ? 'data:image/png;base64,${base64Encode(hotel['image']['data'])}'
//                               : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
//                           title: hotel['name'],
//                           location: hotel['location'],
//                           price: '\$${hotel['pricePerNight']}/Night',
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // "Recommended Hotels" Section (You can keep it or modify)
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     child: Text(
//                       'Recommended Hotels',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // Vertical scroll for recommended hotels
//                   const SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Column(
//                       children: [
//                         Recomended(),
//                         Recomended(),
//                         Recomended(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
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

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;
//   List<dynamic> filteredHotels = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
//     searchController.addListener(_filterHotels);
//   }

//   void _filterHotels() {
//     setState(() {
//       filteredHotels = filteredHotels.isEmpty
//           ? []
//           : filteredHotels
//               .where((hotel) => hotel['name']
//                   .toLowerCase()
//                   .contains(searchController.text.toLowerCase()))
//               .toList();
//     });
//   }

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
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           var hotelList = snapshot.data!;

//           if (filteredHotels.isEmpty) {
//             filteredHotels = hotelList; // If no search, show all hotels
//           }

//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search for hotels',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // TabBar for Categories (You can keep it or modify)
//                   const DefaultTabController(
//                     length: 4,
//                     child: Column(
//                       children: [
//                         TabBar(
//                           indicatorColor: Colors.blue,
//                           labelColor: Colors.blue,
//                           unselectedLabelColor: Colors.grey,
//                           tabs: [
//                             Tab(text: 'Apartment'),
//                             Tab(text: 'Luxury'),
//                             Tab(text: 'Resorts'),
//                             Tab(text: 'Boats'),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                       ],
//                     ),
//                   ),

//                   // Horizontal Scroll for Hotels
//                   SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Row(
//                       children: filteredHotels.map<Widget>((hotel) {
//                         return HotelCard(
//                           imageUrl: hotel['image'] != null
//                               ? hotel['image']
//                               : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
//                           title: hotel['name'],
//                           location: hotel['location'],
//                           price: '\$${hotel['pricePerNight']}/Night',
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           );
//         },
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

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }

// ===================

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;
//   List<dynamic> filteredHotels = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
//     searchController.addListener(_filterHotels);
//   }

//   void _filterHotels() {
//     setState(() {
//       filteredHotels = filteredHotels.isEmpty
//           ? []
//           : filteredHotels
//               .where((hotel) => hotel['name']
//                   .toLowerCase()
//                   .contains(searchController.text.toLowerCase()))
//               .toList();
//     });
//   }

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
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           var hotelList = snapshot.data!;

//           if (filteredHotels.isEmpty) {
//             filteredHotels = hotelList; // If no search, show all hotels
//           }

//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search for hotels',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // TabBar for Categories (You can keep it or modify)
//                   const DefaultTabController(
//                     length: 4,
//                     child: Column(
//                       children: [
//                         TabBar(
//                           indicatorColor: Colors.blue,
//                           labelColor: Colors.blue,
//                           unselectedLabelColor: Colors.grey,
//                           tabs: [
//                             Tab(text: 'Apartment'),
//                             Tab(text: 'Luxury'),
//                             Tab(text: 'Resorts'),
//                             Tab(text: 'Boats'),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                       ],
//                     ),
//                   ),

//                   // Vertical Scroll for Hotels
//                   ListView.builder(
//                     shrinkWrap: true, // To prevent it from taking too much space
//                     physics: NeverScrollableScrollPhysics(), // To disable scrolling in nested scroll views
//                     itemCount: filteredHotels.length,
//                     itemBuilder: (context, index) {
//                       var hotel = filteredHotels[index];
//                       return HotelCard(
//                         imageUrl: hotel['image'] != null
//                             ? hotel['image']
//                             : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
//                         title: hotel['name'],
//                         location: hotel['location'],
//                         price: '\$${hotel['pricePerNight']}/Night',
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           );
//         },
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

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }

// ======================

// import 'package:flutter/material.dart';
// import 'package:frontend/screans/hotels.dart';
// import 'package:get/get.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service

// import 'package:frontend/components/hotel_controller.dart'; // Import the controller

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;
//   List<dynamic> filteredHotels = [];
//   TextEditingController searchController = TextEditingController();
//   final HotelController hotelController = Get.find<HotelController>(); // Access the already initialized controller

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
//     searchController.addListener(_filterHotels);
//   }

//   void _filterHotels() {
//     setState(() {
//       filteredHotels = filteredHotels.isEmpty
//           ? []
//           : filteredHotels
//               .where((hotel) => hotel['name']
//                   .toLowerCase()
//                   .contains(searchController.text.toLowerCase()))
//               .toList();
//     });
//   }

//   void _onHotelCardTap(Map<String, dynamic> hotel) {
//     // Set the selected hotel details in the controller
//     hotelController.setHotelDetails(hotel);
//     // Navigate to the hotel detail screen
//     Get.to(() => const HotelsDetail());
//   }

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
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           var hotelList = snapshot.data!;

//           if (filteredHotels.isEmpty) {
//             filteredHotels = hotelList; // If no search, show all hotels
//           }

//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search for hotels',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Vertical Scroll for Hotels
//                   ListView.builder(
//                     shrinkWrap: true, // To prevent it from taking too much space
//                     physics: NeverScrollableScrollPhysics(), // To disable scrolling in nested scroll views
//                     itemCount: filteredHotels.length,
//                     itemBuilder: (context, index) {
//                       var hotel = filteredHotels[index];
//                       return GestureDetector(
//                         onTap: () => _onHotelCardTap(hotel), // Handle tap event
//                         child: HotelCard(
//                           imageUrl: hotel['image'] != null
//                               ? hotel['image']
//                               : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
//                           title: hotel['name'],
//                           location: hotel['location'],
//                           price: '\$${hotel['pricePerNight']}/Night',
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           );
//         },
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

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:frontend/screans/hotels.dart';
// import 'package:get/get.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/components/recomended.dart';
// import 'package:frontend/services/hotel_service.dart'; // Import the service
// import 'package:frontend/components/hotel_controller.dart'; // Import the controller

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;
//   List<dynamic> filteredHotels = [];
//   TextEditingController searchController = TextEditingController();
//   final hotelController =
//       Get.put(HotelController()); // Initialize the controller

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels(); // Fetch hotels when the page loads
//     searchController.addListener(_filterHotels);
//   }

//   void _filterHotels() {
//     setState(() {
//       filteredHotels = filteredHotels.isEmpty
//           ? []
//           : filteredHotels
//               .where((hotel) => hotel['name']
//                   .toLowerCase()
//                   .contains(searchController.text.toLowerCase()))
//               .toList();
//     });
//   }

//   void _onHotelCardTap(Map<String, dynamic> hotel) {
//     // Set the selected hotel details in the controller
//     hotelController.setHotelDetails(hotel);
//     // Navigate to the hotel detail screen
//     Get.to(() => const HotelsDetail());
//   }

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
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           var hotelList = snapshot.data!;

//           if (filteredHotels.isEmpty) {
//             filteredHotels = hotelList; // If no search, show all hotels
//           }

//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search for hotels',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Vertical Scroll for Hotels
//                   ListView.builder(
//                     shrinkWrap:
//                         true, // To prevent it from taking too much space
//                     physics:
//                         NeverScrollableScrollPhysics(), // To disable scrolling in nested scroll views
//                     itemCount: filteredHotels.length,
//                     itemBuilder: (context, index) {
//                       var hotel = filteredHotels[index];
//                       return GestureDetector(
//                         onTap: () => _onHotelCardTap(hotel), // Handle tap event
//                         child: HotelCard(
//                           image: hotel['image'] != null
//                               ? hotel['image']
//                               : 'https://plus.unsplash.com/premium_photo-1676823553207-758c7a66e9bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder if no image
//                           name: hotel['name'],
//                           location: hotel['location'],
//                           pricePerNight: '\$${hotel['pricePerNight']}',
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           );
//         },
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

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }
// ===========================

// import 'package:flutter/material.dart';
// import 'package:frontend/components/hotel_controller.dart'; // Import the controller
// import 'package:frontend/screans/hotels.dart';
// import 'package:get/get.dart';
// import 'package:frontend/components/hotel_card.dart';
// import 'package:frontend/services/hotel_service.dart';
// import 'package:frontend/screans/hotels.dart'; // Import the hotel detail page

// class HotelSearchPage extends StatefulWidget {
//   const HotelSearchPage({super.key});

//   @override
//   _HotelSearchPageState createState() => _HotelSearchPageState();
// }

// class _HotelSearchPageState extends State<HotelSearchPage> {
//   late Future<List<dynamic>> hotels;
//   List<dynamic> filteredHotels = [];
//   TextEditingController searchController = TextEditingController();
//   final hotelController = Get.put(HotelController());

//   @override
//   void initState() {
//     super.initState();
//     hotels = HotelService().fetchHotels();
//     searchController.addListener(_filterHotels);
//   }

//   void _filterHotels() {
//     setState(() {
//       filteredHotels = filteredHotels.isEmpty
//           ? []
//           : filteredHotels
//               .where((hotel) => hotel['name']
//                   .toLowerCase()
//                   .contains(searchController.text.toLowerCase()))
//               .toList();
//     });
//   }

//   void _onHotelCardTap(Map<String, dynamic> hotel) {
//     hotelController.setHotelDetails(hotel); // Pass the hotel to the controller
//     Get.to(() => HotelsDetail(id: hotel['_id'])); // Pass hotel ID
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Let\'s Find The Best Hotel', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: hotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hotels available'));
//           }

//           var hotelList = snapshot.data!;
//           if (filteredHotels.isEmpty) {
//             filteredHotels = hotelList;
//           }

//           return SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: 'Search for hotels',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: filteredHotels.length,
//                     itemBuilder: (context, index) {
//                       var hotel = filteredHotels[index];
//                       return GestureDetector(
//                         onTap: () => _onHotelCardTap(hotel),
//                         child: HotelCard(
//                           image: hotel['image'] ?? 'https://via.placeholder.com/150',
//                           name: hotel['name'],
//                           location: hotel['location'],
//                           pricePerNight: '\$${hotel['pricePerNight']}',
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           );
//         },
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

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/components/hotel_controller.dart'; // Import the controller
import 'package:frontend/screans/hotels.dart';
import 'package:get/get.dart';
import 'package:frontend/components/hotel_card.dart';
import 'package:frontend/services/hotel_service.dart';
import 'package:frontend/screans/hotels.dart'; // Import the hotel detail page

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  late Future<List<dynamic>> hotels;
  List<dynamic> filteredHotels = [];
  TextEditingController searchController = TextEditingController();
  final hotelController = Get.put(HotelController());

  @override
  void initState() {
    super.initState();
    hotels = HotelService().fetchHotels();
    searchController.addListener(_filterHotels);
  }

  void _filterHotels() {
    setState(() {
      filteredHotels = filteredHotels.isEmpty
          ? []
          : filteredHotels
              .where((hotel) => hotel['name']
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
              .toList();
    });
  }

  void _onHotelCardTap(Map<String, dynamic> hotel) {
    print(hotel['_id']);
    Get.to(() => HotelsDetail(id: hotel['_id'])); // Pass hotel ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s Find The Best Hotel',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: hotels, // Fetch hotels
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hotels available'));
          }

          // The hotels are fetched successfully, so set them
          var hotelList = snapshot.data!;

          // Initialize filteredHotels with all hotels if not yet filtered
          if (filteredHotels.isEmpty) {
            filteredHotels = hotelList;
          }

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for hotels',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredHotels.length,
                    itemBuilder: (context, index) {
                      var hotel = filteredHotels[index];
                      return GestureDetector(
                        onTap: () => _onHotelCardTap(hotel),
                        child: HotelCard(
                          id: hotel['_id'],
                          image: hotel['image'] ??
                              'https://via.placeholder.com/150',
                          name: hotel['name'],
                          location: hotel['location'],
                          pricePerNight: '\$${hotel['pricePerNight']}',
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
