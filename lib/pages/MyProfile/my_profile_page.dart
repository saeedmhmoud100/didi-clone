import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile Section
          _buildProfileHeader(),
          SizedBox(height: 20),
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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          title: Text("Payment Methods"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Payment Methods
          },
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text("Address Book"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Address Book
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text("Ride History"),
          trailing: Icon(Icons.arrow_forward_ios),
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notifications"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Notifications Settings
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text("Privacy"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Privacy Settings
          },
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text("Security"),
          trailing: Icon(Icons.arrow_forward_ios),
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Help", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text("FAQs"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to FAQs
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_support),
          title: Text("Contact Support"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Contact Support
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text("About Us"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to About Us
          },
        ),
      ],
    );
  }
}
