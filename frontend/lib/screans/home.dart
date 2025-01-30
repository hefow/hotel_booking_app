import 'package:flutter/material.dart';
import 'package:frontend/components/hotel_controller.dart'; // Import the controller
import 'package:frontend/screans/hotels.dart';
import 'package:get/get.dart';
import 'package:frontend/components/hotel_card.dart';
import 'package:frontend/services/hotel_service.dart';
//

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
