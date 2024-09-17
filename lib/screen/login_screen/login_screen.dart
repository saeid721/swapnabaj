import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/colors.dart';
import '../widget/global_button.dart';
import '../widget/global_container.dart';
import '../widget/global_image_loader.dart';
import '../widget/global_textform_field.dart';
import '../widget/images.dart';
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
        backgroundColor: ColorRes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        title: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorRes.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Center(
                          child: GlobalImageLoader(
                            imagePath: Images.appLogo,
                            width: 250,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 10),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
