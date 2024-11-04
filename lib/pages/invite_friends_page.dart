import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
      ),
      body: const Center(
        child: Text('Invite Friends Page'),
      ),
    );
  }
}