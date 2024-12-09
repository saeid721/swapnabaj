import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_dropdown_fromfield.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/images.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../models/sign_in/sign_up_view_model.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpViewModel _viewModel = Get.put(SignUpViewModel());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  String selectUserRole = 'Member'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GlobalImageLoader(
            imagePath: Images.background,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: size(context).height,
            width: size(context).width,
            decoration: BoxDecoration(color: ColorRes.black.withOpacity(0.3)),
          ),
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const GlobalImageLoader(
                      imagePath: Images.appLogo,
                      width: 220,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: size(context).width,
                      decoration: BoxDecoration(color: ColorRes.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropDownFormField(
                              fillColor: Colors.transparent,
                              value: selectUserRole,
                              dynamicPrefixIcon: const Icon(Icons.verified, size: 18),
                              hintText: "Select User Role",
                              isDense: true,
                              filled: true,
                              items: const ["Member", "Admin", "Super Admin"],
                              sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                              onChanged: (val) {
                                setState(() {
                                  selectUserRole = val!;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: nameCon,
                              prefixIcon: const Icon(Icons.person, size: 18),
                              hintText: 'Enter Your Name',
                              decoration: borderDecoration,
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: emailCon,
                              prefixIcon: const Icon(Icons.email, size: 18),
                              hintText: 'Enter Your Email',
                              decoration: borderDecoration,
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: passwordCon,
                              prefixIcon: const Icon(Icons.lock, size: 18),
                              hintText: 'Enter Your Password',
                              decoration: borderDecoration,
                              isDense: true,
                              isPasswordField: true,
                            ),
                            const SizedBox(height: 10),
                            GlobalTextFormField(
                              controller: confirmPassCon,
                              prefixIcon: const Icon(Icons.lock, size: 18),
                              hintText: 'Enter Your Confirm Password',
                              decoration: borderDecoration,
                              isDense: true,
                              isPasswordField: true,
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () {
                                if (_viewModel.isLoading.value) {
                                  return const Center(child: CircularProgressIndicator());
                                } else {
                                  return GlobalButtonWidget(
                                    str: 'SIGN UP',
                                    height: 45,
                                    onTap: () {
                                      _viewModel.signUp(
                                        emailCon.text.trim(),
                                        passwordCon.text.trim(),
                                        nameCon.text.trim(),
                                        selectUserRole,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Already have an account? ',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.textColor, fontFamily: 'Rubik'),
                                      textAlign: TextAlign.left,
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorRes.secondaryColor, fontFamily: 'Rubik'),
                                        textAlign: TextAlign.left,
                                      ),
                                      onTap: () {
                                        Get.to(() => SignInScreen());
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
