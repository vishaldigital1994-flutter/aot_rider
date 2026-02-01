import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';
import 'package:rider_app/dashboard_screen.dart';
import '../services/storage_service.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), checkAuth);
  }

  void checkAuth() async {
    final token = await StorageService.getToken();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            token == null ? const LoginScreen() : const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          "Rider App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
