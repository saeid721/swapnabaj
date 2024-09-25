import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import 'admin_login_screen.dart';
import 'admin_signup_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController selectEmailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF007142), Color(0xFF35C147)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/placeholder.png',
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: GlobalContainer(
                      backgroundColor: ColorRes.white,
                      elevation: 1,
                      width: Get.width,
                      borderRadius: 8, // Adjust the width if needed
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: selectEmailCon,
                              prefixIcon: const Icon(Icons.email, size: 18),
                              hintText: 'Enter Your Email',
                              decoration: borderDecoration,
                            ),
                            const SizedBox(height: 20),
                            GlobalButtonWidget(
                              str: 'Reset assword',
                              height: 45,
                              onTap: () {
                                Get.to(() => SignInScreen());
                              },
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'New Member? ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontFamily: 'Rubik'),
                                      textAlign: TextAlign.left,
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorRes.secondaryColor,
                                            fontFamily: 'Rubik'),
                                        textAlign: TextAlign.left,
                                      ),
                                      onTap: () {
                                        Get.to(() => SignUpScreen());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    selectEmailCon.dispose();
    super.dispose();
  }
}
