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
import 'package:intl/intl.dart';
import 'main_screen.dart';

class RegisterExamScreen2 extends StatefulWidget {
  final String title, subject;
  final List<DateTime> dates;
  const RegisterExamScreen2(
      {Key? key,
      required this.title,
      required this.subject,
      required this.dates})
      : super(key: key);

  @override
  State<RegisterExamScreen2> createState() => _RegisterExamScreen2State();
}

class _RegisterExamScreen2State extends State<RegisterExamScreen2> {
  TextEditingController val1 = TextEditingController();
  bool subjectOpen = false;
  bool dateadding = false;
  late int changingratio;
  String memo = '';
  String range = '';
  int score = -1; // !초기 값 -1로 설정
  List<String> subjects = Get.find<Instance>().subjects;
  final DateTime _selectedDate = DateTime.now();
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
                  color: Color(0xFFEBEBEB),
                ),
              ),
              Container(
                width: screenWidth / 390 * 179,
                height: screenHeight / 844 * 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
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
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '반영 비율',
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
                            child: CustomTextField(
                              keyboardType: TextInputType.number,
                              controller: val1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: screenHeight / 844 * 15,
                                    top: screenHeight / 844 * 30,
                                  ),
                                  hintText: '비율 입력',
                                  hintStyle: AhtTextTheme.TextfieldHintText),
                              onSubmitted: (val) {
                                int? parsedValue = int.tryParse(val);
                                setState(() {
                                  if (parsedValue != null) {
                                    setState(() {
                                      score = parsedValue;
                                    });
                                  } else {
                                    Get.snackbar('알림', '수행평가 반영 비율을 입력해주세요');
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '수행 범위',
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
                            child: CustomTextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  bottom: screenHeight / 844 * 15,
                                  top: screenHeight / 844 * 30,
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
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '메모',
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
                            child: CustomTextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  bottom: screenHeight / 844 * 15,
                                  top: screenHeight / 844 * 30,
                                ),
                                hintText: '메모 입력',
                                hintStyle: AhtTextTheme.TextfieldHintText,
                              ),
                              onSubmitted: (changingrange) {
                                setState(() {
                                  memo = changingrange;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight / 844 * 20),
                          const CustomText(
                            text: '사진 또는 파일 추가',
                            style: AhtTextTheme.MiddleMenuText,
                          ),
                          SizedBox(height: screenHeight / 844 * 4),
                          GestureDetector(
                            onTap: () async {
                              Uint8List? img = await getImage();
                              if (img != null) {
                                setState(() {
                                  images.add(img);
                                });
                              }
                            },
                            child: Container(
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
                          ),
                          SizedBox(height: screenHeight / 844 * 10),
                          Container(
                            height: screenHeight / 844 * 120,
                            padding: EdgeInsets.all(screenHeight / 844 * 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  // TODO: 클릭했을 때 dialog로 이미지 띄우기
                                },
                                child: GestureDetector(
                                  onLongPressEnd: (detail) {
                                    setState(() {
                                      images.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    height: screenHeight / 844 * 88,
                                    width: screenHeight / 844 * 66,
                                    padding:
                                        EdgeInsets.all(screenHeight / 944 * 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      image: DecorationImage(
                                        image: MemoryImage(
                                          images[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  images.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth / 390 * 15,
                                                height: screenWidth / 390 * 15,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Colors.grey,
                                                  shape: CircleBorder(),
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  size: screenWidth / 390 * 8,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                width: screenHeight / 844 * 16,
                              ),
                              itemCount: images.length,
                            ),
                          ),
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
                  if (range.isEmpty || score == -1) {
                    print(range);
                    print(score);
                    Get.snackbar(
                      '오류',
                      '사진 추가를 제외한 모든 정보를 입력해주세요',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                  } else {
                    Exam? uplodadedExam = await Exam.set(
                      title: widget.title,
                      subject: widget.subject,
                      dates: widget.dates,
                      memo: memo,
                      range: range,
                      score: score,
                      bytes: images,
                    );
                    if (uplodadedExam != null) {
                      Get.to(() => const MainScreen());
                      Get.snackbar('알림', '정보가 저장되었습니다.');
                    }
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
                      text: '저장',
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
