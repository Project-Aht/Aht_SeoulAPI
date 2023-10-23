import 'dart:io';
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
    .child(userInfo?['school']['name'])
    .child(userInfo?['school']['grade'])
    .child(userInfo?['school']['class']);

class Storage {
  static void initExamRoute() {
    examImage = _storage
        .ref('exam')
        .child(userInfo!['school']['name'])
        .child(userInfo!['school']['grade'])
        .child(userInfo!['school']['class']);
  }

  static Future<bool> uploadProfile(File file) async {
    try {
      profile.child(userInfo!['email']).putFile(file);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<File?> getProfile() async {
    try {
      Uint8List? data = await profile.child(userInfo!['email']).getData();
      data ??= await profile.child('default').getData();
      File file = File.fromRawPath(data!);
      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> removeProfile() async {
    try {
      await profile.child(userInfo!['email']).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> uploadExamImages(String title, List<File> files) async {
    try {
      initExamRoute();
      for (int i = 0; i < files.length; i++) {
        await examImage.child(title).child('$i').putFile(files[i]);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<File>?> getExamImages(String title) async {
    try {
      initExamRoute();
      List<Reference> images = (await examImage.child(title).listAll()).items;
      List<File> files = [];
      for (Reference image in images) {
        Uint8List data = (await image.getData())!;
        files.add(File.fromRawPath(data));
      }
      return files;
    } catch (e) {
      print(e);
      return null;
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
