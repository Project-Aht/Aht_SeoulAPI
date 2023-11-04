import 'package:aht_dimigo/screens/myinfo_screen.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';

import '../firebase/auth.dart';
import '../firebase/instance.dart';
import '../themes/color_theme.dart';
import 'grade_calculator_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Map<String, dynamic> _userInfo = Get.find<Instance>().userInfo ?? {};
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '메뉴',
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
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight / 844 * 26,
                    right: screenWidth / 390 * 16,
                    left: screenWidth / 390 * 16,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const MyinfoScreen());
                        },
                        child: Container(
                          height: screenHeight / 844 * 54,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth / 390 * 10),
                              Icon(
                                Icons.account_circle,
                                size: screenHeight / 844 * 30,
                              ),
                              SizedBox(width: screenWidth / 390 * 10),
                              const CustomText(
                                text: '내 정보',
                                style: AhtTextTheme.MiddleMenuText,
                              )
                            ],
                          ),
                        ),
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

void _GetToGradeCalculatorScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToDoneExamScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToEditInformationScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}
