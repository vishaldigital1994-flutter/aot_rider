import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class RescheduleCancelRideScreen extends StatefulWidget {
  const RescheduleCancelRideScreen({super.key});

  @override
  State<RescheduleCancelRideScreen> createState() =>
      _RescheduleCancelRideScreenState();
}

class _RescheduleCancelRideScreenState
    extends State<RescheduleCancelRideScreen> {
  String? selectedReason;

  final List<String> cancelReasons = [
    "Customer not responding",
    "Wrong pickup location",
    "Vehicle issue",
    "Emergency",
    "Other",
  ];

  void _cancelRide() {
    if (selectedReason == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a reason")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Ride cancelled (MVP)")));

    Navigator.pop(context);
  }

  void _rescheduleRide() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Ride rescheduled (MVP)")));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Manage Ride"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🚲 Ride Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.location_on, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup → Drop",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "MG Road → City Mall",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// ❌ Cancel Ride
            Text(
              "Cancel Ride",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade600,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedReason,
                  hint: const Text("Select cancel reason"),
                  isExpanded: true,
                  items: cancelReasons
                      .map(
                        (reason) => DropdownMenuItem(
                          value: reason,
                          child: Text(reason),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ❌ Cancel Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 247, 132, 130),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _cancelRide,
                child: const Text(
                  "CANCEL RIDE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 32),

            /// 🔁 Reschedule Ride
            Text(
              "Reschedule Ride",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade100,
              ),
              child: Row(
                children: const [
                  Icon(Icons.schedule),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Request a new pickup time with the customer",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔁 Reschedule Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _rescheduleRide,
                child: const Text(
                  "RESCHEDULE RIDE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const Spacer(),

            /// ℹ️ Safety note
            const Text(
              "For emergencies, use Help & SOS",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
