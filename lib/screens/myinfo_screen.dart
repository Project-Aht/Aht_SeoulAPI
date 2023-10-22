import 'package:aht_dimigo/firebase/auth.dart';
import 'package:aht_dimigo/screens/grade_calculator_screen.dart';
import 'package:aht_dimigo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:get/get.dart';

class MyinfoScreen extends StatefulWidget {
  const MyinfoScreen({super.key});

  @override
  State<MyinfoScreen> createState() => _MyinfoScreenState();
}

class _MyinfoScreenState extends State<MyinfoScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 844 * 110,
              decoration: const BoxDecoration(
                color: AhtColors.Main_Color,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 844 * 58),
                  SizedBox(
                    height: screenHeight / 844 * 40,
                    width: screenWidth,
                    child: Row(
                      children: [
                        SizedBox(width: screenWidth / 390 * 16),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: screenHeight / 844 * 20,
                          ),
                        ),
                        SizedBox(width: screenWidth / 390 * 12),
                        const Text(
                          '마이페이지',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 36),
            Stack(
              children: [
                Container(
                  width: screenHeight / 844 * 84,
                  height: screenHeight / 844 * 84,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color.fromARGB(255, 197, 197, 197),
                        offset: Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: screenHeight / 844 * 30,
                    height: screenHeight / 844 * 30,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color.fromARGB(255, 197, 197, 197),
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: screenHeight / 844 * 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight / 844 * 26),
            SizedBox(
              width: screenWidth / 390 * 142,
              height: screenHeight / 844 * 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '1학년 2반 전지훈',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  Container(
                    width: screenWidth / 390 * 30,
                    height: screenHeight / 844 * 20,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1.50, color: Color(0xFFDE3123)),
                        borderRadius: BorderRadius.circular(8.80),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '등급',
                        style: TextStyle(
                          color: Color(0xFFDE3123),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 10),
            const Text(
              '포인트 13p',
              style: TextStyle(
                color: Color(0xFFA8A8A8),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
            SizedBox(height: screenHeight / 844 * 52),
            SizedBox(
              width: screenWidth / 390 * 270,
              height: screenHeight / 844 * 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: _GetToGradeCalculatorScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: screenWidth / 390 * 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _GetToDoneExamScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: Icon(
                            Icons.check_box_outlined,
                            color: Colors.black,
                            size: screenWidth / 390 * 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _GetToGradeCalculatorScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: Icon(
                            Icons.calculate_outlined,
                            color: Colors.black,
                            size: screenWidth / 390 * 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: _GetToGradeCalculatorScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: const Center(
                            child: Text(
                              '정보수정',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _GetToDoneExamScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: const Center(
                            child: Text(
                              '완료된\n수행평가',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _GetToGradeCalculatorScreen,
                        child: SizedBox(
                          width: screenWidth / 390 * 70,
                          child: const Center(
                            child: Text(
                              '점수계산기',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 70),
            GestureDetector(
              onTap: () async {
                await Auth.signout();
                Get.to(() => const LoginScreen());
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}

void _GetToGradeCalculatorScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToDoneExamScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToEditInformationScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}
