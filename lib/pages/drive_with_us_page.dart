import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriveWithUsPage extends StatelessWidget {
  const DriveWithUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drive with Us'),
      ),
      body: const Center(
        child: Text('Drive with Us Page'),
      ),
    );
  }
}