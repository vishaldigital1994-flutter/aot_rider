import 'package:flutter/material.dart';
import 'add_vehicle_screen.dart';

class VehicleListScreen extends StatelessWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Vehicles"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddVehicleScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "No vehicles added yet",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
