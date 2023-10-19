import 'package:aht_dimigo/firebase/auth.dart';
import 'package:aht_dimigo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'firebase/instance.dart';
import 'themes/color_theme.dart';
import 'screens/main_screen.dart';
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
  bool? loginCompleted;

  Future<void> _loadData() async {
    await Future.delayed(
        const Duration(milliseconds: 2000)); // splash screen이 표시될 시간(초)
    print(2);
    setState(() {
      _showSplashScreen = false;
    });
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? pw = prefs.getString('pw');
    if (pw == null) {
      print(1);
      setState(() {
        loginCompleted = false;
      });
      return;
    }
    loginCompleted = await Auth.signin(
      email: email!,
      pw: pw,
      autoLogin: true,
      savingId: true,
    );
    if (loginCompleted!) {
      await Get.find<Instance>().getUserInfo();
    } else {
      await prefs.remove('email');
      await prefs.remove('pw');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
          colorScheme: const ColorScheme.light(
            background: Colors.white,
            brightness: Brightness.light,
          ),
          primaryColor: AhtColors.Main_Color,
        ),
        home: (_showSplashScreen || loginCompleted == null)
            ? const Scaffold(body: SplashScreen()) //값 받을 때까지 대기
            : (loginCompleted!)
                ? const MainScreen() //자동 로그인 정보가 유효하면 메인 화면으로
                : const LoginScreen());
  }
}
