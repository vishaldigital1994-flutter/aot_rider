import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & SOS")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SOS Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("🚨 SOS triggered (MVP)")),
                  );
                },
                child: const Text(
                  "EMERGENCY SOS",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Emergency Contacts
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Emergency Contacts",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Primary Contact"),
                subtitle: const Text("+91 98765 43210"),
                trailing: IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Calling contact (MVP)")),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Support
            Card(
              child: ListTile(
                leading: const Icon(Icons.support_agent),
                title: const Text("Rider Support"),
                subtitle: const Text("24/7 Help"),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Connecting to support (MVP)"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
