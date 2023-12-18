import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import '../../widgets/custom_text.dart';
import 'signup_screen_profile.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List check = [false, false, false];
  String email = '', pw = '', pwCheck = '';
  FocusNode emailFocus = FocusNode(), pwFocus = FocusNode();

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
                    text: '약관 동의',
                    style: AhtTextTheme.SignUpHeadline,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 8,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    height: screenHeight / 844 * 3,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 24,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (check.contains(false)) {
                              check = [true, true, true];
                            } else {
                              check = [false, false, false];
                            }
                          });
                        },
                        child: Icon(
                          (check.contains(false))
                              ? Icons.check_box_outline_blank
                              : Icons.check_box_outlined,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 6,
                      ),
                      const CustomText(
                        text: '전체 약관에 동의합니다.',
                        style: AhtTextTheme.SignUpCheckBox,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 21,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            check[0] = !check[0];
                          });
                        },
                        child: Icon(
                          (check[0])
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 6,
                      ),
                      const CustomText(
                        text: '약관 1에 동의합니다.',
                        style: AhtTextTheme.SignUpCheckBox,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 12,
                  ),
                  Container(
                    height: screenHeight / 844 * 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 12,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            check[1] = !check[1];
                          });
                        },
                        child: Icon(
                          (check[1])
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 6,
                      ),
                      const CustomText(
                        text: '약관 2에 동의합니다.',
                        style: AhtTextTheme.SignUpCheckBox,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 12,
                  ),
                  Container(
                    height: screenHeight / 844 * 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 12,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            check[2] = !check[2];
                          });
                        },
                        child: Icon(
                          (check[2])
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 6,
                      ),
                      const CustomText(
                        text: '만 14세 이상입니다.',
                        style: AhtTextTheme.SignUpCheckBox,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 12,
                  ),
                  Container(
                    height: screenHeight / 844 * 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 33,
                  ),
                  const CustomText(
                    text: '회원 정보',
                    style: AhtTextTheme.SignUpHeadline,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 8,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    height: screenHeight / 844 * 3,
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 21.67,
                        color: Color(0xFFD7D7D7),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 12,
                      ),
                      Expanded(
                        child: CustomTextField(
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          onChanged: (p0) {
                            setState(() {
                              email = p0;
                            });
                          },
                          focusNode: emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          style: AhtTextTheme.LoginText,
                          decoration: const InputDecoration(
                            hintText: '이메일을 입력해 주세요.',
                            hintStyle: AhtTextTheme.LoginHintText,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenHeight / 844 * 2,
                    color: const Color(0xFFD7D7D7),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_outlined,
                        size: 21.67,
                        color: Color(0xFFD7D7D7),
                      ),
                      SizedBox(
                        width: screenWidth / 390 * 12,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: CustomTextField(
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            onChanged: (p0) {
                              setState(() {
                                pw = p0;
                              });
                            },
                            // obscureText: true,
                            focusNode: pwFocus,
                            keyboardType: TextInputType.visiblePassword,
                            style: AhtTextTheme.LoginText,
                            decoration: const InputDecoration(
                              hintText: '비밀번호를 입력해 주세요.',
                              hintStyle: AhtTextTheme.LoginHintText,
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenHeight / 844 * 2,
                    color: const Color(0xFFD7D7D7),
                  ),
                ],
              ),
            ),
            if (!emailFocus.hasFocus && !pwFocus.hasFocus)
              GestureDetector(
                onTap: () {
                  if (check.contains(false)) {
                  } else if (email.isEmpty) {
                  } else if (pw.isEmpty) {
                  } else {
                    Get.to(
                      () => SignUpScreenProfile(
                        email: email,
                        pw: pw,
                      ),
                      duration: Duration.zero,
                    );
                  }
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
                          text: '다음',
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
