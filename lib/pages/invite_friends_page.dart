import 'package:flutter/material.dart';

class InviteFriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite Friends"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Header
            Text(
              "Invite Your Friends",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Share the app with your friends and earn rewards!",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // Section: Invite Options
            _buildInviteOption(
              icon: Icons.share,
              title: "Share Link",
              subtitle: "Send a link to your friends via text, email, or any app",
              onTap: () {
                // Add functionality to share a link
              },
            ),
            _buildInviteOption(
              icon: Icons.message,
              title: "Invite via SMS",
              subtitle: "Send an invite directly to your contacts",
              onTap: () {
                // Add functionality to send SMS invite
              },
            ),
            _buildInviteOption(
              icon: Icons.people,
              title: "Invite via Social Media",
              subtitle: "Share your referral code or invite on Facebook, Twitter, etc.",
              onTap: () {
                // Add functionality to share on social media
              },
            ),
            _buildInviteOption(
              icon: Icons.contacts,
              title: "Invite from Contacts",
              subtitle: "Select friends from your contact list to invite",
              onTap: () {
                // Add functionality to select contacts
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build individual invite option
  Widget _buildInviteOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
