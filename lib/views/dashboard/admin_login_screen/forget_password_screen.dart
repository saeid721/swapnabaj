import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/images.dart';
import '../../../global_widget/input_decoration.dart';
import 'signup_screen.dart';
import 'verification_otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phoneCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                              controller: phoneCon,
                              prefixIcon: const Icon(Icons.phone, size: 18),
                              hintText: 'Enter Your Phone',
                              decoration: borderDecoration,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            GlobalButtonWidget(
                              str: 'Send OTP',
                              height: 45,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Get.to(() => OtpVerificationScreen(phone: phoneCon.text));
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'New Member? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorRes.textColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => const SignUpScreen()),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.secondaryColor,
                                    ),
                                  ),
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

  @override
  void dispose() {
    phoneCon.dispose();
    super.dispose();
  }
}
