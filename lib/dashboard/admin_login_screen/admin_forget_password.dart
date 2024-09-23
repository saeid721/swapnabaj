import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_home_screen/admin_home_screen.dart';
import 'admin_login_screen.dart';
import 'admin_signup_screen.dart';

class AdminForgetPasswordScreen extends StatefulWidget {
  const AdminForgetPasswordScreen({super.key});

  @override
  State<AdminForgetPasswordScreen> createState() => _AdminForgetPasswordScreenState();
}

class _AdminForgetPasswordScreenState extends State<AdminForgetPasswordScreen> {


  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: true,
        title: const Text(
          'Forget Password',
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
                elevation: 1,
                width: Get.width,
                borderRadius: 8, // Adjust the width if needed
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalTextFormField(
                        controller: emailController,
                        titleText: 'Email',
                        hintText: 'Enter Your Email',
                        decoration: borderDecoration,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'SIGN IN',
                        height: 45,
                        onTap: () {
                          Get.to((const AdminHomeScreen()));
                        },
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.primaryColor, fontFamily: 'Rubik'),
                              textAlign: TextAlign.left,
                            ),
                            onTap: (){
                              Get.to(() => const SignUpScreen());
                            },
                          ),
                          InkWell(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.secondaryColor, fontFamily: 'Rubik'),
                              textAlign: TextAlign.left,
                            ),
                            onTap: (){
                              Get.to(() => const SignInScreen());
                            },
                          ),
                        ],
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
