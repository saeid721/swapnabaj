import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../models/sign_in/sign_in_view_model.dart';
import 'admin_forget_password.dart';
import 'admin_signup_screen.dart';

class AdminSignInScreen extends StatelessWidget {
  AdminSignInScreen({Key? key}) : super(key: key);

  final SignInViewModel _viewModel = SignInViewModel();
  final TextEditingController selectEmailCon = TextEditingController();
  final TextEditingController selectPasswordCon = TextEditingController();

  // void _signIn() async {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //
  //   var user = await _viewModel.signIn(email, password);
  //   if (user != null) {
  //     // Navigate to Admin Home Screen after successful sign-in
  //     Get.toNamed('/admin_home');
  //   } else {
  //     Get.snackbar('Error', 'Sign in failed');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GlobalContainer(
              backgroundColor: ColorRes.white,
              elevation: 1,
              width: Get.width,
              borderRadius: 8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    GlobalTextFormField(
                      controller: selectEmailCon,
                      titleText: 'Email',
                      hintText: 'Enter Your Email',
                      decoration: borderDecoration,
                    ),
                    const SizedBox(height: 10),
                    GlobalTextFormField(
                      controller: selectPasswordCon,
                      titleText: 'Password',
                      hintText: 'Enter Your Password',
                      decoration: borderDecoration,
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 20),
                    GlobalButtonWidget(
                      str: 'SIGN IN',
                      onTap: () {
                        _viewModel.signIn(
                          selectEmailCon.text.trim(),
                          selectPasswordCon.text.trim(),
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorRes.primaryColor,
                                fontFamily: 'Rubik'),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            Get.to(() => SignUpScreen());
                          },
                        ),
                        InkWell(
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorRes.red,
                                fontFamily: 'Rubik'),
                            textAlign: TextAlign.right,
                          ),
                          onTap: () {
                            Get.to(() => const AdminForgetPasswordScreen());
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
    );
  }
}
