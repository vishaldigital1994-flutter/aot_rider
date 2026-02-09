import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';

class VerifyCustomerScreen extends StatefulWidget {
  const VerifyCustomerScreen({super.key});

  @override
  State<VerifyCustomerScreen> createState() => _VerifyCustomerScreenState();
}

class _VerifyCustomerScreenState extends State<VerifyCustomerScreen> {
  final TextEditingController otpController = TextEditingController();

  void _verifyCustomer() {
    if (otpController.text.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Customer verified successfully")),
      );

      /// TODO: Navigate to trip started / live ride screen
      // Navigator.pushReplacement(...)
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter valid 4-digit OTP")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 255, 255),
        title: const Text("Verify Customer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// 👩 Customer Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color.fromARGB(255, 2, 220, 220),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Customer Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Pickup: MG Road, Bengaluru",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔐 OTP Input
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter 4-digit OTP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                hintText: "● ● ● ●",
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ Verify Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 252, 252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _verifyCustomer,
                child: const Text(
                  "VERIFY CUSTOMER",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const Spacer(),

            /// ℹ️ Info text
            const Text(
              "Ask the customer for the OTP shown in their app",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
