import 'package:flutter/material.dart';
import 'booking_detail_screen.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Bookings")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 3, // dummy bookings
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: Text("Pickup Area ${index + 1}"),
              subtitle: const Text("Drop: City Center"),
              trailing: const Text("₹120"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingDetailScreen(bookingId: index + 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
