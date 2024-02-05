



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthUtils{

  static Future<bool> loginIn({required String email , required String password}) async {
    bool isLoggedIn = false;
    try {
      var userData = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      isLoggedIn = userData.user != null;
      if (isLoggedIn) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(AppSettings.emailSharedPreferances, email);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return isLoggedIn;
  }

  static Future<bool> createAccount({required String email , required String password}) async {
    bool isCreated = false;
    try {
      var userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      isCreated = userData.user != null;
      if (isCreated) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(AppSettings.emailSharedPreferances, email);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return isCreated;
  }

}