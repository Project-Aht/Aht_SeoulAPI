import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../firebase/exam.dart';
import 'custom_text.dart';

class MainExamBox extends StatelessWidget {
  final Exam exam;
  MainExamBox(this.exam, {super.key});

  final Map<String, IconData> icons = {
    '수학': Icons.calculate_outlined,
  };

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: screenwidth / 390 * 3),
            const CustomText(
              text: '마감까지 ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            CustomText(
              text: 'D-${exam.dates.last.difference(now).inDays} ',
              style: const TextStyle(
                color: Color(0xFFDE3123),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            CustomText(
              text: '| ${DateFormat("yyyy.MM.dd").format(exam.dates.last)}',
              style: const TextStyle(
                color: Color(0xFFC0C0C0),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ],
        ),
        SizedBox(height: screenheight / 844 * 8),
        Container(
          width: screenwidth / 390 * 358,
          height: screenheight / 844 * 128,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F1F1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              SizedBox(width: screenwidth / 390 * 34),
              Column(
                children: [
                  SizedBox(height: screenheight / 844 * 22),
                  Container(
                    width: screenheight / 844 * 40,
                    height: screenheight / 844 * 40,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        icons[exam.subject] ?? Icons.subject,
                        size: screenwidth / 390 * 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight / 844 * 15),
                  CustomText(
                    text: exam.subject,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: screenwidth / 390 * 283,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenwidth / 390 * 200,
                      child: Center(
                        child: CustomText(
                          text: exam.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenheight / 844 * 7),
                    CustomText(
                      text: '범위 : ${exam.range}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFA4A4A4),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: screenheight / 844 * 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
