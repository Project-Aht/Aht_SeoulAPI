import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:aht_dimigo/screens/register_exam_screen.dart';
import 'package:aht_dimigo/screens/grade_calculator_screen.dart';
import '../widgets/custom_text.dart';
import 'myinfo_screen.dart';
import 'package:aht_dimigo/widgets/subject_selection_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Set<String> subjectSet = {'수학', '과학', '국어', '영어', '프밍'};
    List<String> subjectList = subjectSet.toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: AhtColors.Main_Color,
        elevation: 7,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
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
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(),
                                ),
                              ),
                              SizedBox(width: screenWidth / 390 * 14),
                              const CustomText(
                                text: '한국디지털미디어고 \n1학년 2반 22번',
                                style: TextStyle(
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
                            return SubjectSelectionBox(subjectList[index]);
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
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ResgisterExamScreen());
              },
              child: const CustomText(text: '정보 추가하기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const GradeCalclulatorScreen());
              },
              child: const CustomText(text: '성적 계산기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const MyinfoScreen());
              },
              child: const CustomText(text: '내 정보'),
            ),
          ],
        ),
      ),
    );
  }
}
