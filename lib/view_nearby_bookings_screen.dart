import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';
import 'package:rider_app/booking_detail_screen.dart';

class ViewNearbyBookingsScreen extends StatelessWidget {
  const ViewNearbyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Nearby Bookings",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5, // dummy nearby bookings
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingDetailScreen(bookingId: index + 1),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔝 RIDE & AMOUNT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ride #${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "₹${120 + index * 20}",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// 📍 PICKUP
                  Row(
                    children: const [
                      Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Expanded(child: Text("Sector ${21 + 1}, Main Road")),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// 📍 DROP
                  Row(
                    children: const [
                      Icon(Icons.location_on, size: 16, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(child: Text("City Mall")),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// 🚲 RIDE TYPE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade50,
                    ),
                    child: const Text(
                      "Tap to view details",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
