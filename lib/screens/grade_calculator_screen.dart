import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/themes/text_theme.dart';

class GradeCalclulatorScreen extends StatefulWidget {
  const GradeCalclulatorScreen({super.key});

  @override
  State<GradeCalclulatorScreen> createState() => _GradeCalclulatorScreenState();
}

class _GradeCalclulatorScreenState extends State<GradeCalclulatorScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 844 * 122,
              decoration: const BoxDecoration(
                color: AhtColors.Main_Color,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 844 * 70),
                  SizedBox(
                    height: screenHeight / 844 * 28,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: screenWidth / 390 * 16),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: screenWidth / 390 * 108),
                        const Text(
                          '등급계산기',
                          style: AhtTextTheme.TopMenuBar,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 48),
            Row(
              children: [
                SizedBox(width: screenWidth / 390 * 16),
                const Text(
                  '과목',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight / 844 * 48,
                bottom: screenHeight / 844 * 24,
                left: screenWidth / 390 * 16,
                right: screenWidth / 390 * 16,
              ),
              child: const Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
