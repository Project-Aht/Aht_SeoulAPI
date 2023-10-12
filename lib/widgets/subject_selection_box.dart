import 'package:flutter/material.dart';
import 'custom_text.dart';

class SubjectSelectionBox extends StatelessWidget {
  final String subjectname;
  const SubjectSelectionBox(this.subjectname, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth / 390 * 57,
      height: screenheight / 844 * 31,
      decoration: const BoxDecoration(
        color: Color(0xFF38498E),
        borderRadius: BorderRadius.all(Radius.circular(15.5)),
      ),
      child: Center(
        child: CustomText(
          text: subjectname,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w300,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
