import 'package:flutter/material.dart';
import 'user_panel/bottom_navigation_bar/bottom_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SplashScreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
