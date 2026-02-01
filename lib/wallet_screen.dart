import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Wallet")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Wallet Balance Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text("Wallet Balance", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text(
                      "₹ 1,250",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Earnings History
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Earnings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Ride #1021"),
                    trailing: Text("₹150"),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Ride #1020"),
                    trailing: Text("₹200"),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Ride #1019"),
                    trailing: Text("₹100"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
