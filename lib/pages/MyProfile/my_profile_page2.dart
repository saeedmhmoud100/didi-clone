import 'package:flutter/material.dart';

class MyProfilePage2 extends StatelessWidget {
  const MyProfilePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange[800],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Picture and User Info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://example.com/user_profile_pic.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "John Doe",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "johndoe@example.com",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Menu Options
          _buildMenuOption(
            icon: Icons.history,
            title: "My Rides",
            onTap: () {},
          ),
          _buildMenuOption(
            icon: Icons.credit_card,
            title: "Payment Methods",
            onTap: () {},
          ),
          _buildMenuOption(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),
          _buildMenuOption(
            icon: Icons.support_agent,
            title: "Customer Support",
            onTap: () {},
          ),
          _buildMenuOption(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Helper Widget for Menu Options
  Widget _buildMenuOption({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange[800]),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
