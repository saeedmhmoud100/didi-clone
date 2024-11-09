import 'package:didi_clone/Themes.dart';
import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _darkMode = Provider.of<ThemeProvider>(context, listen: false).theme.brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Profile Settings
            const Text(
              "Profile Settings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSettingOption(
              title: "Change Profile Picture",
              icon: Icons.account_circle,
              onTap: () {
                // Add functionality to change profile picture
              },
            ),
            _buildSettingOption(
              title: "Edit Profile Information",
              icon: Icons.edit,
              onTap: () {
                // Add functionality to edit profile
              },
            ),
            const SizedBox(height: 20),

            // Section: Preferences
            const Text(
              "Preferences",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSwitchOption(
              title: "Enable Notifications",
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSwitchOption(
              title: "Dark Mode",
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
            const SizedBox(height: 20),

            // Section: Account Settings
            const Text(
              "Account Settings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSettingOption(
              title: "Change Password",
              icon: Icons.lock,
              onTap: () {
                // Add functionality to change password
              },
            ),
            _buildSettingOption(
              title: "Logout",
              icon: Icons.exit_to_app,
              onTap: () {
                // Add functionality to logout
                AuthService().signOut();
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget to build individual setting options (text with an icon)
  Widget _buildSettingOption({required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Widget to build a switch option (enable/disable setting)
  Widget _buildSwitchOption({required String title, required bool value, required ValueChanged<bool> onChanged}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.deepPurple,
      ),
    );
  }
}
