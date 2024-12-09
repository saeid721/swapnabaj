import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/contact_controller/contact_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../admin_login_screen/login_screen.dart';

class AdminContactUsScreen extends StatefulWidget {
  const AdminContactUsScreen({super.key});

  @override
  State<AdminContactUsScreen> createState() => _AdminContactUsScreenState();
}

class _AdminContactUsScreenState extends State<AdminContactUsScreen> {
  final ContactController controller = Get.put(ContactController());

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          controller: controller.phoneCon,
                          titleText: 'Phone',
                          hintText: 'Enter Phone',
                          isDense: true,
                          keyboardType: TextInputType.number,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.emailCon,
                          titleText: 'Email',
                          hintText: 'Enter Email',
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.websiteCon,
                          titleText: 'Website',
                          hintText: 'Enter Website',
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.addressCon,
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
                          onTap: controller.submitContactData,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<ContactController>(builder: (contactController) {
                  if (contactController.contactData.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Contact Us Data Found',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: contactController.contactData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final contact = contactController.contactData[index];
                      return GlobalContainer(
                        backgroundColor: ColorRes.white,
                        elevation: 1,
                        width: Get.width,
                        borderRadius: 8,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Phone',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact.phone,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Email',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact.email,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Website',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact.website,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Address',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact.address,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
