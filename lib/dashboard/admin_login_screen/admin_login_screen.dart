import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_dropdown_fromfield.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_home_screen/admin_home_screen.dart';
import 'admin_forget_password.dart';
import 'admin_signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController selectEmailCon = TextEditingController();
  final TextEditingController selectPasswordCon = TextEditingController();
  String selectUserRole = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: true,
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
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDropDownFormField(
                        value: selectUserRole,
                        titleText: "Select User Role",
                        hintText: "Select User Role",
                        isDense: true,
                        filled: true,
                        items: const [
                          "Member",
                          "Admin",
                          "Super Admin",
                        ],
                        sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                        onChanged: (val) {
                          setState(() {
                            selectUserRole = val!;
                            log("Value: $val");
                          });
                        },
                      ),
                      const SizedBox(height: 10),
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
                        isDense: true,
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'SIGN IN',
                        height: 45,
                        onTap: () {
                          Get.to(const AdminHomeScreen());
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
                              Get.to(() => const SignUpScreen());
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
      ),
    );
  }

  @override
  void dispose() {
    selectEmailCon.dispose();
    selectPasswordCon.dispose();
    super.dispose();
  }

}
