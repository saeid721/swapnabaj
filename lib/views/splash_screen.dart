import 'package:flutter/material.dart';
import '../global_widget/colors.dart';
import '../global_widget/global_image_loader.dart';
import '../global_widget/global_sizedbox.dart';
import '../global_widget/images.dart';
import 'dashboard/admin_login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });

    return Scaffold(
      body: Container(
        height: size(context).height,
        width: size(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        decoration: const BoxDecoration(
          color: ColorRes.backgroundColor,
        ),
        child: Center(
          child: GlobalImageLoader(
            imagePath: Images.splash,
            height: size(context).height,
            width: size(context).width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
