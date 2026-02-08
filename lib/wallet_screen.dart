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
                  children: [
                    const Text(
                      "Wallet Balance",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "₹ 1,250",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Add money (MVP)")),
                          );
                        },
                        child: const Text("Add Money"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Payment Methods
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment Methods",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet),
                    title: const Text("UPI"),
                    subtitle: const Text("Google Pay / PhonePe"),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text("Bank Account"),
                    subtitle: const Text("HDFC •••• 4321"),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text("Debit Card"),
                    subtitle: const Text("Visa •••• 8899"),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.money),
                    title: const Text("Cash"),
                    subtitle: const Text("Offline payments"),
                    onTap: () {},
                  ),
                ],
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
                    title: Text("Ride #1023"),
                    subtitle: Text("UPI Payment"),
                    trailing: Text("₹180"),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Ride #1022"),
                    subtitle: Text("Cash Payment"),
                    trailing: Text("₹220"),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Ride #1021"),
                    subtitle: Text("Wallet Payment"),
                    trailing: Text("₹150"),
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
