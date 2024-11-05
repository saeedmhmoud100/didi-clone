import 'package:flutter/material.dart';

class PromotionsPage extends StatelessWidget {
  final List<Map<String, String>> promotions = [
    {
      "title": "25% Off Your First Ride",
      "description": "Sign up now and get 25% off your first ride with us!",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "Refer a Friend and Earn Rewards",
      "description": "Refer a friend and both of you will earn rewards for your next ride.",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "Weekend Special: 20% Off",
      "description": "Enjoy 20% off rides every weekend. Book now!",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "Loyalty Program: Earn Points",
      "description": "Join our loyalty program to earn points for every ride and redeem them for discounts.",
      "image": "https://via.placeholder.com/300",
    },
    // Add more promotions here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotions"),
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
              "Current Promotions",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Check out our latest offers and discounts!",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // Section: Promotions List
            ListView.builder(
              itemCount: promotions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildPromotionCard(promotions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each promotion card
  Widget _buildPromotionCard(Map<String, String> promotion) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promotion Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              promotion["image"] ?? "",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  promotion["title"] ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Description
                Text(
                  promotion["description"] ?? "",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
                // Redeem Button
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to redeem the promotion or navigate to details
                  },
                  child: Text("Redeem Now", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
