import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_dropdown_fromfield.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../models/sign_in/sign_in_view_model.dart';
import '../../super_admin_panel/Super_admin_home_screen.dart';
import '../../user_panel/bottom_navigation_bar/bottom_navigation.dart';
import '../admin_home_screen/admin_home_screen.dart';
import 'admin_forget_password.dart';

class AdminSignInScreen extends StatefulWidget {
  AdminSignInScreen({Key? key}) : super(key: key);

  @override
  State<AdminSignInScreen> createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final SignInViewModel _viewModel = SignInViewModel();

  final TextEditingController selectEmailCon = TextEditingController();

  final TextEditingController selectPasswordCon = TextEditingController();

  bool rememberPassword = false;
 // Ch
  String selectUserRole = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, // Set height to full screen
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
                      child: Column(children: [
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
                          ], // This should match the type of `selectUserRole`
                          sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                          onChanged: (val) {
                            setState(() {
                              selectUserRole = val!;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: selectEmailCon,
                          prefixIcon: const Icon(Icons.email, size: 18),
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
                        GlobalButtonWidget(
                          str: 'SIGN IN',
                          height: 45,
                          onTap: () {
                            if (selectUserRole.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please select a user role",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else {
                              // Navigate based on user role
                              switch (selectUserRole) {
                                case 'Member':
                                  Get.to(() => const BottomNavigation());
                                  break;
                                case 'Admin':
                                  Get.to(() => const AdminHomeScreen());
                                  break;
                                case 'Super Admin':
                                  Get.to(() => const SuperAdminHomeScreen());
                                  break;
                                default:
                                  Get.snackbar(
                                    "Error",
                                    "Invalid user role selected",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                              }
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberPassword,
                                  onChanged: (value) {},
                                ),
                                const Text("Remember Password"),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => AdminForgetPasswordScreen());
                              },
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(color: ColorRes.red),
                              ),
                            ),
                          ],
                        ),
                      ]),
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
