import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:aht_dimigo/screens/register_exam_screen.dart';
import 'package:aht_dimigo/screens/grade_calculator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight / 844 * 132,
                decoration: const BoxDecoration(
                  color: AhtColors.Main_Color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(39),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight / 844 * 58),
                    SizedBox(
                      height: screenHeight / 844 * 40,
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: screenWidth / 390 * 16),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(),
                                  ),
                                ),
                                SizedBox(width: screenWidth / 390 * 14),
                                const Text(
                                  '한국디지털미디어고 \n1학년 2반 22번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              SizedBox(width: screenWidth / 390 * 28),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
