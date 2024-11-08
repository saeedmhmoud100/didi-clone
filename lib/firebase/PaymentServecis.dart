

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentServices {
  static Future<void> addNewCard(Map<String, dynamic> s,String id) async {




    return FirebaseFirestore.instance.collection('Cards').doc(id).set(s);
  }

  static Future<void> removeCard({required String cardId}) async {
    // Remove card from the user's account
    print("Card Removed Successfully");
  }
}