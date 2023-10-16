import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';

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
  double meanGrade = 0;

  @override
  void initState() {
    super.initState();
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
                text: '$meanGrade',
              ),
            ),
          ),
          SizedBox(
            height: 26 / 844 * screenHeight,
          ),
          CustomText(
            text: '$username님의 평균 등급은\n$meanGrade등급입니다.',
            style: AhtTextTheme.GradeResultMean,
            textAlign: TextAlign.center,
          ),
          const Expanded(
            child: SizedBox(),
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
