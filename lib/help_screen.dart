import 'package:flutter/material.dart';
import 'package:rider_app/app_colors.dart';
import 'package:rider_app/create_support_ticket_screen.dart';
import 'package:rider_app/support_live_chat_screen.dart';
import 'package:rider_app/support_ticket_list_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Help & SOS",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🚨 SOS CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.red.shade50,
              ),
              child: Column(
                children: [
                  const Icon(Icons.emergency, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  const Text(
                    "Emergency SOS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Use this button only in emergency situations.\n"
                    "Your live location will be shared.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("🚨 SOS triggered (MVP)"),
                          ),
                        );
                      },
                      child: const Text(
                        "TRIGGER SOS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            /// 📞 EMERGENCY CONTACTS
            const Text(
              "Emergency Contacts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.person,
              title: "Primary Contact",
              subtitle: "+91 98765 43210",
              trailingIcon: Icons.call,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Calling contact (MVP)")),
                );
              },
            ),

            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.manage_accounts,
              title: "Manage Emergency Contacts",
              subtitle: "Add or edit emergency contacts",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Manage contacts (MVP)")),
                );
              },
            ),

            const SizedBox(height: 32),

            /// 🎧 SUPPORT
            const Text(
              "Support",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.support_agent,
              title: "Rider Support Executive",
              subtitle: "Direct call support",
              trailingIcon: Icons.call,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Calling support executive (MVP)"),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.chat,
              title: "Live Chat",
              subtitle: "Chat with support team",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SupportLiveChatScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.edit_note,
              title: "New Enquiry / Complaint",
              subtitle: "Raise a support ticket",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateSupportTicketScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _HelpTile(
              icon: Icons.list_alt,
              title: "Support Tickets",
              subtitle: "View ticket status",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SupportTicketListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            /// ℹ️ INFO
            const Text(
              "Your safety is our priority.",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Help Tile
class _HelpTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  const _HelpTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            if (trailingIcon != null)
              Icon(trailingIcon, color: AppColors.primary, size: 18),
          ],
        ),
      ),
    );
  }
}
