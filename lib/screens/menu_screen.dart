import 'package:aht_dimigo/screens/myinfo_screen.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';
import '../themes/color_theme.dart';
import 'grade_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aht_dimigo/firebase/auth.dart';
import 'login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight / 844 * 110,
                  decoration: const BoxDecoration(
                    color: AhtColors.Main_Color,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight / 844 * 58),
                      SizedBox(
                        height: screenHeight / 844 * 40,
                        width: screenWidth,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '메뉴',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.4,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight / 844 * 29,
                    right: screenWidth / 390 * 24,
                    left: screenWidth / 390 * 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                          text: '회원정보', style: AhtTextTheme.MenuFontMain),
                      SizedBox(height: screenHeight / 844 * 18),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const MyinfoScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                                text: '회원정보 확인',
                                style: AhtTextTheme.MenuFontSub),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: screenHeight / 844 * 17,
                              color: const Color(0xFFA2A2A2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                              text: '회원정보 수정', style: AhtTextTheme.MenuFontSub),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: screenHeight / 844 * 17,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Container(
                        height: 1,
                        width: screenWidth * 342 / 390,
                        decoration:
                            const BoxDecoration(color: Color(0xFFD9D9D9)),
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      const CustomText(
                          text: '어플리케이션 정보', style: AhtTextTheme.MenuFontMain),
                      SizedBox(height: screenHeight / 844 * 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                              text: '버전', style: AhtTextTheme.MenuFontSub),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: screenHeight / 844 * 17,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                              text: '고객센터', style: AhtTextTheme.MenuFontSub),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: screenHeight / 844 * 17,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                              text: '개인정보처리방침 및 법률정보',
                              style: AhtTextTheme.MenuFontSub),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: screenHeight / 844 * 17,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Container(
                        height: 1,
                        width: screenWidth * 342 / 390,
                        decoration:
                            const BoxDecoration(color: Color(0xFFD9D9D9)),
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      const CustomText(
                          text: '중요 정보', style: AhtTextTheme.MenuFontMain),
                      SizedBox(height: screenHeight / 844 * 18),
                      GestureDetector(
                        onTap: () async {
                          await Auth.signout();
                          Get.to(() => const LoginScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                                text: '로그아웃',
                                style: AhtTextTheme.MenuFontSubHighlight),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: screenHeight / 844 * 17,
                              color: const Color(0xFFA2A2A2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                              text: '계정 탈퇴',
                              style: AhtTextTheme.MenuFontSubHighlight),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: screenHeight / 844 * 17,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight / 844 * 22),
                      Container(
                        height: 1,
                        width: screenWidth * 342 / 390,
                        decoration:
                            const BoxDecoration(color: Color(0xFFD9D9D9)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (loading)
            GestureDetector(
              onTap: () {},
              onHorizontalDragStart: (details) {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void _GetToGradeCalculatorScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToDoneExamScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}

void _GetToEditInformationScreen() {
  Get.to(() => const GradeCalclulatorScreen());
}
