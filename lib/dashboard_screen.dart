import 'package:flutter/material.dart';
import 'package:rider_app/RiderBookingManagementScreen.dart';
import 'package:rider_app/app_colors.dart';
import 'package:rider_app/booking_list_screen.dart';
import 'package:rider_app/help_screen.dart';
import 'package:rider_app/profile_screen.dart';
import 'package:rider_app/vehicle_list_screen.dart';
import 'package:rider_app/wallet_screen.dart';
import '../../services/storage_service.dart';
import '../../auth/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void logout(BuildContext context) async {
    await StorageService.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔝 HEADER
              Row(
                children: [
                  const CircleAvatar(radius: 22, child: Icon(Icons.person)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good morning",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Priya Shaw",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => logout(context),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// 🎨 RIDER BANNER
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ride safe.\nEarn more.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Complete more rides\nand boost your earnings",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookingListScreen(),
                          ),
                        );
                      },
                      child: const Text("View Rides"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// 🚲 QUICK ACTIONS
              const Text(
                "Quick actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _ActionItem(
                      icon: Icons.person,
                      label: "Profile",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),

                    _ActionItem(
                      icon: Icons.motorcycle,
                      label: "Vehicle",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VehicleListScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),

                    _ActionItem(
                      icon: Icons.receipt_long,
                      label: "Bookings",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookingListScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),

                    _ActionItem(
                      icon: Icons.account_balance_wallet,
                      label: "Wallet",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WalletScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),

                    _ActionItem(
                      icon: Icons.route,
                      label: "Manage Rides",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const RiderBookingManagementScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// 🕘 RIDE HISTORY
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rides history",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookingListScreen(),
                        ),
                      );
                    },
                    child: const Text("See all"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 May, 2022"),
                        Text(
                          "₹2400",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Pickup location",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text("Odunsi Junction - Kiosk Lane"),
                    SizedBox(height: 8),
                    Text("Drop off", style: TextStyle(color: Colors.grey)),
                    Text("Bariga Market"),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// 🆘 HELP & SOS
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HelpScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red.shade50,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.emergency, color: Colors.red),
                      SizedBox(width: 12),
                      Text(
                        "Help & SOS",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 ACTION TILE
class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
