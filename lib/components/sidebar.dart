import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
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
                accountEmail: Text(isLoggedIn ? (user!.email ?? "No Email") : "Guest Email"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("A"),
                ), accountName: null,
              );
            },
          ),
          if (AuthService().isLoggedIn()) ...[
            ListTile(
              leading: Icon(Icons.pages),
              title: Text('My Trips'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.myTrips);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.messages);
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_invitation),
              title: Text('Invite Friends'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.inviteFriends);
              },
            ),
            ListTile(
              leading: Icon(Icons.drive_eta),
              title: Text('Drive With Us'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.driveWithUs);
              },
            ),
            ListTile(
              leading: Icon(Icons.discount),
              title: Text('Promotions'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.promotions);
              },
            ),
            ListTile(
              leading: Icon(Icons.scanner),
              title: Text('Scan'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.scan);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Places'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.favoritePlaces);
              },
            ),
          ],
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.help);
            },
          ),
          if (AuthService().isLoggedIn()) ...[
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                AuthService().signOut();
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ] ,

          if(!AuthService().isLoggedIn()) ...[
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Sign Up'),
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
