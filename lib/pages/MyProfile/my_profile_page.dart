import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          _buildProfileHeader(),
          const SizedBox(height: 20),
          // Account and Settings Sections
          _buildAccountSection(),
          _buildSettingsSection(),
          _buildHelpSection(),
        ],
      ),
    );
  }

  // 1. Profile Header
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with network image if needed
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text("user@example.com"),
              SizedBox(height: 4),
              Text(
                "Gold Member",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Account Section
  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text("Payment Methods"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Payment Methods
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text("Address Book"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Address Book
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text("Ride History"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Ride History
          },
        ),
      ],
    );
  }

  // 3. Settings Section
  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text("Notifications"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Notifications Settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip),
          title: const Text("Privacy"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Privacy Settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text("Security"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Security Settings
          },
        ),
      ],
    );
  }

  // 4. Help Section
  Widget _buildHelpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Help", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text("FAQs"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to FAQs
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_support),
          title: const Text("Contact Support"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Contact Support
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text("About Us"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to About Us
          },
        ),
      ],
    );
  }
}
