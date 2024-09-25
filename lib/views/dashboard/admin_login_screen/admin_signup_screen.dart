import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_dropdown_fromfield.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../models/sign_in/sign_up_view_model.dart';
import 'admin_login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpViewModel _viewModel = Get.put(SignUpViewModel());

  final TextEditingController selectUserNameController = TextEditingController();
  final TextEditingController selectEmailCon = TextEditingController();
  final TextEditingController selectPasswordCon = TextEditingController();

  String selectUserRole = 'Member'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF007142), Color(0xFF35C147)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
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
                              dynamicPrefixIcon: const Icon(Icons.person, size: 18),
                              hintText: "Select User Role",
                              isDense: true,
                              filled: true,
                              items: const [
                                "Member",
                                "Admin",
                                "Super Admin"
                              ],
                              sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                              onChanged: (val) {
                                setState(() {
                                  selectUserRole = val!;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: selectUserNameController,
                              prefixIcon: const Icon(Icons.person, size: 18),
                              hintText: 'Enter Your Name',
                              decoration: borderDecoration,
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: selectEmailCon,
                              prefixIcon: Icon(Icons.email, size: 18),
                              hintText: 'Enter Your Email',
                              decoration: borderDecoration,
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: selectPasswordCon,
                              prefixIcon: const Icon(Icons.lock, size: 18),
                              hintText: 'Enter Your Password',
                              decoration: borderDecoration,
                              isDense: true,
                              isPasswordField: true,
                            ),
                            const SizedBox(height: 20),
                            Obx(() {
                              if (_viewModel.isLoading.value) {
                                return const Center(child: CircularProgressIndicator());
                              } else {
                                return GlobalButtonWidget(
                                  str: 'SIGN UP',
                                  height: 45,
                                  onTap: () {
                                    _viewModel.signUp(
                                      selectEmailCon.text.trim(),
                                      selectPasswordCon.text.trim(),
                                      selectUserNameController.text.trim(),
                                      selectUserRole,
                                    );
                                  },
                                );
                              }
                            }),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Already have an account! ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontFamily: 'Rubik'),
                                      textAlign: TextAlign.left,
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorRes.secondaryColor,
                                            fontFamily: 'Rubik'),
                                        textAlign: TextAlign.left,
                                      ),
                                      onTap: () {
                                        Get.to(() => AdminSignInScreen());
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
}
