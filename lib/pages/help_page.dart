import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Help Header
            const Text(
              "How can we help you?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Find answers to common questions or contact us directly.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 25),

            // Section: FAQ
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildFAQItem("How do I reset my password?", "You can reset your password from the Account Settings page or by clicking 'Forgot Password' on the login screen."),
            _buildFAQItem("How do I update my profile information?", "Go to your Profile page, tap on 'Edit Profile', and update your information."),
            _buildFAQItem("How can I delete my account?", "To delete your account, please contact our support team through the Contact Us form."),
            const SizedBox(height: 25),

            // Section: Contact Us
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Add send message functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              foregroundColor: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Send Message"),
              ),

            ),
            const SizedBox(height: 25),

            // Section: Additional Resources
            const Text(
              "Additional Resources",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.article, color: Colors.deepPurple),
              title: const Text("User Guide"),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Navigate to User Guide page or PDF
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.deepPurple),
              title: const Text("Community Forum"),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Navigate to Community Forum page
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.contact_support, color: Colors.deepPurple),
              title: const Text("Contact Support"),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Navigate to Contact Support page or initiate support chat
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build FAQ items
  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            answer,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
