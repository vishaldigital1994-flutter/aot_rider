import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text("Not set"),
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Mobile"),
              subtitle: Text("**********"),
            ),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Address"),
              subtitle: Text("Not set"),
            ),
          ],
        ),
      ),
    );
  }
}
