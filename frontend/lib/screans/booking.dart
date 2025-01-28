import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar
            // TableCalendar(
            //   firstDay: DateTime(2020),
            //   lastDay: DateTime(2025),
            //   focusedDay: _focusedDay,
            //   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            //   onDaySelected: (selectedDay, focusedDay) {
            //     setState(() {
            //       _selectedDay = selectedDay;
            //       _focusedDay = focusedDay;
            //     });
            //   },
            //   calendarStyle: CalendarStyle(
            //     selectedDecoration: BoxDecoration(
            //       color: Colors.blue,
            //       shape: BoxShape.circle,
            //     ),
            //     todayDecoration: BoxDecoration(
            //       color: Colors.grey,
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 5),

            // Schedule Information
            // Row(
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Image.asset(
            //         'assets/images/m.jpeg', // Add the actual image here
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     SizedBox(width: 16),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Blue Nature',
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           'South Kuta',
            //           style: TextStyle(color: Colors.grey),
            //         ),
            //         SizedBox(height: 8),
            //         Text(
            //           '\$80/Night',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         SizedBox(height: 8),
            //         Text(
            //           '20 Jan - 24 Jan 2025',
            //           style: TextStyle(color: Colors.grey),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // Spacer(),

            // Continue Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate or perform action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
