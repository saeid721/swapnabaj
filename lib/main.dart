import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/splash_screen.dart';
import 'screen/widget/colors.dart';

void main() {
  runApp(const FhdaApp());
}

class FhdaApp extends StatelessWidget {
  const FhdaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future Hope Development Association',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorRes.backgroundColor,
      ),
      home: const SplashScreen(),
    );
  }
}
