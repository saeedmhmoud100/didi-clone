

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentServices {
  static Future<bool> addNewCard(Map<String, dynamic> s,String id) async {
    try {
      await FirebaseFirestore.instance.collection('paymentCards').doc(id).set(
          s);
      Fluttertoast.showToast(
          msg: "Card Added Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return true;
    } catch (error) {
      Fluttertoast.showToast(
          msg: "An error occurred while adding the card",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }


  }
  static Future<void> removeCard({required String cardId}) async {
    // Remove card from the user's account
    print("Card Removed Successfully");
  }
}