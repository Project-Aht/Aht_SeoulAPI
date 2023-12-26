import 'dart:typed_data';

import 'package:aht_dimigo/firebase/exam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import '../../firebase/instance.dart';
import '../../widgets/custom_text.dart';
import '../main_screen.dart';

class SignUpScreenResult extends StatefulWidget {
  final Uint8List? image;
  final String school;
  final int schoolGrade, schoolClass;
  const SignUpScreenResult({
    Key? key,
    this.image,
    required this.school,
    required this.schoolGrade,
    required this.schoolClass,
  }) : super(key: key);

  @override
  State<SignUpScreenResult> createState() => _SignUpScreenResultState();
}

class _SignUpScreenResultState extends State<SignUpScreenResult> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth / 390 * 32,
          right: screenWidth / 390 * 32,
          bottom: screenHeight / 844 * 43,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight / 844 * 128,
                ),
                const CustomText(
                  text: '회원가입 완료!',
                  style: AhtTextTheme.SignUpHeadline,
                ),
                SizedBox(
                  height: screenHeight / 844 * 85,
                ),
                Container(
                  width: screenWidth / 390 * 103,
                  height: screenWidth / 390 * 103,
                  decoration: ShapeDecoration(
                    shape: const OvalBorder(),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (widget.image == null)
                          ? Image.asset(
                              'assets/images/default_profile.png',
                            ).image
                          : Image.memory(widget.image!).image,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 844 * 33,
                ),
                CustomText(
                  text: widget.school,
                  style: AhtTextTheme.SignUpResult,
                ),
                SizedBox(
                  height: screenHeight / 844 * 7,
                ),
                CustomText(
                  text: '${widget.schoolGrade}학년 ${widget.schoolClass}반',
                  style: AhtTextTheme.SignUpResult,
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await Get.find<Instance>().getUserInfo();
                await initExam();
                Get.find<Instance>().getExams();
                Get.offAll(() => const MainScreen());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: screenHeight / 844 * 52,
                    decoration: BoxDecoration(
                      color: AhtColors.Main_Color,
                      borderRadius:
                          BorderRadius.circular(screenHeight / 844 * 10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '완료',
                        style: AhtTextTheme.ButtonText.copyWith(fontSize: 16),
                      ),
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
