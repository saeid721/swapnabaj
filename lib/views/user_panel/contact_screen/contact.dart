import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/contact_controller/contact_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../bottom_navigation_bar/component/bottom_navigation_widget.dart'; // Import the path correctly

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
