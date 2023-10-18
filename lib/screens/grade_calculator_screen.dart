import 'package:aht_dimigo/screens/grade_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/text_theme.dart';
import '../themes/color_theme.dart';
import '../widgets/custom_text.dart';

List<Map<String, dynamic>> subjectList = [];
int? openIndex;

class GradeCalclulatorScreen extends StatefulWidget {
  const GradeCalclulatorScreen({super.key});

  @override
  State<GradeCalclulatorScreen> createState() => _GradeCalclulatorScreenState();
}

class _GradeCalclulatorScreenState extends State<GradeCalclulatorScreen> {
  bool adding = false;

  @override
  void initState() {
    super.initState();
    subjectList = [];
    openIndex = null;
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
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 844 * 48,
              left: screenWidth / 390 * 16,
              right: screenWidth / 390 * 16,
            ),
            child: SizedBox(
              height: screenHeight / 844 * 686,
              width: screenWidth / 390 * 358,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: '과목',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          CustomText(
                            text: '동석차수가 없을 경우 1을 입력해주세요',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.15),
                              fontSize: 11,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 8),
                      Column(
                        children: [
                          for (int i = 0; i < subjectList.length; i++)
                            SubjectCard(
                              index: i,
                              subject: subjectList[i],
                              update: () {
                                setState(() {});
                              },
                            )
                        ],
                      ),
                      if (adding)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight / 844 * 4,
                          ),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 17 / 390 * screenWidth),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CustomTextField(
                              maxLines: 1,
                              onSubmitted: (name) {
                                setState(() {
                                  openIndex = subjectList.length;
                                  subjectList.add({'name': name});
                                  adding = false;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: '과목명을 입력하세요',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: screenHeight / 844 * 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            adding = true;
                            openIndex = null;
                          });
                        },
                        child: Container(
                          height: screenHeight / 844 * 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //calculate
                          Get.off(
                            () => GradeResultScreen(
                              subjectList: subjectList,
                            ),
                            duration: Duration.zero,
                          );
                        },
                        child: Container(
                          height: 59 / 844 * screenHeight,
                          decoration: BoxDecoration(
                            color: AhtColors.Main_Color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: CustomText(
                              text: '계산하기',
                              style: AhtTextTheme.ButtonText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight / 844 * 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectCard extends StatefulWidget {
  const SubjectCard({
    Key? key,
    required this.index,
    required this.subject,
    required this.update,
  }) : super(key: key);

  final int index;
  final Map<String, dynamic> subject;
  final Function update;

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4 / 844 * screenHeight,
          ),
          child: GestureDetector(
            onTap: () {
              if (openIndex == widget.index) {
                openIndex = null;
              } else {
                openIndex = widget.index;
              }

              widget.update();
            },
            child: Container(
              height: 48 / 844 * screenHeight,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.only(
                left: 18 / 390 * screenWidth,
                right: 16 / 390 * screenWidth,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: widget.subject['name'],
                    style: (openIndex == widget.index)
                        ? AhtTextTheme.SubjectCardHighlight
                        : AhtTextTheme.SubjectCardDetail,
                  ),
                  Icon((openIndex == widget.index)
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
        ),
        if (openIndex == widget.index)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4 / 844 * screenHeight),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
              padding: EdgeInsets.only(
                left: 18 / 390 * screenWidth,
              ),
              child: CustomTextField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '석차 입력',
                  hintStyle: AhtTextTheme.SubjectCardDetail,
                ),
                onChanged: (value) {
                  int? val = int.tryParse(value);
                  if (val != null) {
                    widget.subject['rank'] = val;
                  }
                  widget.update();
                },
              ),
            ),
          ),
        if (openIndex == widget.index)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4 / 844 * screenHeight),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
              padding: EdgeInsets.only(
                left: 18 / 390 * screenWidth,
              ),
              child: CustomTextField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '동석차 입력',
                  hintStyle: AhtTextTheme.SubjectCardDetail,
                ),
                onChanged: (value) {
                  int? val = int.tryParse(value);
                  if (val != null) {
                    widget.subject['same_rank'] = val;
                  }
                  widget.update();
                },
              ),
            ),
          ),
        if (openIndex == widget.index)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4 / 844 * screenHeight),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
              padding: EdgeInsets.only(
                left: 18 / 390 * screenWidth,
              ),
              child: CustomTextField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '이수자 입력',
                  hintStyle: AhtTextTheme.SubjectCardDetail,
                ),
                onChanged: (value) {
                  int? val = int.tryParse(value);
                  if (val != null) {
                    widget.subject['total'] = val;
                  }
                  widget.update();
                },
              ),
            ),
          ),
        if (openIndex == widget.index)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4 / 844 * screenHeight),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
              padding: EdgeInsets.only(
                left: 18 / 390 * screenWidth,
              ),
              child: CustomTextField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '단위 입력',
                  hintStyle: AhtTextTheme.SubjectCardDetail,
                ),
                onChanged: (value) {
                  int? val = int.tryParse(value);
                  if (val != null) {
                    widget.subject['credit'] = val;
                  }
                  widget.update();
                },
              ),
            ),
          ),
      ],
    );
  }
}
