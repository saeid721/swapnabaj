import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/capital_controller/capital_controller.dart';
import 'controllers/expense_controller/expense_controller.dart';
import 'controllers/investment_controller/investment_controller.dart';
import 'controllers/profit_controller/profit_controller.dart';
import 'global_widget/colors.dart';
import 'domain/server/firebase_options.dart';
import 'views/getit_locator.dart';
import 'views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await init(prefs);

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