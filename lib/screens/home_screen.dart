import 'package:aht_dimigo/screens/register_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import '../firebase/exam.dart';
import '../firebase/instance.dart';
import '../widgets/custom_text.dart';
import 'package:aht_dimigo/widgets/subject_selection_box.dart';
import 'package:aht_dimigo/widgets/main_exam_box.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> _userInfo = Get.find<Instance>().userInfo ?? {};
  List<Exam> exams = Get.find<Instance>().exams;
  List<String> subjectList = [];
  String? selected;
  List<Exam> results = [];

  Future<void> searchExam(String? subject) async {
    if (subject != null) {
      results = [];
      for (Exam exam in exams) {
        if (exam.subject == subject) results.add(exam);
      }
    } else {
      results = List.from(exams);
    }
    results.sort(
      (a, b) => a.dates.last.compareTo(b.dates.last),
    );
    setState(() {});
  }

  Future<void> getSubjects() async {
    subjectList = await Exam.getSubjects();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _userInfo = Get.find<Instance>().userInfo ?? {};
    exams = Get.find<Instance>().exams;
    getSubjects();
    searchExam(selected);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: AhtColors.Main_Color,
        elevation: 7,
        child: GestureDetector(
          onTap: () async {
            Get.to(() => const RegisterExamScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 844 * 132,
              decoration: const BoxDecoration(
                color: AhtColors.Main_Color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(39),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 844 * 58),
                  SizedBox(
                    height: screenHeight / 844 * 40,
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: screenWidth / 390 * 16),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: MemoryImage(
                                      _userInfo['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: const OvalBorder(),
                                ),
                              ),
                              SizedBox(width: screenWidth / 390 * 14),
                              CustomText(
                                text:
                                    '${_userInfo['school']['name']} \n${_userInfo['school']['grade']}학년 ${_userInfo['school']['class']}반',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1.4,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            SizedBox(width: screenWidth / 390 * 28),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 16),
            Row(
              children: [
                SizedBox(width: screenWidth / 390 * 32),
                SizedBox(
                  height: screenHeight / 844 * 31,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 390 * 259,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: subjectList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                if (selected == subjectList[index]) {
                                  selected = null;
                                } else {
                                  selected = subjectList[index];
                                }
                                setState(() {});
                                await searchExam(selected);
                                setState(() {});
                              },
                              child: SubjectSelectionBox(
                                subjectList[index],
                                selected: selected == subjectList[index],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: screenWidth / 390 * 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth / 390 * 10),
                Container(
                  width: screenWidth / 390 * 57,
                  height: screenHeight / 844 * 31,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w100,
                        height: 1.25,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth / 390 * 32),
              ],
            ),
            SizedBox(height: screenHeight / 844 * 16),
            Container(
              width: screenWidth,
              height: screenHeight / 844 * 57,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
              ),
            ),
            SizedBox(height: screenHeight / 844 * 20),
            Row(
              children: [
                SizedBox(width: screenWidth / 390 * 16),
                const CustomText(
                  text: '수행평가 목록',
                  style: TextStyle(
                    color: AhtColors.Main_Color,
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight / 844 * 18),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth / 390 * 16),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MainExamBox(results[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: screenHeight / 844 * 56,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
