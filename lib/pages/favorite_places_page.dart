import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePlacesPage extends StatelessWidget {
  const FavoritePlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places'),
      ),
      body: const Center(
        child: Text('Favorite Places Page'),
      ),
    );
  }
}