import 'package:flutter/material.dart';

abstract class AhtTextTheme {
  static const TopMenuBar = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 1.6,
  );
  static const SubjectCardHighlight = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  static const SubjectCardDetail = TextStyle(
    color: Color.fromARGB(60, 0, 0, 0),
    fontSize: 16,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  static const GradeResultMean = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 1.05,
  );
  static const ButtonText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
}
