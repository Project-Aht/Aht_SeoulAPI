import 'package:flutter/material.dart';
import 'custom_text.dart';

class SubjectSelectionBox extends StatelessWidget {
  final String subjectname;
  final bool selected;
  const SubjectSelectionBox(
    this.subjectname, {
    super.key,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    if (selected) {
      return Container(
        width: screenwidth / 390 * 48,
        height: screenheight / 844 * 25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.5)),
        ),
        child: Center(
          child: CustomText(
            text: subjectname,
            style: const TextStyle(
              color: Color(0xFF38498E),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: screenwidth / 390 * 48,
        height: screenheight / 844 * 25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.5)),
        ),
        child: Center(
          child: CustomText(
            text: subjectname,
            style: TextStyle(
              color: const Color(0xFf898989).withOpacity(0.8),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
        ),
      );
    }
  }
}
