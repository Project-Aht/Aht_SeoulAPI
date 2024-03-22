import 'package:aht_dimigo/screens/grade_calculator_screen.dart';
import 'package:aht_dimigo/screens/myinfo_screen.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';
import '../themes/color_theme.dart';
import 'package:flutter/material.dart';
import '../firebase/exam.dart';
import '../firebase/instance.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/firebase/auth.dart';
import 'login_screen.dart';
import 'privacy_screen.dart';
import 'version_screen.dart';
import 'dart:math';

Instance _instance = Get.find<Instance>();

class DeleteSubjectScreen extends StatefulWidget {
  const DeleteSubjectScreen({super.key});

  @override
  State<DeleteSubjectScreen> createState() => _DeleteSubjectScreenState();
}

class _DeleteSubjectScreenState extends State<DeleteSubjectScreen> {
  bool loading = false;
  List<Exam> exams = _instance.exams;
  List<String> subjectList = [];
  List<int> countexam = [];

  countExam() {
    for (int i = 0; i < subjectList.length; i++) {
      countexam.add(0);
    }
    for (int i = 0; i < exams.length; i++) {
      for (int j = 0; j < subjectList.length; j++) {
        if (exams[i].subject == subjectList[j]) {
          countexam[j]++;
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _instance = Get.find<Instance>();
    exams = _instance.exams;
    subjectList = _instance.subjects;
    countExam();
  }

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight / 844 * 644,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: subjectList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: screenHeight / 844 * 12,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: screenWidth / 390 * 358,
                              height: screenHeight / 844 * 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index % 2 == 1)
                                    ? const Color(0xFFF1F1F1)
                                    : const Color(0xFF38498E),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: screenWidth / 390 * 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: subjectList[index],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: (index % 2 == 1)
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenHeight / 844 * 2,
                                              ),
                                              CustomText(
                                                text:
                                                    '수행평가 ${countexam[index]}건',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: (index % 2 == 1)
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.delete_outline_rounded,
                                              color: (index % 2 == 1)
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                            onTap: () async {
                                              await Exam.removeSubject(
                                                  subjectList[index]);
                                              setState(() {});
                                              Get.snackbar(
                                                '알림',
                                                '과목 삭제가 완료되었습니다.',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                duration:
                                                    const Duration(seconds: 2),
                                              );
                                              setState(() {});
                                            },
                                          ),
                                          SizedBox(
                                              width: screenWidth / 390 * 20),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
