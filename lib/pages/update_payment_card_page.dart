



import 'package:didi_clone/components/loadingButton.dart';
import 'package:didi_clone/firebase/PaymentServecis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatePaymentCardPage extends StatefulWidget {
  late final String cardId;
  final Function onUpdate;
  UpdatePaymentCardPage({required this.cardId,required this.onUpdate});
  @override
  _UpdatePaymentCardPageState createState() => _UpdatePaymentCardPageState();
}

class _UpdatePaymentCardPageState extends State<UpdatePaymentCardPage>{

  Map<String, dynamic>? card;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCardData();
  }

  Future<void> _fetchCardData() async {
    card = await PaymentServices.getCardById(widget.cardId);
    cardNumberController.text = card?['cardNumber'] ?? '';
    expiryDateController.text = card?['expiryDate'] ?? '';
    cvvController.text = card?['cvv'] ?? '';
    cardHolderNameController.text = card?['cardHolderName'] ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Card"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cardNumberController,
            decoration: const InputDecoration(
              labelText: 'Card Number',
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: expiryDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: cvvController,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            controller: cardHolderNameController,
            decoration: const InputDecoration(
              labelText: 'Card Holder Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 15),
              _isLoading ? const Loading() :
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> cardData = {
                    'cardNumber': cardNumberController.text,
                    'expiryDate': expiryDateController.text,
                    'cvv': cvvController.text,
                    'cardHolderName': cardHolderNameController.text,
                  };
                  bool b = await PaymentServices.updateCard(
                    cardId: widget.cardId,
                    data: cardData
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  if(b) {
                    widget.onUpdate();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Update"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}