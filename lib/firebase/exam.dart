import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'instance.dart';

Instance _instance = Get.find<Instance>();
FirebaseFirestore _firestore = _instance.firestore;
Map<String, dynamic>? userInfo = _instance.userInfo;
List<Exam> exams = _instance.exams;
CollectionReference<Map<String, dynamic>> collection = _firestore
    .collection('school')
    .doc(userInfo?['school']['name'])
    .collection('exam');

class Exam {
  List<DateTime> dates;
  List<String> admin;
  String title;
  String range;
  String memo;
  String subject;
  int grade;
  int? score;

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

  static Future<Exam> set({
    required String title,
    required String subject,
    required List<DateTime> dates,
    required String memo,
    required String range,
    required List<String> admin,
    required int grade,
    int? score,
  }) async {
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
    return Exam(
      title: title,
      subject: subject,
      dates: dates,
      memo: memo,
      admin: admin,
      grade: grade,
      range: range,
    );
  }

  Future<void> update(
    Map<String, dynamic> kwargs,
  ) async {
    await collection.doc(title).set(
      {
        'subject': kwargs['subject'] ?? subject,
        'range': kwargs['range'] ?? range,
        'admin': kwargs['admin'] ?? admin,
        'dates': kwargs['dates'] ?? dates,
        'grade': kwargs['grade'] ?? grade,
        'score': kwargs['score'] ?? score,
        'memo': kwargs['memo'] ?? memo,
      },
    );
  }

  static Future<Exam> get(String title) async {
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
  }

  static Future<List<Exam>> getAll() async {
    List<Exam> docs = [];
    for (var doc in (await collection.get()).docs) {
      Map<String, dynamic> data = doc.data();
      docs.add(
        Exam(
          title: doc.id,
          subject: data['subject'],
          range: data['range'],
          dates: data['dates'],
          memo: data['memo'],
          admin: data['admin'],
          grade: data['grade'],
          score: data['score'],
        ),
      );
    }
    return docs;
  }

  Future<void> remove() async {
    collection.doc(title).delete();
    exams.remove(this);
  }
}
