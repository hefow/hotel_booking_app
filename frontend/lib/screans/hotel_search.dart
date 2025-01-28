import 'package:flutter/material.dart';
import 'package:frontend/components/hotel_card.dart'; // Import the hotel card widget
import 'package:frontend/services/hotel_service.dart'; // Import the hotel service
// Import the hotel detail page

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  late Future<List<dynamic>> hotels;
  List<dynamic> filteredHotels = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    hotels = HotelService().fetchHotels(); // Fetch all hotels initially
  }

  // Function to handle search based on location and price range
  void _searchHotels() async {
    String query = searchController.text;

    // Check if the query contains a price range
    if (query.contains('-')) {
      // If it contains '-', assume it's a price range (e.g., "100-300")
      List<String> priceRange = query.split('-');
      double? minPrice = double.tryParse(priceRange[0]);
      double? maxPrice = double.tryParse(priceRange[1]);

      if (minPrice != null && maxPrice != null) {
        // Call the search API with the price range
        List<dynamic> searchResults = await HotelService().searchHotels(
          minPrice: minPrice,
          maxPrice: maxPrice,
        );

        // Update the filtered hotels
        setState(() {
          filteredHotels = searchResults;
        });
      }
    } else {
      // If it's not a price range, assume it's a location search (e.g., "Malibu")
      List<dynamic> searchResults = await HotelService().searchHotels(
        location: query,
      );

      // Update the filtered hotels
      setState(() {
        filteredHotels = searchResults;
      });
    }
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by location or price (e.g., 100-300)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) {
                _searchHotels(); // Trigger search when the user submits the query
              },
            ),
          ),

          // Display the filtered hotels
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: hotels,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hotels available'));
                }

                // Use the filtered hotels if search results are available
                List<dynamic> hotelList =
                    filteredHotels.isEmpty ? snapshot.data! : filteredHotels;

                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        for (var hotel in hotelList)
                          HotelCard(
                            id: hotel['_id'], // Pass hotel ID
                            image: hotel['image'] ??
                                'https://via.placeholder.com/150',
                            name: hotel['name'],
                            location: hotel['location'],
                            pricePerNight: '\$${hotel['pricePerNight']}',
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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