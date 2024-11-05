import 'package:flutter/material.dart';

class DriveWithUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drive With Us"),
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
              "Drive With Us",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Join our team and enjoy flexible hours, great earnings, and an exciting opportunity to meet new people.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 25),

            // Section: Benefits
            Text(
              "Why Drive With Us?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            _buildBenefitItem(Icons.schedule, "Flexible Hours", "Work on your own schedule and be your own boss."),
            _buildBenefitItem(Icons.monetization_on, "Earn More", "Competitive rates to maximize your earnings."),
            _buildBenefitItem(Icons.support_agent, "24/7 Support", "We are here to support you anytime you need."),
            SizedBox(height: 25),

            // Section: Requirements
            Text(
              "Driver Requirements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            _buildRequirementItem("• Must be at least 21 years old"),
            _buildRequirementItem("• Have a valid driver’s license"),
            _buildRequirementItem("• Own a vehicle in good condition"),
            _buildRequirementItem("• Clean driving record"),
            _buildRequirementItem("• Pass a background check"),
            SizedBox(height: 25),

            // Section: Apply Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation to an application form or signup process
                },
                child: Text("Apply Now", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each benefit item
  Widget _buildBenefitItem(IconData icon, String title, String description) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.deepPurple, size: 30),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
    );
  }

  // Widget to build each requirement item
  Widget _buildRequirementItem(String requirement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        requirement,
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
    );
  }
}
