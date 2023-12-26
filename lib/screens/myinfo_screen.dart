import 'dart:typed_data';
import 'package:aht_dimigo/firebase/image.dart';
import 'package:aht_dimigo/functions/get_image.dart';

import '../firebase/auth.dart';
import '../firebase/instance.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';
import 'grade_calculator_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyinfoScreen extends StatefulWidget {
  const MyinfoScreen({super.key});

  @override
  State<MyinfoScreen> createState() => _MyinfoScreenState();
}

class _MyinfoScreenState extends State<MyinfoScreen> {
  Map<String, dynamic> _userInfo = Get.find<Instance>().userInfo;
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
                            const CustomText(
                              text: '마이페이지',
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
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: MemoryImage(
                            _userInfo['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                        shadows: const [
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
                      child: GestureDetector(
                        onTap: () async {
                          Uint8List? image = await getImage();
                          if (image != null) {
                            setState(() {
                              loading = true;
                            });
                            await Storage.uploadProfile(image);
                            setState(() {
                              _userInfo = Get.find<Instance>().userInfo;
                              loading = false;
                            });
                          }
                        },
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
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 844 * 26),
                SizedBox(
                  // width: screenWidth / 390 * 142,
                  // height: screenHeight / 844 * 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text:
                            '${_userInfo['school']['name']}\n${_userInfo['school']['grade']}학년 ${_userInfo['school']['class']}반',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 10),
                const CustomText(
                  text: '포인트 13p',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: _getToEditInformationScreen,
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
                            onTap: _getToDoneExamScreen,
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
                            onTap: _getToGradeCalculatorScreen,
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
                            onTap: _getToEditInformationScreen,
                            child: SizedBox(
                              width: screenWidth / 390 * 70,
                              child: const Center(
                                child: CustomText(
                                  text: '정보수정',
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
                            onTap: _getToDoneExamScreen,
                            child: SizedBox(
                              width: screenWidth / 390 * 70,
                              child: const Center(
                                child: CustomText(
                                  text: '완료된\n수행평가',
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
                            onTap: _getToGradeCalculatorScreen,
                            child: SizedBox(
                              width: screenWidth / 390 * 70,
                              child: const Center(
                                child: CustomText(
                                  text: '점수계산기',
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
                  child: const CustomText(text: '로그아웃'),
                ),
              ],
            ),
          ),
          if (loading)
            GestureDetector(
              onTap: () {},
              onHorizontalDragStart: (details) {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void _getToGradeCalculatorScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _getToDoneExamScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _getToEditInformationScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}
