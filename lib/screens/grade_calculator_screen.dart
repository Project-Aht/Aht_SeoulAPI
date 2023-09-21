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
              height: screenHeight / 844 * 132,
              decoration: const BoxDecoration(
                color: AhtColors.Main_Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
