import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: AhtColors.Highlight_Color,
      ),
    ));
  }
}
