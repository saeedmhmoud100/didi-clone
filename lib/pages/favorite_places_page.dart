import 'package:flutter/material.dart';

class FavoritePlacesPage extends StatelessWidget {
  final List<Map<String, String>> favoritePlaces = [
    {
      "name": "Eiffel Tower",
      "location": "Paris, France",
      "image": "https://via.placeholder.com/150", // Example image URL
    },
    {
      "name": "Great Wall of China",
      "location": "Beijing, China",
      "image": "https://via.placeholder.com/150", // Example image URL
    },
    {
      "name": "Machu Picchu",
      "location": "Cusco, Peru",
      "image": "https://via.placeholder.com/150", // Example image URL
    },
    {
      "name": "Taj Mahal",
      "location": "Agra, India",
      "image": "https://via.placeholder.com/150", // Example image URL
    },
    // Add more favorite places here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Places"),
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
              "Your Favorite Places",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Explore the places you love and save them for easy access.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // Section: Favorite Places List
            ListView.builder(
              itemCount: favoritePlaces.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildFavoritePlaceCard(favoritePlaces[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each favorite place card
  Widget _buildFavoritePlaceCard(Map<String, String> place) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Place Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                place["image"]!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),

            // Place Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place["name"]!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place["location"]!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),

            // Remove from favorites button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Add functionality to remove place from favorites
              },
            ),
          ],
        ),
      ),
    );
  }
}
