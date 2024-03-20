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
import 'package:aht_dimigo/static.dart';

class VersionScreen extends StatefulWidget {
  const VersionScreen({super.key});

  @override
  State<VersionScreen> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
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
                                color: Colors.black,
                                size: screenHeight / 844 * 20,
                              ),
                            ),
                            SizedBox(width: screenWidth / 390 * 12),
                            const CustomText(
                              text: '버전 정보',
                              style: TextStyle(
                                color: Colors.black,
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
                Container(
                  width: screenWidth / 390 * 358,
                  height: screenHeight / 844 * 2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 300),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'V. ${AhtStatic.AppVersion}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
