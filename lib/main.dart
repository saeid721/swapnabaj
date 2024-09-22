import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'global_widget/colors.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
