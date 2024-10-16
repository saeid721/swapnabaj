import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/charity_controller/charity_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import 'charity_details.dart';

class CharityScreen extends StatefulWidget {
  const CharityScreen({super.key});

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  final CharityController controller = Get.put(CharityController());
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
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
          'Charity',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GetBuilder<CharityController>(builder: (charityController) {
                if (charityController.charityData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Charity Data Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: charityController.charityData.length,
                    itemBuilder: (context, index) {
                      final charity = charityController.charityData[index];
                      return Stack(children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                                  () => CharityDetailsScreen(
                                imagePath: charity.fileUrl ?? 'assets/images/placeholder.png', // Added null check
                                number: charity.number,
                                title: charity.title,
                                date: charity.date,
                                description: charity.description,
                                index: index,
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.only(top: 10),
                            color: ColorRes.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GlobalContainer(
                                    width: Get.width,
                                    child: Image.network(
                                      charity.fileUrl ?? 'assets/images/placeholder.png', // Use a placeholder if fileUrl is null
                                      width: Get.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    charity.number,
                                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: ColorRes.secondaryColor),
                                  ),
                                  Text(
                                    charity.title,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ColorRes.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
                    },
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
