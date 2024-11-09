import 'package:didi_clone/Themes.dart';
import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          StreamBuilder<CustomUser?>(
            stream: AuthService().user,
            builder: (context, snapshot) {
              final user = snapshot.data;
              final isLoggedIn = user != null;
              return UserAccountsDrawerHeader(
                // accountName: Text(isLoggedIn ? (user!.username ?? "No Username") : "Guest Name"),
                accountEmail: Text(isLoggedIn ? (user.email ?? "No Email") : "Guest Email"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:AppTheme.darkPrimaryColor, // Light theme color
                  child: Text(
                    "A",
                    style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white // Dark theme color
                      : Colors.black87),
                  ),
                ),accountName: null,
                decoration: BoxDecoration(
                  color: Colors.deepPurple, // Background color of the header
                ),
              );
            },
          ),
          if (AuthService().isLoggedIn()) ...[
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('My Trips'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.myTrips);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.messages);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_invitation),
              title: const Text('Invite Friends'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.inviteFriends);
              },
            ),
            ListTile(
              leading: const Icon(Icons.drive_eta),
              title: const Text('Drive With Us'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.driveWithUs);
              },
            ),
            ListTile(
              leading: const Icon(Icons.discount),
              title: const Text('Promotions'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.promotions);
              },
            ),
            ListTile(
              leading: const Icon(Icons.scanner),
              title: const Text('Scan'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.scan);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Places'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.favoritePlaces);
              },
            ),
          ],
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.help);
            },
          ),
          if (AuthService().isLoggedIn()) ...[
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                AuthService().signOut();
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ] ,

          if(!AuthService().isLoggedIn()) ...[
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
            ),
          ],
        ],
      ),
    );
  }
}
