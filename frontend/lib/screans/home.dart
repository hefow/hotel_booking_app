
import 'package:flutter/material.dart';

class HotelSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Let\'s Find The Best Hotel',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // TabBar for Categories
            DefaultTabController(
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
                  SizedBox(height: 16),

                  // Hotel Cards
                  ListView(
                    shrinkWrap: true, // Ensures ListView doesn't take infinite height
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      HotelCard(
                        imageUrl:
                            'https://via.placeholder.com/100', // Example image
                        title: 'Blue Nature',
                        location: 'South Kuta',
                        price: '\$80/Night',
                      ),
                      HotelCard(
                        imageUrl:
                            'https://via.placeholder.com/100', // Example image
                        title: 'Sand Edge',
                        location: 'Nusa Dua Beach',
                        price: '\$95/Night',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Recommended Hotels',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      HotelCard(
                        imageUrl:
                            'https://via.placeholder.com/100', // Example image
                        title: 'Grand Palace',
                        location: 'Kuta',
                        price: '\$105/Night',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;

  const HotelCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
