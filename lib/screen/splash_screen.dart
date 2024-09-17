import 'package:flutter/material.dart';
import 'bottom_navigation/bottom_navigation_screen.dart';
import 'widget/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 250,
              width: 250,
            ), 
            // const Text(
            //   textAlign: TextAlign.center,
            //   'Future Hope Development Association',
            //   style: TextStyle(
            //       color: ColorRes.primaryColor,
            //       fontSize: 24,
            //       fontWeight: FontWeight.w700),
            // ),
          ],
        ),
      ),
    );
  }
}
