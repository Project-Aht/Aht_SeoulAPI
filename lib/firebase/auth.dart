import 'dart:io';

import 'package:aht_dimigo/firebase/image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'instance.dart';

final _instance = Get.find<Instance>();
final FirebaseAuth _firebaseAuth = _instance.firebaseAuth;
final FirebaseFirestore firestore = _instance.firestore;

class Auth {
  static Future<bool> signup({
    required String email,
    required String pw,
    required String schoolName,
    required int schoolGrade,
    required int schoolClass,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pw);

      await firestore.collection('profile').doc(email).set({
        'point': 0,
        'school': {
          'name': schoolName,
          'grade': schoolGrade,
          'class': schoolClass,
        },
        'get_notice': true,
        'notice_detail': <String, bool>{},
      });
      Get.find<Instance>().getUserInfo();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  static Future<bool> signin({
    required String email,
    required String pw,
    required bool autoLogin,
    required bool savingId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pw);
      Get.find<Instance>().getUserInfo();
      if (autoLogin) {
        prefs.setString('email', email);
        prefs.setString('pw', pw);
      } else if (savingId) {
        prefs.setString('email', email);
        prefs.remove('pw');
      } else {
        prefs.remove('email');
        prefs.remove('pw');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
    return true;
  }

  static Future<bool> signout() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await _firebaseAuth.signOut();
      Get.find<Instance>().getUserInfo();
      prefs.remove('pw');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }

    return true;
  }

  static Future<bool> quit() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Storage.removeProfile();
      firestore
          .collection('profile')
          .doc(_instance.userInfo!['email'])
          .delete();
      await _firebaseAuth.currentUser?.delete();
      await _firebaseAuth.signOut();
      Get.find<Instance>().getUserInfo();
      prefs.remove('email');
      prefs.remove('pw');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }

    return true;
  }
}
