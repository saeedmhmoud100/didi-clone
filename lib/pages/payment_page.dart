import 'package:didi_clone/firebase/PaymentServecis.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Add New Card
            _AddPaymentMethod(),
            SizedBox(height: 25),

            // Section: Saved Payment Methods
            const Text(
              "Saved Payment Methods",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            SizedBox(height: 10),

            // Example of Saved Card (You can add more dynamically)
            _SavedPaymentMethod(),
            SizedBox(height: 15),

            // Section: Other Payment Options
            const Text(
              "Other Payment Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Payment Options like PayPal, Google Pay, etc.
            _PaymentOptions(),
          ],
        ),
      ),
    );
  }
}

class _AddPaymentMethod extends StatefulWidget {
  @override
  __AddPaymentMethodState createState() => __AddPaymentMethodState();
}

class __AddPaymentMethodState extends State<_AddPaymentMethod> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Add a New Card",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(
              labelText: 'Card Number',
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: expiryDateController,
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
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> m= {
                "cardNumber": cardNumberController.text,
                "expiryDate": expiryDateController.text,
                "cvv": cvvController.text,
                "cardHolderName": cardHolderNameController.text,
              };

              PaymentServices.addNewCard(m,AuthService().user.uid);
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
        ],
      ),
    );
  }
}

extension on Stream<CustomUser?> {
  String get uid => "";
}

class _SavedPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class _PaymentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.money, color: Colors.deepPurple),
          title: Text("Cash"),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Add PayPal payment functionality here
          },
        ),
        Divider(),
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
    );
  }
}
