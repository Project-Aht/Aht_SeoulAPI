import 'package:aht_dimigo/screens/grade_calculator_screen.dart';
import 'package:aht_dimigo/screens/myinfo_screen.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';
import '../themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/firebase/auth.dart';
import 'login_screen.dart';
import 'privacy_screen.dart';
import 'version_screen.dart';
import 'dart:math';

class DeleteSubjectScreen extends StatefulWidget {
  const DeleteSubjectScreen({super.key});

  @override
  State<DeleteSubjectScreen> createState() => _DeleteSubjectScreenState();
}

class _DeleteSubjectScreenState extends State<DeleteSubjectScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight / 844 * 124,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight / 844 * 73),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: screenWidth / 390 * 20),
                          Transform.rotate(
                            angle: 0,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_rounded,
                                size: screenWidth / 390 * 35,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth / 390 * 112),
                          const Text(
                            '과목삭제',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(width: screenWidth / 390 * 20),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth / 390 * 358,
                  height: screenHeight / 844 * 2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight / 844 * 16,
                    right: screenWidth / 390 * 17,
                    left: screenWidth / 390 * 17,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
