import 'package:aht_dimigo/firebase/auth.dart';
import 'package:aht_dimigo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/color_theme.dart';
import '../themes/text_theme.dart';
import '../widgets/custom_text.dart';
import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email, pw, pwCheck, schoolName;
  int? schoolGrade, schoolClass;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 390 * 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 844 * 60,
              ),
              const CustomText(
                text: 'Aht!',
                style: AhtTextTheme.LogoText,
              ),
              SizedBox(
                height: screenHeight / 844 * 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: screenWidth / 390 * 22.5,
                    color: const Color(0xFFD9D9D9),
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 7.25,
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 266,
                    child: CustomTextField(
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onChanged: (p0) {
                        setState(() {
                          email = p0;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: '이메일을 입력해 주세요.',
                        hintStyle: AhtTextTheme.LoginHintText,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF7D7D7D),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 844 * 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: screenWidth / 390 * 22.5,
                    color: const Color(0xFFD9D9D9),
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 7.25,
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 266,
                    child: CustomTextField(
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onChanged: (p0) {
                        setState(() {
                          pw = p0;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: '비밀번호를 입력해 주세요.',
                        hintStyle: AhtTextTheme.LoginHintText,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF7D7D7D),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 844 * 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: screenWidth / 390 * 22.5,
                    color: const Color(0xFFD9D9D9),
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 7.25,
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 266,
                    child: CustomTextField(
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onChanged: (p0) {
                        setState(() {
                          pwCheck = p0;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: '비밀번호를 다시 입력해 주세요.',
                        hintStyle: AhtTextTheme.LoginHintText,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF7D7D7D),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 844 * 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: screenWidth / 390 * 22.5,
                    color: const Color(0xFFD9D9D9),
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 7.25,
                  ),
                  SizedBox(
                    width: screenWidth / 390 * 266,
                    child: CustomTextField(
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onChanged: (p0) {
                        setState(() {
                          schoolName = p0;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: '학교명을 입력해 주세요.',
                        hintStyle: AhtTextTheme.LoginHintText,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF7D7D7D),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 844 * 24,
              ),
              Container(
                width: screenWidth / 390 * 266,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight / 844 * 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth / 390 * 20,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                          child: CustomTextField(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            onChanged: (p0) {
                              setState(() {
                                schoolGrade = int.tryParse(p0);
                              });
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                        ),
                        const CustomText(text: '학년'),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: screenWidth / 390 * 20,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                          child: CustomTextField(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            onChanged: (p0) {
                              setState(() {
                                schoolClass = int.tryParse(p0);
                              });
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                        ),
                        const CustomText(text: '반'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight / 844 * 24,
              ),
              SizedBox(
                height: screenHeight / 844 * 44,
              ),
              GestureDetector(
                onTap: () async {
                  if (email == null) {
                    Get.snackbar(
                      '',
                      '이메일을 입력해주세요.',
                    );
                  } else if (pw == null) {
                    Get.snackbar(
                      '',
                      '비밀번호를 입력해주세요.',
                    );
                  } else if (pw != pwCheck) {
                    Get.snackbar(
                      '',
                      '비밀번호가 일치하지 않습니다.',
                    );
                  } else if (schoolName == null ||
                      schoolGrade == null ||
                      schoolClass == null) {
                    Get.snackbar(
                      '',
                      '학교 정보를 입력해주세요.',
                    );
                  } else {
                    bool signupCompleted = await Auth.signup(
                      email: email!,
                      pw: pw!,
                      schoolName: schoolName!,
                      schoolGrade: schoolGrade!,
                      schoolClass: schoolClass!,
                    );
                    if (signupCompleted) {
                      Get.offAll(() => const MainScreen());
                    } else {
                      Get.snackbar(
                        '',
                        '회원가입에 실패했습니다.',
                      );
                    }
                  }
                },
                child: Container(
                  height: screenHeight / 844 * 52,
                  decoration: BoxDecoration(
                    color: AhtColors.Main_Color,
                    borderRadius:
                        BorderRadius.circular(screenHeight / 844 * 10),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: '회원가입',
                      style: AhtTextTheme.ButtonText,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 844 * 8,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF38498E),
                          ),
                        ),
                      ),
                      child: CustomText(
                        text: '“앗” 회원이라면? 로그인하기',
                        style: AhtTextTheme.CheckBoxText.apply(
                          color: const Color(0xFF38498E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
