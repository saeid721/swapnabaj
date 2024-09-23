import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';

class AdminContactUsScreen extends StatefulWidget {
  const AdminContactUsScreen({super.key});

  @override
  State<AdminContactUsScreen> createState() => _AdminContactUsScreenState();
}

class _AdminContactUsScreenState extends State<AdminContactUsScreen> {

  final TextEditingController selectPhoneCon = TextEditingController();
  final TextEditingController selectEmailCon = TextEditingController();
  final TextEditingController selectWebsiteCon = TextEditingController();
  final TextEditingController selectAddressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: true,
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8, // Adjust the width if needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectPhoneCon,
                        titleText: 'Phone',
                        hintText: 'Enter Phone',
                        isDense: true,
                        keyboardType: TextInputType.number,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectEmailCon,
                        titleText: 'Email',
                        hintText: 'Enter Email',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectWebsiteCon,
                        titleText: 'Website',
                        hintText: 'Enter Website',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectAddressCon,
                        titleText: 'Address',
                        hintText: 'Enter Address',
                        isDense: true,
                        decoration: inputDropDecoration,
                        maxLine: 4,
                        filled: true,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8, // Adjust the width if needed
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                      'Address:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                      Text(
                        'Bogura, Dhaka, Bangladesh',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Phone:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '+88 01703 030 721',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Email:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'info@swapnobaj.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Website:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'www.swapnobaj.com',
                        style: TextStyle(fontSize: 16),
                      ),

                    ],
                            ),
                          ),
                      ),

              const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
    );
  }
}
