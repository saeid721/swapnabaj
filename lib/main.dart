import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/splash_screen.dart';
import 'screen/widget/colors.dart';

void main() {
  runApp(const SwapnobajApp());
}

class SwapnobajApp extends StatelessWidget {
  const SwapnobajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swapnobaj',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorRes.backgroundColor,
      ),
      home: const SplashScreen(),
    );
  }
}
