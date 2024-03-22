import 'dart:typed_data';
import 'package:aht_dimigo/screens/signup/signup_screen_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase/auth.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text.dart';

class SignUpScreenGrade extends StatefulWidget {
  final String email, pw, school;
  final int maxGrade;
  final Uint8List? image;
  const SignUpScreenGrade({
    Key? key,
    required this.email,
    required this.pw,
    required this.school,
    required this.image,
    required this.maxGrade,
  }) : super(key: key);

  @override
  State<SignUpScreenGrade> createState() => _SignUpScreenGradeState();
}

class _SignUpScreenGradeState extends State<SignUpScreenGrade> {
  int? schoolGrade;
  int? schoolClass;
  bool updateTrigger = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          updateTrigger = !updateTrigger;
        });
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: screenWidth / 390 * 32,
            right: screenWidth / 390 * 32,
            bottom: screenHeight / 844 * 43,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight / 844 * 72,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth / 390 * 32,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 844 * 22,
                    ),
                    const CustomText(
                      text: '반, 번호 설정',
                      style: AhtTextTheme.SignUpHeadline,
                    ),
                    SizedBox(
                      height: screenHeight / 844 * 8,
                    ),
                    const CustomText(
                      text: '사용자님의 반, 번호를\n설정해주세요.',
                      style: AhtTextTheme.SignUpText,
                    ),
                    SizedBox(
                      height: screenHeight / 844 * 42,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: '학년',
                                style: AhtTextTheme.SignUpGradeTitle,
                              ),
                              SizedBox(
                                height: screenHeight / 844 * 8,
                              ),
                              CustomDropdown(
                                trigger: updateTrigger,
                                values: [
                                  for (int i = 1; i <= widget.maxGrade; i++) i
                                ],
                                update: (value) {
                                  setState(() {
                                    schoolGrade = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 390 * 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: '반',
                                style: AhtTextTheme.SignUpGradeTitle,
                              ),
                              SizedBox(
                                height: screenHeight / 844 * 8,
                              ),
                              CustomDropdown(
                                trigger: updateTrigger,
                                values: [for (int i = 1; i <= 15; i++) i],
                                update: (value) {
                                  setState(() {
                                    schoolClass = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight / 844 * 70,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (schoolGrade != null && schoolClass != null) {
                    bool signupCompleted = await Auth.signup(
                      email: widget.email,
                      pw: widget.pw,
                      schoolName: widget.school,
                      schoolGrade: schoolGrade!,
                      schoolClass: schoolClass!,
                    );
                    if (signupCompleted) {
                      Get.offAll(
                        () => SignUpScreenResult(
                          school: widget.school,
                          schoolGrade: schoolGrade!,
                          schoolClass: schoolClass!,
                        ),
                      );
                    } else {
                      Get.snackbar(
                        '알림',
                        '회원가입에 실패했습니다.',
                      );
                    }
                  } else {}
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
                          text: '회원가입',
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
      ),
    );
  }
}
