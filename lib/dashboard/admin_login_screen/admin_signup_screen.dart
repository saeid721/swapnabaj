import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_dropdown_fromfield.dart';
import '../../global_widget/global_sizedbox.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_home_screen/admin_home_screen.dart';
import 'admin_login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String? _fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    String selectUserRole = '0';

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: false,
        title: const Text(
          'Sign Up',
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
                        sufixIcon:
                        const Icon(Icons.keyboard_arrow_down_sharp),
                        onChanged: (val) {
                          setState(
                                () {
                              selectUserRole = val!;
                              log("Value: $val");
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: emailController,
                        titleText: 'User Name',
                        hintText: 'Enter Your Name',
                        decoration: borderDecoration,
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
                      const SizedBox(height: 10),
                      const Text(
                        'Profile Picture',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.textColor, fontFamily: 'Rubik'),
                        textAlign: TextAlign.left,
                      ),
                      sizedBoxH(5),
                      GlobalButtonWidget(
                        str: 'Choose File',
                        height: 50,
                        width: Get.width,
                        textSize: 14,
                        textColor: ColorRes.textColor,
                        radius: 5,
                        borderColor: ColorRes.borderColor,
                        buttomColor: Colors.transparent,
                        onTap: _pickFile,
                      ),
                      if (_fileName != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Selected file: $_fileName',
                            style: const TextStyle(fontSize: 16),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          // InkWell(
                          //   child: const Text(
                          //     'Forget Password',
                          //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.red, fontFamily: 'Rubik'),
                          //     textAlign: TextAlign.right,
                          //   ),
                          //   onTap: (){},
                          // ),
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
