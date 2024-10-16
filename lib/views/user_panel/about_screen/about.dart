import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/about_us_controller/about_us_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final AboutUsController controller = Get.put(AboutUsController());
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    );
    if (result != null && result.files.isNotEmpty) {
      controller.fileName = result.files.first.path; // Get the file path
      setState(() {
        fileName = result.files.first.path;
      });
      Get.snackbar('Success', 'File selected successfully', colorText: ColorRes.green);
    } else {
      Get.snackbar('Error', 'No file selected', colorText: ColorRes.red);
    }
  }

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
          'About Us',
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
                GetBuilder<AboutUsController>(builder: (aboutUsController) {
                  if (aboutUsController.aboutUsData.isEmpty) {
                    return const Center(
                      child: Text(
                        'No About Us Data Found',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: aboutUsController.aboutUsData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final aboutUs = aboutUsController.aboutUsData[index];
                      return GlobalContainer(
                        backgroundColor: ColorRes.backgroundColor,
                        width: Get.width,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (aboutUs.fileUrl != null)
                                GlobalContainer(
                                  elevation: 3,
                                  width: Get.width,
                                  borderRadius: 8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      aboutUs.fileUrl!,
                                      height: 190,
                                      width: Get.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 5),
                              const Text(
                                'About Us',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                aboutUs.aboutUsDescription,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Our Vision',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                aboutUs.ourVisionDescription,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'How We Operate',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                aboutUs.howWeOperateDescription,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Our Community and Collective Strength',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                aboutUs.ourCommunityDescription,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Building a Legacy',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                aboutUs.buildingLegacyDescription,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
