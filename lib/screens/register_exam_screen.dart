import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class RegisterExamScreen extends StatefulWidget {
  const RegisterExamScreen({super.key});

  @override
  State<RegisterExamScreen> createState() => _RegisterExamScreenState();
}

class _RegisterExamScreenState extends State<RegisterExamScreen> {
  TextEditingController val1 = TextEditingController();
  bool subjectadding = false;
  bool dateadding = false;
  late int changingratio;
  String title = '';
  String subject = '';
  List<DateTime> dates = [];
  String memo = '';
  String range = '';
  List<String> admin = ['aaaskdjf;l@gmail.com'];
  late int ratio;
  int grade = 3;
  List<String> subjects = ['수학', '국어', '영어', '전지훈바보'];
  DateTime _selectedDate = DateTime.now();

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
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight / 844 * 20,
                left: screenWidth / 390 * 16,
                right: screenWidth / 390 * 16,
              ),
              child: SingleChildScrollView(
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
                                  hintText: '수행평가 이름',
                                  hintStyle: AhtTextTheme.TextfieldHintText,
                                ),
                                onSubmitted: (changingtitle) {
                                  setState(() {
                                    title = changingtitle;
                                    print(title);
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
                              print(subject);
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
                                      subjectadding
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
                          subjectadding
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
                                          : CustomText(
                                              text: '${dates.first}',
                                              style: AhtTextTheme
                                                  .SubjectCardHighlight,
                                            )
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
                          const CustomText(
                            text: '사진 또는 파일 추가',
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
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_center_focus,
                                  color: const Color(0xFFD9D9D9),
                                  size: screenWidth / 390 * 24,
                                ),
                                SizedBox(width: screenWidth / 390 * 8),
                                Text('사진 추가',
                                    style: AhtTextTheme.TextfieldHintText),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight / 844 * 10),
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
                            child: Row(
                              children: [
                                Transform.rotate(
                                  angle: 3.14 / 3.5,
                                  child: Icon(
                                    Icons.attach_file,
                                    color: const Color(0xFFD9D9D9),
                                    size: screenWidth / 390 * 24,
                                  ),
                                ),
                                SizedBox(width: screenWidth / 390 * 8),
                                Text('사진 추가',
                                    style: AhtTextTheme.TextfieldHintText),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '반영 비율',
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
                                keyboardType: TextInputType.number,
                                controller: val1,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      bottom: screenHeight / 844 * 14,
                                      top: screenHeight / 844 * 14,
                                    ),
                                    hintText: '비율 입력',
                                    hintStyle: AhtTextTheme.TextfieldHintText),
                                onSubmitted: (val) {
                                  int? parsedValue = int.tryParse(val);
                                  setState(() {
                                    if (parsedValue != null) {
                                      setState(() {
                                        ratio = parsedValue;
                                      });
                                    } else {
                                      Get.snackbar('알림', '수행평가 반영 비율을 입력해주세요');
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '수행 범위',
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
                                  hintText: '범위 입력',
                                  hintStyle: AhtTextTheme.TextfieldHintText,
                                ),
                                onSubmitted: (changingrange) {
                                  setState(() {
                                    range = changingrange;
                                  });
                                },
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
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  //Exam.set(
                  //title: title,
                  //subject: subject,
                  //dates: dates,
                  //memo: memo,
                  //range: range,
                  //ladmin: admin,
                  //grade: grade,
                  //);
                  Get.back();
                  Get.snackbar('알림', '정보가 저장되었습니다.');
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
                height: screenHeight / 844 * 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
