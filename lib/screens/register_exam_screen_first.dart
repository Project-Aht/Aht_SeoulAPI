import 'dart:typed_data';
import 'package:aht_dimigo/functions/get_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../firebase/exam.dart';
import '../firebase/instance.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'register_exam_screen_second.dart';
import 'package:intl/intl.dart';

class RegisterExamScreen extends StatefulWidget {
  const RegisterExamScreen({super.key});

  @override
  State<RegisterExamScreen> createState() => _RegisterExamScreenState();
}

class _RegisterExamScreenState extends State<RegisterExamScreen> {
  TextEditingController val1 = TextEditingController();
  bool subjectOpen = false;
  bool dateadding = false;
  late int changingratio;
  String title = '';
  String subject = '';
  List<DateTime> dates = [];
  String memo = '';
  String range = '';
  int grade = 3;
  int score = -1; // !초기 값 -1로 설정
  List<String> subjects = Get.find<Instance>().subjects;
  DateTime _selectedDate = DateTime.now();
  List<Uint8List> images = [];

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
            height: screenHeight / 844 * 124,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight / 844 * 73),
                SizedBox(
                  height: screenHeight / 844 * 40,
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
                              color: Colors.black,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth / 390 * 179,
                height: screenHeight / 844 * 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Container(
                width: screenWidth / 390 * 179,
                height: screenHeight / 844 * 2,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBEBEB),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
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
                    height: screenHeight / 844 * 600,
                    width: screenWidth / 390 * 358,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: '이름 추가',
                            style: AhtTextTheme.MiddleMenuText,
                          ),
                          SizedBox(height: screenHeight / 844 * 4),
                          Container(
                            height: screenHeight / 844 * 48,
                            padding: EdgeInsets.only(
                              left: 16 / 390 * screenWidth,
                              right: screenWidth / 390 * 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                              height: screenHeight / 844 * 48,
                              child: CustomTextField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: screenHeight / 844 * 15,
                                    top: screenHeight / 844 * 30,
                                  ),
                                  hintText: '수행평가 이름',
                                  hintStyle: AhtTextTheme.TextfieldHintText,
                                ),
                                onChanged: (changingtitle) {
                                  setState(() {
                                    title = changingtitle;
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
                                if (subjectOpen) {
                                  subjectOpen = false;
                                } else {
                                  subjectOpen = true;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: screenWidth / 390 * 16),
                                      (subject.isEmpty)
                                          ? CustomText(
                                              text: '과목 선택',
                                              style: AhtTextTheme
                                                  .TextfieldHintText,
                                            )
                                          : CustomText(
                                              text: subject,
                                              style: AhtTextTheme
                                                  .SubjectCardHighlight,
                                            ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      subjectOpen
                                          ? Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: const Color(0xFF1C1B1F),
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
                          SizedBox(height: screenHeight / 844 * 6),
                          subjectOpen
                              ? ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: subjects.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          subject = subjects[index];
                                          subjectOpen = false;
                                        });
                                      },
                                      child: Container(
                                        height: screenHeight / 844 * 44,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F4F4),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        screenWidth / 390 * 16),
                                                CustomText(
                                                  text: subjects[index],
                                                  style: AhtTextTheme
                                                      .MiddleMenuText,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (dateadding) {
                                  dateadding = false;
                                  dates.add(_selectedDate);
                                } else {
                                  dateadding = true;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: screenWidth / 390 * 16),
                                      (dates.isEmpty)
                                          ? CustomText(
                                              text: '날짜 설정',
                                              style: AhtTextTheme
                                                  .TextfieldHintText,
                                            )
                                          : Row(
                                              children: [
                                                CustomText(
                                                  text: DateFormat(
                                                          'yyyy년 MM월 dd일',
                                                          'ko_KR')
                                                      .format(dates.first)
                                                      .toString(),
                                                  style: AhtTextTheme
                                                      .SubjectCardHighlight,
                                                ),
                                                const CustomText(text: ' '),
                                                CustomText(
                                                  text: (dates.length > 1)
                                                      ? '외 ${dates.length - 1}개'
                                                      : '',
                                                  style: AhtTextTheme
                                                      .SubjectCardHighlight,
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      dateadding
                                          ? Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: const Color(0xFF1C1B1F),
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
                          dateadding
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: screenHeight / 844 * 190,
                                      child: ScrollDatePicker(
                                        minimumDate: DateTime(2023, 1, 1, 0, 0),
                                        maximumDate: DateTime(3000, 1, 1, 0, 0),
                                        selectedDate: _selectedDate,
                                        locale: const Locale('en'),
                                        options: const DatePickerOptions(
                                          itemExtent: 30,
                                          perspective: 0.01,
                                          backgroundColor: Colors.white,
                                        ),
                                        onDateTimeChanged: (DateTime value) {
                                          setState(() {
                                            _selectedDate = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(width: 0, height: 0),
                          SizedBox(height: screenHeight / 844 * 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight / 844 * 15,
              ),
              GestureDetector(
                onTap: () async {
                  if (title.isEmpty || subject.isEmpty || dates.isEmpty) {
                    Get.snackbar(
                      '오류',
                      '모든 정보를 입력해주세요',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                  } else {
                    Get.to(
                      () => RegisterExamScreen2(
                        title: title,
                        subject: subject,
                        dates: dates,
                      ),
                      duration: Duration.zero,
                    );
                  }
                },
                child: Container(
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
              ),
              SizedBox(
                height: screenHeight / 844 * 23,
              ),
            ],
          )
        ],
      ),
    );
  }
}
