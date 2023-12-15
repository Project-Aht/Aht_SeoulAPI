import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../firebase/auth.dart';
import '../themes/color_theme.dart';
import '../themes/text_theme.dart';
import '../widgets/custom_text.dart';
import 'main_screen.dart';

class SignUpScreenSchool extends StatefulWidget {
  final String email, pw;
  final Uint8List? image;
  const SignUpScreenSchool({
    Key? key,
    required this.email,
    required this.pw,
    required this.image,
  }) : super(key: key);

  @override
  State<SignUpScreenSchool> createState() => _SignUpScreenSchoolState();
}

class _SignUpScreenSchoolState extends State<SignUpScreenSchool> {
  String schoolName = '';
  int? schoolGrade, schoolClass;
  FocusNode focus = FocusNode();

  List names = [];
  List<String> school_names = [];
  Future<void> _callAPI() async {
    for (int index = 1; index <= 13; index++) {
      var url = Uri.parse(
        'https://open.neis.go.kr/hub/schoolInfo?KEY=cd3d82c9b70b4de3a1591e48d6507ea2&Type=json&pSize=1000&pIndex=$index',
      );
      var response = await http.get(url);
      List arr = jsonDecode(response.body)['schoolInfo'][1]['row'];
      for (var schoolData in arr) {
        String schoolName = schoolData['SCHUL_NM'];
        names.add(schoolName);
        school_names.add(schoolName);
      }
    }
    names = names.toSet().toList();
    names.sort();
    print('lengths :');
    print(names.length);
  }

  List<String> filteredSchoolNames = [];

  void updateFilteredSchools(String input) {
    setState(() {
      filteredSchoolNames = school_names
          .where((schoolName) =>
              schoolName.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
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
                      size: screenWidth / 390 * 21,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 22,
                  ),
                  const CustomText(
                    text: '학교 설정',
                    style: AhtTextTheme.SignUpHeadline,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 16,
                  ),
                  const CustomText(
                    text: '사용자님이 재학중인 학교를\n선택해주세요.',
                    style: AhtTextTheme.SignUpText,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 49,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.school_outlined,
                        size: 18,
                        color: Color(0xFFCCCCCC),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 12,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 14,
                          child: CustomTextField(
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            onChanged: (p0) async {
                              schoolName = p0;
                              setState(() {});
                            },
                            focusNode: focus,
                            style: AhtTextTheme.LoginText,
                            decoration: const InputDecoration(
                              hintText: '학교명을 입력해주세요',
                              hintStyle: AhtTextTheme.LoginHintText,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 10.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 14,
                  ),
                  Container(
                    height: screenHeight / 844 * 2,
                    color: const Color(0xFFD7D7D7),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: screenWidth / 390 * 20,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF7D7D7D),
                                ),
                              ),
                            ),
                            child: CustomTextField(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              onChanged: (p0) {
                                setState(() {
                                  schoolGrade = int.tryParse(p0);
                                });
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            ),
                          ),
                          const CustomText(text: '학년'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenWidth / 390 * 20,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF7D7D7D),
                                ),
                              ),
                            ),
                            child: CustomTextField(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              textInputAction: TextInputAction.done,
                              onChanged: (p0) {
                                setState(() {
                                  schoolClass = int.tryParse(p0);
                                });
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            ),
                          ),
                          const CustomText(text: '반'),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight / 844 * 14,
                      ),
                      Container(
                        height: screenHeight / 844 * 2,
                        color: const Color(0xFFD7D7D7),
                      ),
                      SizedBox(
                        height: screenHeight / 844 * 19,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!focus.hasFocus)
              GestureDetector(
                onTap: () async {
                  if (schoolName.isEmpty ||
                      schoolGrade == null ||
                      schoolClass == null) {
                    Get.snackbar(
                      '',
                      '학교 정보를 입력해주세요.',
                    );
                  } else {
                    bool signupCompleted = await Auth.signup(
                      email: widget.email,
                      pw: widget.pw,
                      schoolName: schoolName,
                      schoolGrade: schoolGrade!,
                      schoolClass: schoolClass!,
                    );
                    if (signupCompleted) {
                      Get.offAll(() => const MainScreen());
                    } else {
                      Get.snackbar(
                        '',
                        '회원가입에 실패했습니다.',
                      );
                    }
                  }
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
                          text: '다음',
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
