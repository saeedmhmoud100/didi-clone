import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Welcome Text
            _buildWelcomeSection(),
            const SizedBox(height: 20),

            // Section: Featured Content
            _buildFeaturedSection(),
            const SizedBox(height: 20),

            // Section: Quick Access Options
            _buildQuickAccessSection(),
          ],
        ),
      ),
    );
  }

  // Widget to build the Welcome Section
  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome Back!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "We're happy to see you again! Explore new features and enjoy your experience.",
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // Widget to build the Featured Section
  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Featured Content",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,  // You can replace this with dynamic content
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/150'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget to build the Quick Access Section
  Widget _buildQuickAccessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Access",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: 4,  // You can change the number of quick access options
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Add navigation or functionality here
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.star, // Replace with icons of your choice
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
