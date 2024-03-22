import 'package:aht_dimigo/firebase/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'exam.dart';

class Instance extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  late Map<String, dynamic> userInfo;
  bool examInit = false;
  List<Exam> exams = [];
  List<String> subjects = [];

  Future<void> getUserInfo() async {
    try {
      userInfo = (await firestore
              .collection('profile')
              .doc(firebaseAuth.currentUser?.email)
              .get())
          .data()!;
      userInfo['email'] = firebaseAuth.currentUser!.email;
      update();
      userInfo['image'] = await Storage.getProfile();
      update();
    } catch (e) {
      print('network arror');
    }

    return;
  }

  Future<void> getExams() async {
    exams = await Exam.getAll() ?? [];
    subjects = await Exam.getSubjects();
    update();
  }
}
