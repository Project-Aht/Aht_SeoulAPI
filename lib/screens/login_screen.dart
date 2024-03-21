import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 390 * 33),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth / 390 * 326,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight / 844 * 131,
                  ),
                  Container(
                    width: screenHeight / 844 * 76,
                    height: screenHeight / 844 * 76,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Applogo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 844 * 15,
                  ),
                  const CustomText(
                    text: '당신만을 위한\n수행평가 관리 어플리케이션.',
                    style: AhtTextTheme.LoginText,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 844 * 10),
            const LoginTab(),
            SizedBox(height: screenHeight / 844 * 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const CustomText(
                      text: '아이디 찾기', style: AhtTextTheme.LoginSmallText),
                  onTap: () {
                    Get.snackbar(
                      '알림',
                      '해당 기능은 개발중에 있습니다. 조금만 기다려주세요!',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
                SizedBox(width: screenWidth / 390 * 5),
                const CustomText(text: '|', style: AhtTextTheme.LoginSmallText),
                SizedBox(width: screenWidth / 390 * 5),
                GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      '알림',
                      '해당 기능은 개발중에 있습니다. 조금만 기다려주세요!',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                  },
                  child: const CustomText(
                      text: '비밀번호 찾기', style: AhtTextTheme.LoginSmallText),
                ),
                SizedBox(width: screenWidth / 390 * 5),
                const CustomText(text: '|', style: AhtTextTheme.LoginSmallText),
                SizedBox(width: screenWidth / 390 * 5),
                GestureDetector(
                  onTap: () async {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const CustomText(
                      text: '회원가입', style: AhtTextTheme.LoginSmallText),
                ),
              ],
            ),
          ],
        ),
      ),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: screenWidth / 390 * 26,
              color: const Color(0xFFD7D7D7),
            ),
            SizedBox(
              width: screenWidth / 390 * 8,
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
                  hintText: '이메일',
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
            Icon(
              Icons.lock_outline,
              size: screenWidth / 390 * 26,
              color: const Color(0xFFD7D7D7),
            ),
            SizedBox(
              width: screenWidth / 390 * 8,
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
                  hintText: '비밀번호',
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
            CustomText(
              text: '아이디 저장',
              style: (savingId)
                  ? AhtTextTheme.CheckBoxTextChange
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
                size: 16,
              ),
            ),
            SizedBox(
              width: screenWidth / 390 * 8,
            ),
            CustomText(
              text: '자동 로그인',
              style: (autoLogin)
                  ? AhtTextTheme.CheckBoxTextChange
                  : AhtTextTheme.CheckBoxText,
            ),
          ],
        ),
        SizedBox(height: screenHeight / 844 * 20),
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
          height: screenHeight / 844 * 20,
        ),
        Row(
          children: [
            Container(
              width: screenWidth / 390 * 140,
              height: screenHeight / 844 * 1,
              decoration: const BoxDecoration(color: Color(0xFF474747)),
            ),
            SizedBox(width: screenWidth / 390 * 12),
            const CustomText(
              text: '또는',
              style: AhtTextTheme.OrText,
            ),
            SizedBox(width: screenWidth / 390 * 12),
            Container(
              width: screenWidth / 390 * 140,
              height: screenHeight / 844 * 1,
              decoration: const BoxDecoration(color: Color(0xFF474747)),
            ),
          ],
        ),
        SizedBox(height: screenHeight / 844 * 20),
        GestureDetector(
          onTap: () {
            Get.snackbar(
              '알림',
              '해당 기능은 개발중에 있습니다. 조금만 기다려주세요!',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
                border: Border.all(color: Colors.black, width: 0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenHeight / 844 * 24,
                  height: screenHeight / 844 * 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_google.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth / 390 * 10),
                const CustomText(
                  text: '구글로 로그인',
                  style: AhtTextTheme.ButtonTextBlack,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 844 * 13),
        GestureDetector(
          onTap: () {
            Get.snackbar(
              '알림',
              '해당 기능은 개발중에 있습니다. 조금만 기다려주세요!',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
          child: Container(
            height: screenHeight / 844 * 52,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenHeight / 844 * 10),
                border: Border.all(color: Colors.black, width: 0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenHeight / 844 * 24,
                  height: screenHeight / 844 * 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_facebook.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth / 390 * 10),
                const CustomText(
                  text: '페이스북으로 로그인',
                  style: AhtTextTheme.ButtonTextBlack,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
