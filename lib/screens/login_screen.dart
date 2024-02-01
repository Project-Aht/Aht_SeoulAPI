import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase/auth.dart';
import '../firebase/exam.dart';
import '../themes/color_theme.dart';
import '../themes/text_theme.dart';
import '../widgets/custom_text.dart';
import '../firebase/instance.dart';
import 'signup/signup_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selected = 'login';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 844 * 119,
              ),
              const CustomText(
                text: 'Aht!',
                style: AhtTextTheme.LogoText,
              ),
              SizedBox(
                height: screenHeight / 844 * 29,
              ),
              const CustomText(
                text: '당신만을 위한\n수행평가 관리 어플리케이션.',
                style: AhtTextTheme.LoginText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenHeight / 844 * 92,
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    screenWidth / 390 * 30,
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                top: screenHeight / 844 * 32,
                left: screenWidth / 390 * 32,
                right: screenWidth / 390 * 32,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'login';
                          });
                        },
                        child: Container(
                          height: screenHeight / 844 * 44,
                          decoration: BoxDecoration(
                            color: (selected == 'login')
                                ? AhtColors.Main_Color
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              screenHeight / 844 * 22,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth / 390 * 24,
                          ),
                          child: Center(
                            child: CustomText(
                              text: '로그인',
                              style: TextStyle(
                                color: (selected == 'login')
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: screenHeight / 844 * 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7D7D7D),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'signup';
                          });
                        },
                        child: Container(
                          height: screenHeight / 844 * 44,
                          decoration: BoxDecoration(
                            color: (selected != 'login')
                                ? AhtColors.Main_Color
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              screenHeight / 844 * 22,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth / 390 * 24,
                          ),
                          child: Center(
                            child: CustomText(
                              text: '회원가입',
                              style: TextStyle(
                                color: (selected != 'login')
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: (selected == 'login')
                        ? const LoginTab()
                        : const SignupTab(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignupTab extends StatelessWidget {
  const SignupTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight / 844 * 48,
        ),
        GestureDetector(
          onTap: () async {
            Get.to(() => const SignUpScreen());
          },
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
              color: AhtColors.Main_Color,
              borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
            ),
            child: const Center(
              child: CustomText(
                text: '이메일로 회원가입',
                style: AhtTextTheme.ButtonText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight / 844 * 13,
        ),
        GestureDetector(
          onTap: () async {},
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
              color: AhtColors.Main_Color,
              borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
            ),
            child: const Center(
              child: CustomText(
                text: '',
                style: AhtTextTheme.ButtonText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight / 844 * 13,
        ),
        GestureDetector(
          onTap: () async {},
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
              color: AhtColors.Main_Color,
              borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
            ),
            child: const Center(
              child: CustomText(
                text: '',
                style: AhtTextTheme.ButtonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginTab extends StatefulWidget {
  const LoginTab({
    super.key,
  });

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController _controller = TextEditingController();

  late final SharedPreferences prefs;
  bool savingId = false;
  bool autoLogin = false;

  String? email;
  String? pw;

  @override
  void initState() {
    super.initState();
    getSavedId();
  }

  Future<void> getSavedId() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      if (email != null) savingId = true;
      _controller.text = email ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight / 844 * 52,
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
                controller: _controller,
                onChanged: (p0) {
                  setState(() {
                    email = p0;
                  });
                },
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                style: AhtTextTheme.LoginText,
                textInputAction: TextInputAction.next,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline,
              size: 21.67,
              color: Color(0xFFD7D7D7),
            ),
            SizedBox(
              width: screenWidth / 390 * 12,
            ),
            Expanded(
              child: CustomTextField(
                onChanged: (p0) {
                  setState(() {
                    pw = p0;
                  });
                },
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                style: AhtTextTheme.LoginText,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: '비밀번호를 입력해 주세요.',
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
          height: screenHeight / 844 * 32,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  savingId = !savingId;
                });
              },
              child: Icon(
                (savingId)
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank,
                color: Color((savingId) ? 0xFF000000 : 0xFFD9D9D9),
                size: 16,
              ),
            ),
            SizedBox(
              width: screenWidth / 390 * 8,
            ),
            const CustomText(
              text: '아이디 저장',
              style: AhtTextTheme.CheckBoxText,
            ),
            SizedBox(
              width: screenWidth / 390 * 24,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  autoLogin = !autoLogin;
                });
              },
              child: Icon(
                (autoLogin)
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank,
                color: Color((autoLogin) ? 0xFF000000 : 0xFFD9D9D9),
                size: 16,
              ),
            ),
            SizedBox(
              width: screenWidth / 390 * 8,
            ),
            const CustomText(
              text: '자동 로그인',
              style: AhtTextTheme.CheckBoxText,
            ),
          ],
        ),
        const Expanded(
          child: SizedBox(),
        ),
        GestureDetector(
          onTap: () async {
            if (email != null && pw != null) {
              bool signinCompleted = await Auth.signin(
                email: email!,
                pw: pw!,
                autoLogin: autoLogin,
                savingId: savingId,
              );
              if (signinCompleted) {
                await Get.find<Instance>().getUserInfo();
                await initExam();
                Get.find<Instance>().getExams();
                Get.offAll(() => const MainScreen());
              }
            }
          },
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
              color: AhtColors.Main_Color,
              borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
            ),
            child: const Center(
              child: CustomText(
                text: '로그인',
                style: AhtTextTheme.ButtonText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight / 844 * 44,
        ),
      ],
    );
  }
}
