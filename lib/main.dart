import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase/instance.dart';
import 'themes/color_theme.dart';
import 'package:aht_dimigo/screens/main_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Instance());
  await Get.find<Instance>().getUserInfo();
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
          ? const Scaffold(body: SplashScreen())
          : FutureBuilder(
              future: getInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen();
                } else {
                  if (snapshot.data == null) {
                    return const StartScreen();
                  } else {
                    return const MainScreen();
                  }
                }
              },
            ),
    );
  }
}

/*      home: _showSplashScreen
          ? const Scaffold(body: SplashScreen())
          : FutureBuilder(
              future: getInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen();
                } else {
                  if (snapshot.data == null) {
                    return const StartScreen();
                  } else {
                    return const MainScreen();
                  }
                }
              },
            ),