import 'dart:typed_data';

import 'package:aht_dimigo/firebase/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'instance.dart';

Future<void> initExam() async {
  _instance = Get.find<Instance>();
  _firestore = _instance.firestore;
  userInfo = _instance.userInfo;
  exams = _instance.exams;
  collection = _firestore
      .collection('school')
      .doc(userInfo['school']['name'])
      .collection('${userInfo['school']['grade']}')
      .doc('${userInfo['school']['class']}')
      .collection('exam');
  _instance.examInit = true;
}

late Instance _instance;
late FirebaseFirestore _firestore;
late Map<String, dynamic> userInfo;
late List<Exam> exams;
late CollectionReference<Map<String, dynamic>> collection;

class Exam {
  List<DateTime> dates;
  String title;
  String range;
  String memo;
  String subject;
  int score;
  List<Uint8List> images;

  Exam({
    required this.title,
    required this.subject,
    required this.dates,
    required this.memo,
    required this.range,
    required this.score,
    required this.images,
  });

  static Future<Exam?> set({
    required String title,
    required String subject,
    required List<DateTime> dates,
    required String memo,
    required String range,
    required int score,
    required List<Uint8List> bytes,
  }) async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    bool docExist = await Exam.get(title) != null;
    bool imageUpload = await Storage.uploadExamImages(title, bytes);
    if (!docExist && imageUpload) {
      await collection.doc(title).set(
        {
          'subject': subject,
          'range': range,
          'dates': dates,
          'memo': memo,
          'score': score,
        },
      );
      Exam exam = Exam(
        title: title,
        subject: subject,
        dates: dates,
        memo: memo,
        range: range,
        score: score,
        images: bytes,
      );
      _instance.exams.add(exam);
      _instance.update();
      return exam;
    }
    return null;
  }

  Future<bool> update({
    String? newSubject,
    List<DateTime>? newDates,
    String? newMemo,
    String? newRange,
    int? newScore,
    List<Uint8List>? newImages,
  }) async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      if (newImages != null) {
        bool imageUpload = await Storage.uploadExamImages(title, newImages);
        if (imageUpload) images = newImages;
      }
      await collection.doc(title).set(
        {
          'subject': newSubject ?? subject,
          'range': newRange ?? range,
          'dates': newDates ?? dates,
          'score': newScore ?? score,
          'memo': newMemo ?? memo,
        },
      );
      subject = newSubject ?? subject;
      range = newRange ?? range;
      dates = newDates ?? dates;
      score = newScore ?? score;
      memo = newMemo ?? memo;
      _instance.update();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Exam?> get(String title) async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      Map<String, dynamic> data = (await collection.doc(title).get()).data()!;
      List<Uint8List> bytes = await Storage.getExamImages(title);
      return Exam(
        title: title,
        subject: data['subject'],
        range: data['range'],
        dates: data['dates'],
        memo: data['memo'],
        score: data['score'],
        images: bytes,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Exam>?> getAll() async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    List<Exam> docs = [];
    try {
      Map<String, dynamic> data;
      List<Uint8List> bytes;
      List<DateTime> dates;
      for (var doc in (await collection.get()).docs) {
        data = doc.data();
        bytes = await Storage.getExamImages(doc.id);
        dates = List.generate(
          data['dates'].length,
          (i) => DateTime.parse(
            data['dates'][i].toDate().toString(),
          ),
        )..sort((a, b) => a.compareTo(b));

        if (dates.last.isBefore(DateTime.now())) {
          Storage.removeExamImages(doc.id);
          collection.doc(doc.id).delete();
        } else {
          docs.add(
            Exam(
              title: doc.id,
              subject: data['subject'],
              range: data['range'],
              dates: dates,
              memo: data['memo'],
              score: data['score'],
              images: bytes,
            ),
          );
        }
      }
      return docs;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<String>> getSubjects() async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      List data = (await collection.parent!.get()).data()!['subject'];
      List<String> subjects = data.cast();
      if (subjects.isNotEmpty) {
        return subjects;
      } else {
        return ['국어', '수학', '영어'];
      }
    } catch (e) {
      print(e);
      return ['국어', '수학', '영어'];
    }
  }

  static Future<bool> setSubject(subject) async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      List<String> subjects = await getSubjects();
      if (subjects.isEmpty) {
        subjects = ['국어', '수학', '영어'];
      }
      if (!subjects.contains(subject)) {
        subjects.add(subject);
      }
      subjects.sort();
      collection.parent!.set({'subject': subjects});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 과목 삭제 함수 (성공시 true, 실패시 false 반환)
  static Future<bool> removeSubject(subject) async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      List<String> subjects = await getSubjects();
      if (subjects.contains(subject)) {
        subjects.remove(subject);
        collection.parent!.set({'subject': subjects});
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> remove() async {
    if (_instance.examInit == false) {
      throw Exception("exam is not initialized.");
    }
    try {
      Storage.removeExamImages(title);
      collection.doc(title).delete();
      exams.remove(this);

      _instance.update();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
