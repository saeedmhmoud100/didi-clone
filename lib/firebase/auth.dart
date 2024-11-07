import 'package:didi_clone/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomUser {
  final String uid;
  final String? email;
  // final String? username;

  CustomUser({required this.uid, this.email});
}
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  CustomUser? _userFromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    }
    return CustomUser(uid: user.uid, email: user.email);
  }

  Stream<CustomUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


  // Stream<CustomUser?> get user {
  //   return _auth.authStateChanges().map(_userFromFirebaseUser as CustomUser? Function(User? event));
  // }
  // register with email & password
  Future<void> registerWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        // await user.updateDisplayName(username);
        await user.reload();
        user = _auth.currentUser;
      }

      await Future.delayed(Duration(seconds: 1));

      Navigator.pushNamed(context, AppRoutes.login);

      Fluttertoast.showToast(
          msg: "Account created successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (error) {
      String message = error.code;
      if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      }

      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in with email & password
  Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await Future.delayed(Duration(seconds: 1));

      Fluttertoast.showToast(
          msg: "Login successful",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }on FirebaseAuthException catch (error) {
      String message =error.code;
      if(error.code == 'user-not-found'){
        message = 'No user found for that email.';
      }else if(error.code == 'wrong-password'){
        message = 'Wrong password provided for that user.';
      }

      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }


}