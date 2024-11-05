import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Add New Card
            Text(
              "Add a New Card",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            // Card Number Field
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Expiry Date and CVV Fields
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            // Card Holder Name Field
            TextField(
              controller: cardHolderNameController,
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Save Card Button
            ElevatedButton(
              onPressed: () {
                // Add save card functionality here
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Save Card", style: TextStyle(color: Colors.white)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.white,

              ),
            ),
            SizedBox(height: 25),

            // Section: Saved Payment Methods
            Text(
              "Saved Payment Methods",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.deepPurple),
            ),
            SizedBox(height: 10),

            // Example of Saved Card (You can add more dynamically)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.credit_card, color: Colors.deepPurple),
                title: Text("**** **** **** 1234"),
                subtitle: Text("Exp: 12/23"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.deepPurple),
                  onPressed: () {
                    // Add delete card functionality here
                  },
                ),
              ),
            ),
            SizedBox(height: 15),

            // Section: Other Payment Options
            Text(
              "Other Payment Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Payment Options like PayPal, Google Pay, etc.
            ListTile(
              leading: Icon(Icons.money, color: Colors.deepPurple),
              title: Text("Cash"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Add PayPal payment functionality here
              },
            ),
            Divider(),
            // Payment Options like PayPal, Google Pay, etc.
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.deepPurple),
              title: Text("PayPal"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Add PayPal payment functionality here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_balance, color: Colors.deepPurple),
              title: Text("Google Pay"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Add Google Pay functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
