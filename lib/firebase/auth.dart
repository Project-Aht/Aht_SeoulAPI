import 'package:aht_dimigo/firebase/image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'instance.dart';

class Auth {
  static Future<bool> signup({
    required String email,
    required String pw,
    required String schoolName,
    required int schoolGrade,
    required int schoolClass,
  }) async {
    final Instance instance = Get.find<Instance>();
    final FirebaseAuth firebaseAuth = instance.firebaseAuth;
    final FirebaseFirestore firestore = instance.firestore;

    try {
      await firebaseAuth.createUserWithEmailAndPassword(
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
      await Get.find<Instance>().getUserInfo();

      final prefs = await SharedPreferences.getInstance();
      prefs.remove('email');
      prefs.remove('pw');
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
    final Instance instance = Get.find<Instance>();
    final FirebaseAuth firebaseAuth = instance.firebaseAuth;

    final prefs = await SharedPreferences.getInstance();
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);
      await Get.find<Instance>().getUserInfo();
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
    final Instance instance = Get.find<Instance>();
    final FirebaseAuth firebaseAuth = instance.firebaseAuth;
    final prefs = await SharedPreferences.getInstance();

    try {
      await firebaseAuth.signOut();
      Get.find<Instance>().getUserInfo();
      prefs.remove('pw');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }

    return true;
  }

  static Future<bool> quit() async {
    final Instance instance = Get.find<Instance>();
    final FirebaseAuth firebaseAuth = instance.firebaseAuth;
    final FirebaseFirestore firestore = instance.firestore;
    final prefs = await SharedPreferences.getInstance();

    try {
      await Storage.removeProfile();
      firestore.collection('profile').doc(instance.userInfo['email']).delete();
      await firebaseAuth.currentUser?.delete();
      await firebaseAuth.signOut();
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
