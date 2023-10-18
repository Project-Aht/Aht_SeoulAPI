import 'package:aht_dimigo/screens/grade_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';
import 'dart:core';

class GradeResultScreen extends StatefulWidget {
  const GradeResultScreen({
    Key? key,
    required this.subjectList,
  }) : super(key: key);

  final List<Map<String, dynamic>> subjectList;

  @override
  State<GradeResultScreen> createState() => _GradeResultScreenState();
}

class _GradeResultScreenState extends State<GradeResultScreen> {
  String username = '';
  Map<String, double> result = {};
  double meanGrade = 0;
  double meanGradeCut = 0; // 소수 첫재짜리 반올림

  @override
  void initState() {
    super.initState();
    _calculateGrade();
  }

  void _calculateGrade() {
    num credits = 0;
    for (int i = 0; i < widget.subjectList.length; i++) {
      Map sub = widget.subjectList[i];
      String name = sub['name'];
      double gradeby100 =
          (sub['rank'] + (sub['same_rank'] - 1)) / sub['total'] * 100;
      late double justrank;
      if (0 <= gradeby100 && gradeby100 <= 4) {
        justrank = 1;
      } else if (4 < gradeby100 && gradeby100 <= 11) {
        justrank = 2;
      } else if (11 < gradeby100 && gradeby100 <= 23) {
        justrank = 3;
      } else if (23 < gradeby100 && gradeby100 <= 40) {
        justrank = 4;
      } else if (40 < gradeby100 && gradeby100 <= 60) {
        justrank = 5;
      } else if (60 < gradeby100 && gradeby100 <= 77) {
        justrank = 6;
      } else if (77 < gradeby100 && gradeby100 <= 89) {
        justrank = 7;
      } else if (89 < gradeby100 && gradeby100 <= 96) {
        justrank = 8;
      } else {
        justrank = 9;
      }
      result[name] = justrank;
      credits += sub['credit'];
      meanGrade += justrank * sub['credit'];
      print(result[name]);
    }
    meanGrade /= credits;
    meanGradeCut = double.parse(meanGrade.toStringAsFixed(1));
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      const CustomText(
                        text: '등급계산기',
                        style: AhtTextTheme.TopMenuBar,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 76 / 844 * screenHeight,
          ),
          Container(
            width: 105 / 844 * screenHeight,
            height: 105 / 844 * screenHeight,
            decoration: const ShapeDecoration(
              color: Color(0x2638498E),
              shape: OvalBorder(),
            ),
            child: Center(
              child: CustomText(
                text: '$meanGradeCut',
              ),
            ),
          ),
          SizedBox(
            height: 26 / 844 * screenHeight,
          ),
          CustomText(
            text: '$username님의 평균 등급은\n$meanGradeCut등급입니다.',
            style: AhtTextTheme.GradeResultMean,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 390 * 16,
              ),
              child: ListView.separated(
                itemCount: subjectList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => CustomText(
                  text: '${subjectList[index]}',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: screenHeight / 844 * 24,
              left: screenWidth / 390 * 16,
              right: screenWidth / 390 * 16,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 59 / 844 * screenHeight,
                decoration: BoxDecoration(
                  color: AhtColors.Main_Color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: CustomText(
                    text: '완료',
                    style: AhtTextTheme.ButtonText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
