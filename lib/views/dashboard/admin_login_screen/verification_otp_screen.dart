import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/images.dart';
import 'change_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phone;
  const OtpVerificationScreen({
    super.key,
    required this.phone,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpCon = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PinCodeTextField(
                            controller: otpCon,
                            length: 4,
                            animationType: AnimationType.fade,
                            animationDuration: const Duration(milliseconds: 300),
                            errorAnimationController: errorController,
                            appContext: context,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 60,
                              fieldWidth: 50,
                              activeFillColor: Colors.white,
                              inactiveColor: ColorRes.borderColor,
                              activeBorderWidth: 1,
                              selectedBorderWidth: 1,
                              inactiveBorderWidth: 1,
                              selectedColor: ColorRes.primaryColor,
                            ),
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          GlobalButtonWidget(
                            str: 'Verify OTP',
                            height: 45,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Get.to(() => const ChangePasswordScreen());
                              }
                            },
                          ),
                        ],
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
    otpCon.dispose();
    errorController.close();
    super.dispose();
  }
}
