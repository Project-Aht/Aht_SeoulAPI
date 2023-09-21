import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';

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
                  SizedBox(height: screenHeight / 844 * 74),
                  SizedBox(
                    height: screenHeight / 844 * 28,
                    child: Row(
                      children: [
                        SizedBox(width: screenWidth / 390 * 16),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.white,
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
      ),
    );
  }
}
