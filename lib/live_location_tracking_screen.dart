import 'dart:async';
import 'package:flutter/material.dart';

class LiveLocationTrackingScreen extends StatefulWidget {
  const LiveLocationTrackingScreen({super.key});

  @override
  State<LiveLocationTrackingScreen> createState() =>
      _LiveLocationTrackingScreenState();
}

class _LiveLocationTrackingScreenState
    extends State<LiveLocationTrackingScreen> {
  Timer? _timer;

  /// Fake coordinates
  double lat = 12.9716;
  double lng = 77.5946;

  /// Fake rider position
  double riderTop = 220;
  double riderLeft = 140;

  @override
  void initState() {
    super.initState();
    _startFakeMovement();
  }

  void _startFakeMovement() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        lat += 0.0002;
        lng += 0.0002;

        riderTop += 12;
        riderLeft += 8;

        if (riderTop > 420) riderTop = 220;
        if (riderLeft > 280) riderLeft = 140;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Location Tracking"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          /// 🗺️ FAKE MAP IMAGE
          Positioned.fill(
            child: Image.asset("assets/images/fake_map.png", fit: BoxFit.cover),
          ),

          /// 🚲 MOVING RIDER ICON
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            top: riderTop,
            left: riderLeft,
            child: Column(
              children: const [
                Icon(Icons.motorcycle, size: 38, color: Colors.green),
                SizedBox(height: 2),
                Text(
                  "Rider",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          /// 📍 COORDINATES CARD
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Coordinates",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}",
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🚲 BOTTOM STATUS
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ride in Progress",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("live tracking enabled"),
                      ],
                    ),
                    Icon(Icons.location_on, color: Colors.green),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
