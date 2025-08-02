import 'package:flutter/material.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/images.dart';
import '../../../global_widget/input_decoration.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController newPasswordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GlobalImageLoader(
          imagePath: Images.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: size(context).height,
          width: size(context).width,
          decoration: BoxDecoration(color: ColorRes.black.withValues(alpha: 0.3)),
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
                    decoration: BoxDecoration(color: ColorRes.white.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalTextFormField(
                            controller: oldPasswordCon,
                            prefixIcon: const Icon(Icons.lock, size: 18),
                            //titleText: 'Old Password',
                            hintText: 'Enter Your Old Password',
                            decoration: borderDecoration,
                          ),
                          sizedBoxH(10),
                          GlobalTextFormField(
                            controller: newPasswordCon,
                            prefixIcon: const Icon(Icons.lock, size: 18),
                            //titleText: 'New Password',
                            hintText: 'Enter Your New Password',
                            decoration: borderDecoration,
                            isDense: true,
                            isPasswordField: true,
                          ),
                          sizedBoxH(10),
                          GlobalTextFormField(
                            controller: confirmPasswordCon,
                            //titleText: 'Confirm Password',
                            hintText: 'Enter Your Confirm Password',
                            decoration: borderDecoration,
                            isDense: true,
                            isPasswordField: true,
                          ),
                          sizedBoxH(10),
                          GlobalButtonWidget(
                            str: 'Change Password',
                            height: 45,
                            onTap: () {
                              //Get.to(() => OtpVerificationScreen(phone: phoneCon.text));
                            },
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
      ]),
    );
  }

  @override
  void dispose() {
    oldPasswordCon.dispose();
    newPasswordCon.dispose();
    confirmPasswordCon.dispose();
    super.dispose();
  }
}
