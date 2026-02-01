import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';
import 'package:rider_app/dashboard_screen.dart';
import 'package:rider_app/main_layout.dart';
import '../services/storage_service.dart'; // <-- your theme

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneCtrl = TextEditingController();
  final otpCtrl = TextEditingController();

  bool otpSent = false;

  void handleAction() async {
    if (!otpSent) {
      setState(() => otpSent = true);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP sent: 123456")));
    } else {
      if (otpCtrl.text == "123456") {
        await StorageService.saveToken("dummy_token");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainLayout()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Invalid OTP")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              /// 👋 Title
              Text(
                "Welcome to Rider App",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              /// Subtitle
              Text(
                "The fastest app to book a cab, tricycle,\n"
                "or a bike online near by you",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 32),

              /// 🌍 Country selector
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: const [
                    Text("🇮🇳", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 10),
                    Text("India (+91)"),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// 📱 Phone input
              TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: "Phone number"),
              ),

              const SizedBox(height: 16),

              /// 🔐 OTP input
              if (otpSent)
                TextField(
                  controller: otpCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Enter OTP"),
                ),

              const SizedBox(height: 16),

              /// 📜 Terms
              RichText(
                text: TextSpan(
                  text: "By clicking on “Continue” you are agreeing to ",
                  style: theme.textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: "terms of use",
                      style: TextStyle(
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// 🔘 Primary button (theme based)
              GestureDetector(
                onTap: handleAction,
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      otpSent ? "Verify OTP" : "Continue",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
