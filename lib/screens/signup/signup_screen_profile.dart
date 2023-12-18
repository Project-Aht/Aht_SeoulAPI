import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import '../../widgets/custom_text.dart';
import '../../functions/get_image.dart';
import 'signup_screen_school.dart';

class SignUpScreenProfile extends StatefulWidget {
  final String email, pw;
  const SignUpScreenProfile({
    Key? key,
    required this.email,
    required this.pw,
  }) : super(key: key);

  @override
  State<SignUpScreenProfile> createState() => _SignUpScreenProfileState();
}

class _SignUpScreenProfileState extends State<SignUpScreenProfile> {
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth / 390 * 32,
          right: screenWidth / 390 * 32,
          bottom: screenHeight / 844 * 43,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight / 844 * 72,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: screenWidth / 390 * 21,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 22,
                  ),
                  const CustomText(
                    text: '프로필 사진 설정',
                    style: AhtTextTheme.SignUpHeadline,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 16,
                  ),
                  const CustomText(
                    text: '앱 내에서 쓰일 사용자님의\n사진을 설정해주세요.',
                    style: AhtTextTheme.SignUpText,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: screenWidth / 390 * 103,
                        height: screenWidth / 390 * 103,
                        decoration: ShapeDecoration(
                          shape: const OvalBorder(),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: (image == null)
                                ? Image.asset(
                                    'assets/images/default_profile.png',
                                  ).image
                                : Image.memory(image!).image,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 19,
                      ),
                      GestureDetector(
                        onTap: () async {
                          image = await getImage();
                          if (image != null) {
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: screenWidth / 390 * 80,
                          height: screenHeight / 844 * 31,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            border: Border.all(
                              color: const Color(0xFFE6E6E6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: CustomText(
                              text: '설정하기',
                              style: AhtTextTheme.SignUpButton,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => SignUpScreenSchool(
                    email: widget.email,
                    pw: widget.pw,
                    image: image,
                  ),
                  duration: Duration.zero,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: screenHeight / 844 * 52,
                    decoration: BoxDecoration(
                      color: AhtColors.Main_Color,
                      borderRadius:
                          BorderRadius.circular(screenHeight / 844 * 10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: (image == null) ? '건너뛰기' : '다음',
                        style: AhtTextTheme.ButtonText.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
