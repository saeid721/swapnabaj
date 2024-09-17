import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/colors.dart';
import '../widget/global_button.dart';
import '../widget/global_container.dart';
import '../widget/global_textform_field.dart';
import '../widget/input_decoration.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: false,
        title: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.capitalColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GlobalContainer(
                backgroundColor: ColorRes.white,
                width: Get.width * 0.9, // Adjust the width if needed
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Center(
                      //   child: GlobalImageLoader(
                      //     imagePath: Images.appLogo,
                      //     width: 250,
                      //     fit: BoxFit.fitWidth,
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: emailController,
                        titleText: 'Email',
                        hintText: 'Enter Your Email',
                        decoration: borderDecoration,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: passwordController,
                        titleText: 'Password',
                        hintText: 'Enter Your Password',
                        decoration: borderDecoration,
                        isDense: true,
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'SIGN IN',
                        height: 45,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
