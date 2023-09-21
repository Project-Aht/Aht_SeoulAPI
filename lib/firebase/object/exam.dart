import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../instance.dart';

class Exam {
  List<DateTime> dates;
  List<String> admin;
  String title;
  String range;
  String memo;
  String subject;
  int grade;
  int? score;

  static FirebaseAuth firebaseAuth = Get.find<Instance>().firebaseAuth;
  static FirebaseFirestore firestore = Get.find<Instance>().firestore;
  static Map<String, dynamic>? userInfo = Get.find<Instance>().userInfo;
  static List<Exam> exams = Get.find<Instance>().exams;
  CollectionReference<Map<String, dynamic>> collection = firestore
      .collection('school')
      .doc(userInfo?['school']['name'])
      .collection('exam');

  Exam({
    required this.title,
    required this.subject,
    required this.dates,
    required this.memo,
    required this.admin,
    required this.grade,
    required this.range,
    this.score,
  });

  Future<void> remove() async {
    collection.doc(title).delete();
    exams.remove(this);
  }
}
