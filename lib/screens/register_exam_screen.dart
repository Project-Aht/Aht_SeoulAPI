import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';

class RegisterExamScreen extends StatefulWidget {
  const RegisterExamScreen({super.key});

  @override
  State<RegisterExamScreen> createState() => _RegisterExamScreenState();
}

class _RegisterExamScreenState extends State<RegisterExamScreen> {
  bool subjectadding = false;
  bool dateadding = false;
  String title = '';
  String subject = '';
  late List<DateTime> dates;
  String memo = '';
  String range = '';
  late List<String> admin;
  late int grade;
  List<String> subjects = ['수학', '국어', '영어', '전지훈바보'];

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
        children: [
          Container(
            width: screenWidth,
            height: screenHeight / 844 * 110,
            decoration: const BoxDecoration(
              color: AhtColors.Main_Color,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight / 844 * 61),
                SizedBox(
                  height: screenHeight / 844 * 28,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: '수행평가 추가하기',
                            style: AhtTextTheme.TopMenuBar,
                          ),
                          SizedBox(width: screenWidth / 390 * 123),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight / 844 * 20,
                left: screenWidth / 390 * 16,
                right: screenWidth / 390 * 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight / 844 * 637,
                    width: screenWidth / 390 * 358,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: '이름 추가',
                          style: AhtTextTheme.MiddleMenuText,
                        ),
                        SizedBox(height: screenHeight / 844 * 4),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight / 844 * 4,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 16 / 390 * screenWidth,
                              right: screenWidth / 390 * 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CustomTextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: screenHeight / 844 * 14,
                                    top: screenHeight / 844 * 14,
                                  ),
                                  hintText: '수행평가 이름'),
                              onSubmitted: (changingtitle) {
                                setState(() {
                                  title = changingtitle;
                                  subjectadding = false;
                                  dateadding = false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight / 844 * 24),
                        const CustomText(
                          text: '과목 선택',
                          style: AhtTextTheme.MiddleMenuText,
                        ),
                        SizedBox(height: screenHeight / 844 * 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (subjectadding) {
                                subjectadding = false;
                              } else {
                                subjectadding = true;
                              }
                            });
                          },
                          child: Container(
                            height: screenHeight / 844 * 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: screenWidth / 390 * 16),
                                    CustomText(
                                      text: '과목 선택',
                                      style: AhtTextTheme.TextfieldHintText,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    subjectadding
                                        ? Transform.rotate(
                                            angle: 3.14 / 2,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: const Color(0xFFD9D9D9),
                                              size: screenWidth / 390 * 18,
                                            ),
                                          )
                                        : Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: const Color(0xFFD9D9D9),
                                            size: screenWidth / 390 * 18,
                                          ),
                                    SizedBox(width: screenWidth / 390 * 16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        subjectadding
                            ? ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: subjects.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SubjectCard(subjects[index]);
                                },
                                separatorBuilder: (BuildContext context,
                                        int index) =>
                                    SizedBox(height: screenHeight / 844 * 6),
                              )
                            : const SizedBox(width: 0, height: 0),
                        SizedBox(height: screenHeight / 844 * 20),
                        const CustomText(
                          text: '수행 날짜',
                          style: AhtTextTheme.MiddleMenuText,
                        ),
                        SizedBox(height: screenHeight / 844 * 4),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth / 390 * 358,
                        height: screenHeight / 844 * 59,
                        decoration: ShapeDecoration(
                          color: AhtColors.Main_Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Center(
                          child: CustomText(
                            text: '다음',
                            style: AhtTextTheme.ButtonText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 844 * 18,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subjectName;
  const SubjectCard(this.subjectName, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight / 844 * 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: screenWidth / 390 * 16),
              CustomText(
                text: subjectName,
                style: AhtTextTheme.MiddleMenuText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
