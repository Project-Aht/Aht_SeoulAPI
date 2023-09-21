import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase/instance.dart';
import 'screens/register_exam_screen.dart';
import 'screens/grade_calculator_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Instance());
  await Get.find<Instance>().getUserInfo();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ResgisterExamScreen());
                  },
                  child: const Text('정보 추가하기')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const GradeCalclulatorScreen());
                  },
                  child: const Text('성적 계산기')),
            ],
          ),
        ),
      ),
    );
  }
}
