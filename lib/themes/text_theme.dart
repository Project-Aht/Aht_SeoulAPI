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
  static const MiddleMenuText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  static final TextfieldHintText = TextStyle(
    color: Colors.black.withOpacity(0.2),
    fontSize: 16,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  static const LoginText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const LoginHintText = TextStyle(
    color: Color(0xFFD9D9D9),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  static const CheckBoxText = TextStyle(
    color: Color(0xFFD9D9D9),
    fontSize: 12,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const CheckBoxHighlight = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const LogoText = TextStyle(
    color: Color(0xFF38498E),
    fontSize: 64,
    fontFamily: 'Righteous',
    fontWeight: FontWeight.w400,
    height: 0,
  );
}
