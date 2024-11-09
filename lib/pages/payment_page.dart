import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didi_clone/components/loadingButton.dart';
import 'package:didi_clone/firebase/PaymentServecis.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:didi_clone/pages/update_payment_card_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

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
            _AddPaymentMethod(onCardAdded: _refreshSavedCards),
            const SizedBox(height: 25),

            // Section: Saved Payment Methods
            const Text(
              "Saved Payment Methods",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),

            // Example of Saved Card (You can add more dynamically)
            _SavedPaymentMethod(),
            const SizedBox(height: 15),

            // Section: Other Payment Options
            const Text(
              "Other Payment Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Payment Options like PayPal, Google Pay, etc.
            _PaymentOptions(),
          ],
        ),
      ),
    );
  }
  void _refreshSavedCards() {
    setState(() {});
  }
}

class _AddPaymentMethod extends StatefulWidget {

  final VoidCallback onCardAdded;
  _AddPaymentMethod({required this.onCardAdded});

  @override
  __AddPaymentMethodState createState() => __AddPaymentMethodState();
}

class __AddPaymentMethodState extends State<_AddPaymentMethod> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            "Add a New Card",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(
              labelText: 'Card Number',
              prefixIcon: const Icon(Icons.credit_card),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),
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
              const SizedBox(width: 15),
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
          const SizedBox(height: 15),
          TextField(
            controller: cardHolderNameController,
            decoration: InputDecoration(
              labelText: 'Card Holder Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 25),
          _isLoading
              ? const Loading()
              : ElevatedButton(
                  onPressed: () async {
                    if (cardNumberController.text.isEmpty ||
                        expiryDateController.text.isEmpty ||
                        cvvController.text.isEmpty ||
                        cardHolderNameController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please fill all the fields",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.yellow[900],
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    }

                    setState(() {
                      _isLoading = true;
                    });
                    String cardId = randomAlphaNumeric(20);
                    bool b = await AuthService()
                        .user
                        .firstWhere((user) => user != null)
                        .then((user) async {
                      return await PaymentServices.addNewCard({
                        "cardId": cardId,
                        "userId": user!.uid,
                        "cardNumber": cardNumberController.text,
                        "expiryDate": expiryDateController.text,
                        "cvv": cvvController.text,
                        "cardHolderName": cardHolderNameController.text,
                      }, cardId);
                    });

                    setState(() {
                      _isLoading = false;
                    });

                    if (b) {
                      cardNumberController.clear();
                      expiryDateController.clear();
                      cvvController.clear();
                      cardHolderNameController.clear();
                      widget.onCardAdded();
                    }
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Save Card",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
        ],
      ),
    );
  }
}

class _SavedPaymentMethod extends StatefulWidget {
  @override
  __SavedPaymentMethodState createState() => __SavedPaymentMethodState();
}

class __SavedPaymentMethodState extends State<_SavedPaymentMethod> {
  Future<List<Map<String, dynamic>>> _getSavedCards() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await PaymentServices.getCards();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Map<String, bool> _loadingStates = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getSavedCards(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loading());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading cards"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No saved cards"));
        } else {
          List<Map<String, dynamic>> cards = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> card = cards[index];
              String cardId =
                  card['cardId'];
              bool isLoading = _loadingStates[cardId] ?? false;

              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading:
                      const Icon(Icons.credit_card, color: Colors.deepPurple),
                  title: Text(
                      "**** **** **** ${card['cardNumber']?.substring(card['cardNumber']?.length - 4 ?? 0) ?? '****'}"),
                  subtitle: Text("Exp: ${card['expiryDate'] ?? 'N/A'}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(isLoading)
                        Loading()
                      else
                           IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.deepPurple),
                        onPressed: () async {
                          setState(() {
                            _loadingStates[cardId] = true;
                          });
                          await PaymentServices.removeCard(cardId: cardId);
                          setState(() {
                            _loadingStates[cardId] = false;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: Colors.deepPurple),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => UpdatePaymentCardPage(cardId: cardId, onUpdate: () {
                              setState(() {});
                            }),
                          );
                        },
                      ),
                    ],
                  )

                ),
              );
            },
          );
        }
      },
    );
  }
}

class _PaymentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.money, color: Colors.deepPurple),
          title: const Text("Cash"),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Add PayPal payment functionality here
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet,
              color: Colors.deepPurple),
          title: const Text("PayPal"),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Add PayPal payment functionality here
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.account_balance, color: Colors.deepPurple),
          title: const Text("Google Pay"),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Add Google Pay functionality here
          },
        ),
      ],
    );
  }
}
