

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentServices {
  static Future<bool> addNewCard(Map<String, dynamic> s,String id) async {
    try {
      await FirebaseFirestore.instance.collection('paymentCards').doc(id).set(s);
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

  static Future<QuerySnapshot<Map<String, dynamic>>> getCards() async {
    CustomUser? currentUser = await AuthService().user.first;
    String userId = currentUser?.uid ?? '';
    return await FirebaseFirestore.instance
        .collection('paymentCards')
        .where('userId', isEqualTo: userId)
        .get();
  }

  static Future<bool> removeCard({required String cardId}) async {

    try {
      await FirebaseFirestore.instance.collection('paymentCards').doc(cardId).delete();
      Fluttertoast.showToast(
          msg: "Card Removed Successfully",
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
          msg: error.toString(),
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

  static Future<Map<String, dynamic>?> getCardById(String cardId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('paymentCards')
          .doc(cardId)
          .get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        Fluttertoast.showToast(
            msg: "Card not found",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.yellow[900],
            textColor: Colors.white,
            fontSize: 16.0
        );
        return null;
      }
    } catch (error) {
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return null;
    }
  }


  static Future<bool> updateCard({required String cardId, required Map<String, dynamic> data}) async {
    try {
      await FirebaseFirestore.instance.collection('paymentCards').doc(cardId).update(data);
      Fluttertoast.showToast(
          msg: "Card Updated Successfully",
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
          msg: error.toString(),
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

}