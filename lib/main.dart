import 'package:aht_dimigo/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'firebase/instance.dart';
import 'themes/color_theme.dart';
import 'package:aht_dimigo/screens/main_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Instance());
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _showSplashScreen = true;

  Future<void> _loadData() async {
    await Future.delayed(
        const Duration(milliseconds: 2000)); // splash screen이 표시될 시간(초)
    setState(() {
      _showSplashScreen = false;
    });
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? pw = prefs.getString('pw');
    if (email == null || pw == null) {
      return false;
    }
    bool loginCompleted = await Auth.signin(
      email: email,
      pw: pw,
      autoLogin: true,
    );
    if (loginCompleted) {
      Get.find<Instance>().getUserInfo();
    }
    return loginCompleted;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          brightness: Brightness.light,
        ),
        primaryColor: AhtColors.Main_Color,
      ),
      home: _showSplashScreen
          ? const SplashScreen()
          : FutureBuilder(
              future: autoLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen(); //값 받을 때까지 대기
                } else {
                  if (snapshot.data == true) {
                    return const MainScreen(); //자동 로그인 정보가 유효하면 메인 화면으로
                  } else {
                    () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove('email');
                      prefs.remove('pw');
                    }();
                    return const MainScreen();
                    // return const LoginScreen(); //자동 로그인 정보가 없거나 유효하지 않으면 로그인 화면으로
                  }
                }
              },
            ),
    );
  }
}
