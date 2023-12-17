import 'dart:convert';
import 'dart:typed_data';
import 'package:aht_dimigo/screens/signup_screen_grade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../themes/color_theme.dart';
import '../themes/text_theme.dart';
import '../widgets/custom_text.dart';

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
  int? maxGrade;
  List<Map<String, String>> results = [];
  List<Map<String, String>> schools = [];
  FocusNode focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool selected = false;

  Future<void> callAPI() async {
    for (int index = 1; index <= 13; index++) {
      var url = Uri.parse(
        'https://open.neis.go.kr/hub/schoolInfo?KEY=cd3d82c9b70b4de3a1591e48d6507ea2&Type=json&pSize=1000&pIndex=$index',
      );
      var response = await http.get(url);
      List arr = jsonDecode(response.body)['schoolInfo'][1]['row'];

      for (var schoolData in arr) {
        String name = schoolData['SCHUL_NM'];
        String address = schoolData['ORG_RDNMA'] ?? '';
        int maxGrade = (schoolData['SCHUL_KND_SC_NM'] == '초등학교') ? 6 : 3;
        schools.add({
          'name': name,
          'address': address,
          'maxGrade': '$maxGrade',
        });
      }
    }
    setState(() {});
  }

  void updateResults(String input) {
    setState(() {
      results = schools
          .where((school) =>
              school['name']!.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    callAPI();
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
                    height: screenHeight / 844 * 35,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: CustomTextField(
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            onChanged: (p0) async {
                              schoolName = p0;
                              selected = false;
                              if (schoolName.isEmpty) {
                                results = [];
                                setState(() {});
                              } else {
                                updateResults(schoolName);
                              }
                            },
                            controller: _controller,
                            focusNode: focus,
                            style: AhtTextTheme.SignUpSchoolSearch,
                            decoration: const InputDecoration(
                              hintText: '학교를 검색해주세요',
                              hintStyle: AhtTextTheme.LoginHintText,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 390 * 11,
                        ),
                        child: GestureDetector(
                          child: Icon(
                            Icons.search,
                            size: 18,
                            color: (selected)
                                ? Colors.black
                                : const Color(0xFFCCCCCC),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: screenHeight / 844 * 2,
                    color: (selected) ? Colors.black : const Color(0xFFD7D7D7),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 19,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 400,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 390 * 8,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              schoolName = results[index]['name']!;
                              _controller.text = schoolName;
                              maxGrade = int.parse(results[index]['maxGrade']!);
                              results = [results[index]];
                              focus.unfocus();
                              selected = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: results[index]['name']!,
                                    style: AhtTextTheme.SignUpSchool,
                                  ),
                                  CustomText(
                                    text: results[index]['address']!,
                                    style: AhtTextTheme.SignUpSchoolAddress,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.outlined_flag_rounded,
                                color: Color(0xFF8B8C8B),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: screenHeight / 844 * 3,
                      ),
                      itemCount: results.length,
                    ),
                  ),
                ],
              ),
            ),
            if (!focus.hasFocus)
              GestureDetector(
                onTap: () async {
                  if (selected) {
                    Get.to(
                      () => SignUpScreenGrade(
                        email: widget.email,
                        pw: widget.pw,
                        school: schoolName,
                        image: widget.image,
                        maxGrade: maxGrade!,
                      ),
                      duration: Duration.zero,
                    );
                  } else {
                    Get.snackbar(
                      '',
                      '학교를 선택해주세요.',
                    );
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
