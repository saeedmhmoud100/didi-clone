import 'package:flutter/material.dart';

class MyTripsPage extends StatelessWidget {
  final List<Map<String, String>> trips = [
    {
      "destination": "New York City",
      "date": "Nov 10, 2024",
      "status": "Completed",
    },
    {
      "destination": "Los Angeles",
      "date": "Oct 15, 2024",
      "status": "Canceled",
    },
    {
      "destination": "San Francisco",
      "date": "Sep 20, 2024",
      "status": "Upcoming",
    },
    {
      "destination": "Miami",
      "date": "Dec 1, 2024",
      "status": "Upcoming",
    },
    // Add more trips here
  ];

  MyTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Trips"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Header
            const Text(
              "Your Trip History",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "View your past, upcoming, and canceled trips.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // Section: Trips List
            ListView.builder(
              itemCount: trips.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildTripCard(trips[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each trip card
  Widget _buildTripCard(Map<String, String> trip) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Destination
            Text(
              trip["destination"] ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Trip Date
            Text(
              trip["date"] ?? "",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            // Trip Status
            Text(
              trip["status"] ?? "",
              style: TextStyle(
                fontSize: 16,
                color: trip["status"] == "Completed"
                    ? Colors.green
                    : trip["status"] == "Canceled"
                    ? Colors.red
                    : Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Add functionality to view trip details
                  },
                  child: const Text("View Details"),
                ),
                const SizedBox(width: 8),
                if (trip["status"] == "Upcoming")
                  TextButton(
                    onPressed: () {
                      // Add functionality to cancel the trip
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: const Text("Cancel Trip"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
