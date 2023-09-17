import 'package:aht_dimigo/screens/register_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    () => const ResgisterExamScreen();
                  },
                  child: const Text('정보 추가하기')),
            ],
          ),
        ),
      ),
    );
  }
}
