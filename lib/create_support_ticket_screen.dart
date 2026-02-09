import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class CreateSupportTicketScreen extends StatelessWidget {
  const CreateSupportTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("New Support Ticket"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Issue Type",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(
                  value: "Ride Issue",
                  child: Text("Ride Issue"),
                ),
                DropdownMenuItem(
                  value: "Payment Issue",
                  child: Text("Payment Issue"),
                ),
                DropdownMenuItem(
                  value: "Safety Concern",
                  child: Text("Safety Concern"),
                ),
                DropdownMenuItem(value: "Other", child: Text("Other")),
              ],
              onChanged: (_) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Select issue type",
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Describe Issue",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Write your issue here...",
                border: OutlineInputBorder(),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Ticket submitted (MVP)")),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "SUBMIT TICKET",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
