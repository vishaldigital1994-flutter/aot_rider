import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class RiderBookingManagementScreen extends StatelessWidget {
  const RiderBookingManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Booking Management",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.warning_amber_rounded, color: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("🚨 SOS Triggered (MVP)")),
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// 🔹 AVAILABLE BOOKINGS
          _SectionTitle("Available Bookings"),
          _ActionCard(
            icon: Icons.route,
            title: "View Nearby Bookings",
            subtitle: "Multiple bookings on your route",
            onTap: () {},
          ),

          /// 🔹 LIVE RIDE CONTROLS
          _SectionTitle("Live Ride"),
          _ActionCard(
            icon: Icons.location_on,
            title: "Live Location Tracking",
            subtitle: "Track current ride in real time",
            onTap: () {},
          ),
          _ActionCard(
            icon: Icons.share,
            title: "Share Live Location",
            subtitle: "Share via WhatsApp",
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sharing location (MVP)")),
              );
            },
          ),

          /// 🔹 CUSTOMER ACTIONS
          _SectionTitle("Customer Actions"),
          _ActionCard(
            icon: Icons.verified_user,
            title: "Verify Customer",
            subtitle: "OTP / Ride confirmation",
            onTap: () {},
          ),
          _ActionCard(
            icon: Icons.sync_problem,
            title: "Reschedule / Cancel Ride",
            subtitle: "Request changes for booking",
            onTap: () {},
          ),

          /// 🔹 RIDE HISTORY
          _SectionTitle("History"),
          _ActionCard(
            icon: Icons.history,
            title: "Ride History",
            subtitle: "Completed & cancelled rides",
            onTap: () {},
          ),

          /// 🔹 ROUTES & LOCATIONS
          _SectionTitle("Saved Routes"),
          _ActionCard(
            icon: Icons.bookmark,
            title: "Saved Locations & Routes",
            subtitle: "Frequently used routes",
            onTap: () {},
          ),

          /// 🔹 ACCESSORIES
          _SectionTitle("Ride Accessories"),
          _AccessoryCard(),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////
/// 🔹 SECTION TITLE
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 22),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}

//////////////////////////////////////////////////
/// 🔹 ACTION CARD
class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////
/// 🔹 ACCESSORY MANAGEMENT
class _AccessoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: const [
          _AccessoryItem("Helmet", true),
          _AccessoryItem("Mask", true),
          _AccessoryItem("Medical Kit", false),
        ],
      ),
    );
  }
}

class _AccessoryItem extends StatelessWidget {
  final String name;
  final bool available;

  const _AccessoryItem(this.name, this.available);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Switch(value: available, onChanged: (_) {}),
      ],
    );
  }
}
