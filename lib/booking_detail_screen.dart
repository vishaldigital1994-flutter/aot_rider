import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class BookingDetailScreen extends StatelessWidget {
  final int bookingId;

  const BookingDetailScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Ride #$bookingId",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🚲 HEADER CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ride Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Check pickup, drop & schedule\nbefore accepting",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// 📍 PICKUP
            const _DetailTile(
              icon: Icons.radio_button_checked,
              iconColor: Colors.green,
              title: "Pickup Location",
              value: "Sector 21, Main Road",
            ),

            const SizedBox(height: 12),

            /// 📍 DROP
            const _DetailTile(
              icon: Icons.location_on,
              iconColor: Colors.red,
              title: "Drop Location",
              value: "City Mall",
            ),

            const SizedBox(height: 12),

            /// 💰 FARE
            const _DetailTile(
              icon: Icons.account_balance_wallet,
              iconColor: AppColors.primary,
              title: "Earnings",
              value: "₹120",
              valueStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            const SizedBox(height: 12),

            /// 🗓️ SCHEDULER TYPE
            const _DetailTile(
              icon: Icons.calendar_today,
              iconColor: Colors.blue,
              title: "Scheduler Type",
              value: "Daily",
            ),

            const SizedBox(height: 12),

            /// 🚕 RIDE TYPE
            const _DetailTile(
              icon: Icons.repeat,
              iconColor: Colors.deepPurple,
              title: "Ride Type",
              value: "Daily Pickup",
            ),

            const Spacer(),

            /// ✅ ACCEPT BUTTON
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 6, 246, 246),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Booking accepted (MVP)")),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Accept Ride",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Decline",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Detail Tile (UNCHANGED)
class _DetailTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final TextStyle? valueStyle;

  const _DetailTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style:
                      valueStyle ??
                      const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
