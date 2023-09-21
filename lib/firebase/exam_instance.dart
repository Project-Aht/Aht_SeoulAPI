import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'instance.dart';
import 'object/exam.dart';

class ExamInstance {
  static final Instance _instance = Get.find<Instance>();
  static final FirebaseFirestore _firestore = _instance.firestore;
  static Map<String, dynamic>? userInfo = _instance.userInfo;
  static List<Exam> exams = _instance.exams;
  static CollectionReference<Map<String, dynamic>> collection = _firestore
      .collection('school')
      .doc(userInfo?['school']['name'])
      .collection('exam');

  static Future<List<Map<String, dynamic>>> getAllExam(
      CollectionReference<Map<String, dynamic>> collection) async {
    List<Map<String, dynamic>> docs = [];
    for (var doc in (await collection.get()).docs) {
      docs.add(doc.data());
    }
    return docs;
  }

  static Future<void> setExam({
    required String title,
    required String subject,
    required List<DateTime> dates,
    required String memo,
    required String range,
    required List<String> admin,
    required int grade,
    int? score,
  }) async {
    try {
      await collection.doc(title).set(
        {
          'subject': subject,
          'range': range,
          'admin': admin,
          'dates': dates,
          'grade': grade,
          'memo': memo,
          if (score != null) 'score': score,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<Exam?> getExam(String title) async {
    try {
      Map<String, dynamic>? data = (await collection.doc(title).get()).data();
      return Exam(
        title: title,
        subject: data?['subject'],
        range: data?['range'],
        dates: data?['dates'],
        memo: data?['memo'],
        admin: data?['admin'],
        grade: data?['grade'],
        score: data?['score'],
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Exam?> updateExam(Map<String, dynamic> kargs) async {
    return null;
  }
}
