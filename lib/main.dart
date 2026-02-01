import 'package:flutter/material.dart';
import 'package:rider_app/app_theme.dart';
import 'auth/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RiderApp());
}

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rider App',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
