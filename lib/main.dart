import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'global_widget/colors.dart';
import 'domain/server/firebase_options.dart';
import 'views/dashboard/admin_home_screen/admin_home_screen.dart';
import 'views/dashboard/admin_login_screen/admin_login_screen.dart';
import 'views/dashboard/admin_login_screen/admin_signup_screen.dart';
import 'views/splash_screen.dart';

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
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => SignInScreen()),
      //   GetPage(name: '/signup', page: () => SignUpScreen()),
      //   GetPage(name: '/admin_home', page: () => AdminHomeScreen()),
      // ],
      home: const SplashScreen(),
    );
  }
}
