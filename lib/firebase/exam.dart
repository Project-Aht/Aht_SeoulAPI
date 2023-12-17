import 'dart:typed_data';

import 'package:aht_dimigo/firebase/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'instance.dart';

final Instance _instance = Get.find<Instance>();
final FirebaseFirestore _firestore = _instance.firestore;
Map<String, dynamic>? userInfo = _instance.userInfo;
List<Exam> exams = _instance.exams;
CollectionReference<Map<String, dynamic>> collection = _firestore
    .collection('school')
    .doc(userInfo?['school']['name'])
    .collection('${userInfo?['school']['grade']}')
    .doc('${userInfo?['school']['class']}')
    .collection('exam');

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
      _instance.getUserInfo();
      Exam exam = Exam(
        title: title,
        subject: subject,
        dates: dates,
        memo: memo,
        range: range,
        score: score,
        images: bytes,
      );
      exams.add(exam);
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
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Exam?> get(String title) async {
    try {
      Map<String, dynamic> data = (await collection.doc(title).get()).data()!;
      List<Uint8List> bytes = (await Storage.getExamImages(title))!;
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
    List<Exam> docs = [];
    try {
      for (var doc in (await collection.get()).docs) {
        Map<String, dynamic> data = doc.data();
        List<Uint8List> bytes = (await Storage.getExamImages(doc.id)) ?? [];
        data['dates'] = List.generate(
          data['dates'].length,
          (i) => DateTime.parse(
            data['dates'][i].toDate().toString(),
          ),
        );

        docs.add(
          Exam(
            title: doc.id,
            subject: data['subject'],
            range: data['range'],
            dates: data['dates'],
            memo: data['memo'],
            score: data['score'],
            images: bytes,
          ),
        );
      }
      print(docs);
      return docs;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<String>> getSubjects() async {
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
    try {
      print(1);
      List<String> subjects = await getSubjects();
      print(2);
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

  Future<bool> remove() async {
    try {
      Storage.removeExamImages(title);
      collection.doc(title).delete();
      exams.remove(this);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
