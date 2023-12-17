// ignore_for_file: use_build_context_synchronously

import 'package:aht_dimigo/firebase/auth.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase/instance.dart';
import 'main_screen.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 390 * 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight / 844 * 110,
            ),
            const CustomText(
              text: 'Aht!',
              style: AhtTextTheme.LogoText,
            ),
            SizedBox(
              height: screenHeight / 844 * 91,
            ),
            const CustomText(
              text: '당신만을 위한 수행평가 관리 어플리케이션.',
              style: AhtTextTheme.LoginText,
            ),
            SizedBox(
              height: screenHeight / 844 * 10,
            ),
            const CustomText(
              text: '로그인 하여 “앗”을 바로 이용해 볼까요?',
              style: AhtTextTheme.LoginText,
            ),
            SizedBox(
              height: screenHeight / 844 * 55,
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
                    controller: _controller,
                    onChanged: (p0) {
                      setState(() {
                        email = p0;
                      });
                    },
                    textInputAction: TextInputAction.next,
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
                    onChanged: (p0) {
                      setState(() {
                        pw = p0;
                      });
                    },
                    textInputAction: TextInputAction.done,
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
                  ),
                ),
                SizedBox(
                  width: screenWidth / 390 * 8,
                ),
                CustomText(
                  text: '아이디 저장',
                  style: (savingId)
                      ? AhtTextTheme.CheckBoxHighlight
                      : AhtTextTheme.CheckBoxText,
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
                  ),
                ),
                SizedBox(
                  width: screenWidth / 390 * 8,
                ),
                CustomText(
                  text: '자동 로그인',
                  style: (autoLogin)
                      ? AhtTextTheme.CheckBoxHighlight
                      : AhtTextTheme.CheckBoxText,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 844 * 44,
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
              height: screenHeight / 844 * 8,
            ),
            Row(
              children: [
                const CustomText(
                  text: '아이디 찾기',
                  style: AhtTextTheme.CheckBoxText,
                ),
                SizedBox(
                  width: screenWidth / 390 * 15,
                ),
                const CustomText(
                  text: '비밀번호 찾기',
                  style: AhtTextTheme.CheckBoxText,
                ),
                SizedBox(
                  width: screenWidth / 390 * 12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUpScreen());
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
                      text: '“앗”이 처음이라면? 회원가입하기',
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
    );
  }
}
