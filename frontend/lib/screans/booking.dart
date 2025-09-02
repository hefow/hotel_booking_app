

import 'package:flutter/material.dart';
import 'package:frontend/services/room_service.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  final String? id; // Hotel ID passed from the HotelsDetail page

  const Booking({Key? key, this.id}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String? selectedRoomType;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: RoomService().getRoomsByHotel(widget.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No rooms available'));
          } else {
            final rooms = snapshot.data!;
            final roomTypes =
                rooms.map((room) => room['type']).toSet().toList();

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Book Your Stay',
                        style: TextStyle(color: Colors.white)),
                    background: Image.asset(
                      'assets/images/header.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Your Room',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Select Room Type'),
                              value: selectedRoomType,
                              items: roomTypes
                                  .map<DropdownMenuItem<String>>((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedRoomType = value;
                                  _calculateTotalPrice(rooms);
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Choose Your Dates',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDateField(
                                label: 'Check-in',
                                date: checkInDate,
                                onTap: () => _selectDate(context, true),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildDateField(
                                label: 'Check-out',
                                date: checkOutDate,
                                onTap: () => _selectDate(context, false),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                '\$${totalPrice.toStringAsFixed(2)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _canBook()
                                ? () => _showBookingConfirmation(context)
                                : null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Book Now',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildDateField(
      {required String label, DateTime? date, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              date != null
                  ? DateFormat('MMM dd, yyyy').format(date)
                  : 'Select Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn
          ? DateTime.now()
          : (checkInDate ?? DateTime.now()).add(const Duration(days: 1)),
      firstDate: isCheckIn
          ? DateTime.now()
          : (checkInDate ?? DateTime.now()).add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
          // Reset check-out date if it's earlier than check-in date
          if (checkOutDate != null && checkOutDate!.isBefore(checkInDate!)) {
            checkOutDate = null;
          }
        } else {
          checkOutDate = picked;
        }
        _calculateTotalPrice(null); // Recalculate total price
      });
    }
  }

  void _calculateTotalPrice(List<dynamic>? rooms) {
    if (selectedRoomType != null &&
        checkInDate != null &&
        checkOutDate != null) {
      // Find the room by type
      final room = rooms?.firstWhere((room) => room['type'] == selectedRoomType,
          orElse: () => null);

      if (room != null) {
        // Ensure price is a valid number (convert to double if it's a string)
        final price = double.tryParse(room['price'].toString()) ?? 0.0;

        // Ensure the number of nights is a valid positive value
        final nights = checkOutDate!.difference(checkInDate!).inDays;
        if (nights > 0) {
          setState(() {
            totalPrice = price * nights;
          });
        } else {
          setState(() {
            totalPrice =
                0.0; // If the number of nights is less than or equal to 0, reset total price
          });
        }
      } else {
        setState(() {
          totalPrice = 0.0; // Reset total price if no matching room is found
        });
      }
    } else {
      setState(() {
        totalPrice = 0.0; // Reset total price if dates or room type are missing
      });
    }
  }

  bool _canBook() {
    return selectedRoomType != null &&
        checkInDate != null &&
        checkOutDate != null &&
        checkOutDate!.isAfter(checkInDate!);
  }

  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Booking'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Room Type: $selectedRoomType'),
              Text(
                  'Check-in: ${DateFormat('yyyy-MM-dd').format(checkInDate!)}'),
              Text(
                  'Check-out: ${DateFormat('yyyy-MM-dd').format(checkOutDate!)}'),
              Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement booking logic
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking confirmed!')),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
