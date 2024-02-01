import 'dart:typed_data';
import 'package:get/get.dart';
import 'instance.dart';
import 'package:firebase_storage/firebase_storage.dart';

final Instance _instance = Get.find<Instance>();
final FirebaseStorage _storage = _instance.storage;
Map<String, dynamic>? userInfo = _instance.userInfo;
Reference profile = _storage.ref('profile');
Reference examImage = _storage
    .ref('exam')
    .child('${userInfo!['school']['name']}')
    .child('${userInfo!['school']['grade']}')
    .child('${userInfo!['school']['class']}');

class Storage {
  static void initExamRoute() {
    examImage = _storage
        .ref('exam')
        .child('${userInfo!['school']['name']}')
        .child('${userInfo!['school']['grade']}')
        .child('${userInfo!['school']['class']}');
  }

  static Future<bool> uploadProfile(Uint8List byte) async {
    try {
      await profile.child(userInfo!['email']).putData(
            byte,
            SettableMetadata(
              contentType: 'image/jpeg',
            ),
          );
      await _instance.getUserInfo();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Uint8List?> getProfile() async {
    try {
      Uint8List? data;
      try {
        data = await profile.child(userInfo!['email']).getData();
      } catch (e) {
        data = await profile.child('default.jpeg').getData();
      }
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> removeProfile() async {
    try {
      await profile.child(userInfo!['email']).delete();
      _instance.getUserInfo();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> uploadExamImages(
      String title, List<Uint8List> bytes) async {
    try {
      initExamRoute();
      for (int i = 0; i < bytes.length; i++) {
        await examImage.child(title).child('$i').putData(
              bytes[i],
              SettableMetadata(
                contentType: 'image/jpeg',
              ),
            );
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<Uint8List>> getExamImages(String title) async {
    try {
      initExamRoute();
      List<Reference> images = (await examImage.child(title).listAll()).items;
      List<Uint8List> bytes = [];
      for (Reference image in images) {
        Uint8List data = (await image.getData())!;
        bytes.add(data);
      }
      return bytes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> removeExamImages(String title) async {
    try {
      initExamRoute();
      await examImage.child(title).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
