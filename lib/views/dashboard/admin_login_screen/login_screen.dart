import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_dropdown_fromfield.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/images.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/true_false_container.dart';
import '../../super_admin_panel/Super_admin_home_screen.dart';
import '../../user_panel/home_screen/home_screen.dart';
import '../admin_home_screen/admin_home_screen.dart';
import 'forget_password_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool history = true;

  // final TextEditingController emailCon = TextEditingController();
  // final TextEditingController passwordCon = TextEditingController();
  // TextEditingController emailCon = TextEditingController(text: "saeid915415@gmai.com");
  TextEditingController phoneCon = TextEditingController(text: "01738030721");
  TextEditingController passCon = TextEditingController(text: "12345");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          child: Form(
            key: formKey,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: size(context).height,
                    width: size(context).width,
                  ),
                  GlobalImageLoader(
                    imagePath: Images.background,
                    height: size(context).height,
                    width: size(context).width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: size(context).height,
                    width: size(context).width,
                    decoration: BoxDecoration(color: ColorRes.black.withOpacity(0.3)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: GlobalImageLoader(
                            imagePath: Images.appLogo,
                            width: 220,
                            fit: BoxFit.fill,
                            //imageFor: ImageFor.network,
                          ),
                        ),
                        sizedBoxH(20),
                        TrueFalseContainer(
                          currentValue: history,
                          trueText: "Member",
                          falseText: "Admin",
                          onChange: (value) {
                            setState(() {
                              history = value;
                            });
                          },
                        ),
                        sizedBoxH(10),
                        Container(
                          width: size(context).width,
                          decoration: BoxDecoration(color: ColorRes.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: IndexedStack(
                            index: history ? 0 : 1,
                            children: [
                              history ? UserLogInWidget(phoneCon: phoneCon, passCon: passCon) : const SizedBox.shrink(),
                              AdminLogInWidget(phoneCon: phoneCon, passCon: passCon, selectUserRole: '', onRoleChanged: (String? value) {}),
                            ],
                          ),
                        ),
                      ],
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

class UserLogInWidget extends StatelessWidget {
  final TextEditingController? phoneCon;
  final TextEditingController? passCon;
  const UserLogInWidget({super.key, required this.phoneCon, required this.passCon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBoxH(10),
        GlobalTextFormField(
          controller: phoneCon,
          prefixIcon: const Icon(Icons.phone, size: 18),
          //titleText: 'Phone',
          hintText: 'Enter Your Phone',
          decoration: borderDecoration,
        ),
        sizedBoxH(10),
        GlobalTextFormField(
          controller: passCon,
          prefixIcon: const Icon(Icons.password, size: 18),
          //titleText: 'Password',
          hintText: 'Enter Your Password',
          decoration: borderDecoration,
          isDense: true,
          isPasswordField: true,
        ),
        sizedBoxH(20),
        GlobalButtonWidget(
          str: 'SIGN IN',
          height: 45,
          onTap: () {
            Get.to(() => const HomeScreen());
          },
        ),
        sizedBoxH(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: false, // Set it as per your logic
                  onChanged: (value) {},
                ),
                const Text("Remember Password"),
              ],
            ),
            InkWell(
              onTap: () {
                Get.to(() => const ForgetPasswordScreen());
              },
              child: const Text(
                "Forget Password?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.red),
              ),
            ),
          ],
        ),
        sizedBoxH(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GlobalText(
              str: "Have an Account? ",
              fontWeight: FontWeight.normal,
              color: ColorRes.white,
              fontSize: 14,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const SignUpScreen());
              },
              child: const GlobalText(
                str: "Sign Up",
                fontWeight: FontWeight.w500,
                color: ColorRes.primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AdminLogInWidget extends StatelessWidget {
  final TextEditingController? phoneCon;
  final TextEditingController? passCon;
  final String selectUserRole;
  final ValueChanged<String?> onRoleChanged;
  const AdminLogInWidget({
    super.key,
    required this.phoneCon,
    required this.passCon,
    required this.selectUserRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownFormField(
          fillColor: Colors.transparent,
          value: selectUserRole,
          dynamicPrefixIcon: const Icon(Icons.person, size: 18),
          hintText: "Select User Role",
          isDense: true,
          filled: true,
          items: const ["Admin", "Super Admin"],
          sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
          onChanged: (String? newValue) {
            onRoleChanged(newValue ?? ""); // Provide a default empty string in case of null
          },
        ),
        sizedBoxH(10),
        GlobalTextFormField(
          controller: phoneCon,
          //titleText: 'Phone',
          prefixIcon: const Icon(Icons.phone, size: 18),
          hintText: 'Enter Your Phone',
          decoration: borderDecoration,
        ),
        sizedBoxH(10),
        GlobalTextFormField(
          controller: passCon,
          //titleText: 'Password',
          prefixIcon: const Icon(Icons.password, size: 18),
          hintText: 'Enter Your Password',
          decoration: borderDecoration,
          isDense: true,
          isPasswordField: true,
        ),
        sizedBoxH(10),
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
        sizedBoxH(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: false, // Set it as per your logic
                  onChanged: (value) {},
                ),
                const Text("Remember Password"),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const ForgetPasswordScreen());
              },
              child: const Text(
                "Forget Password?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
