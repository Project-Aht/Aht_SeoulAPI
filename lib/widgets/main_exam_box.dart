import 'package:flutter/material.dart';
import 'custom_text.dart';

class MainExamBox extends StatelessWidget {
  final String examname;
  const MainExamBox(this.examname, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
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
            const CustomText(
              text: 'D-3 ',
              style: TextStyle(
                color: Color(0xFFDE3123),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const CustomText(
              text: '| 2023.08.03',
              style: TextStyle(
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
                  SizedBox(height: screenheight / 844 * 28),
                  Container(
                    width: screenheight / 844 * 40,
                    height: screenheight / 844 * 40,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.calculate_outlined,
                        size: screenwidth / 390 * 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight / 844 * 10),
                  const Text(
                    '수학',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: screenwidth / 390 * 283,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenwidth / 390 * 200,
                      child: Center(
                        child: CustomText(
                          text: examname,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenheight / 844 * 5),
                    const CustomText(
                      text: '범위 : 교과서에 나온 곱셈공식 전부',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA3A3A3),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.25,
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
