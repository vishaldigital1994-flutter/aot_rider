import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class SupportTicketListScreen extends StatelessWidget {
  const SupportTicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Support Tickets"),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _TicketTile(
            title: "Payment Issue",
            status: "Open",
            color: Colors.orange,
          ),
          _TicketTile(
            title: "Ride Cancelled",
            status: "In Progress",
            color: Colors.blue,
          ),
          _TicketTile(
            title: "App Crash",
            status: "Resolved",
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _TicketTile extends StatelessWidget {
  final String title;
  final String status;
  final Color color;

  const _TicketTile({
    required this.title,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.confirmation_number, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status, style: TextStyle(color: color, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
