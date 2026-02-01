import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  final int bookingId;

  const BookingDetailScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking #$bookingId")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ride Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const ListTile(
              leading: Icon(Icons.my_location),
              title: Text("Pickup Location"),
              subtitle: Text("Sector 21, Main Road"),
            ),

            const ListTile(
              leading: Icon(Icons.flag),
              title: Text("Drop Location"),
              subtitle: Text("City Mall"),
            ),

            const ListTile(
              leading: Icon(Icons.currency_rupee),
              title: Text("Fare"),
              subtitle: Text("₹120"),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Booking accepted (MVP)")),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Accept Booking"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
