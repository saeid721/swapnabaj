import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/about_us_controller/edit_update.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/enum.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_image_loader.dart';
import '../../../global_widget/global_progress_hub.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';

class UpdateAdminAboutScreen extends StatefulWidget {
  const UpdateAdminAboutScreen({super.key});

  @override
  State<UpdateAdminAboutScreen> createState() => _UpdateAdminAboutScreenState();
}

class _UpdateAdminAboutScreenState extends State<UpdateAdminAboutScreen> {
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
                GlobalContainer(
                  backgroundColor: ColorRes.white,
                  elevation: 1,
                  width: Get.width,
                  borderRadius: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalTextFormField(
                          controller: controller.aboutUsDescriptionCon,
                          titleText: 'About Us',
                          hintText: 'Enter Description *',
                          isDense: true,
                          maxLine: 2,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.ourVisionDescriptionCon,
                          titleText: 'Our Vision',
                          hintText: 'Enter Description ',
                          isDense: true,
                          maxLine: 2,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        sizedBoxH(10),
                        GlobalTextFormField(
                          controller: controller.howWeOperateDescriptionCon,
                          titleText: 'How We Operate',
                          hintText: 'Enter Description',
                          isDense: true,
                          decoration: inputDropDecoration,
                          maxLine: 2,
                          filled: true,
                        ),
                        sizedBoxH(10),
                        GlobalTextFormField(
                          controller: controller.ourCommunityDescriptionCon,
                          titleText: 'Our Community',
                          hintText: 'Enter Description',
                          isDense: true,
                          decoration: inputDropDecoration,
                          maxLine: 2,
                          filled: true,
                        ),
                        sizedBoxH(10),
                        GlobalTextFormField(
                          controller: controller.buildingLegacyDescriptionCon,
                          titleText: 'Building a Legacy',
                          hintText: 'Enter Description',
                          isDense: true,
                          decoration: inputDropDecoration,
                          maxLine: 3,
                          filled: true,
                        ),
                        sizedBoxH(10),
                        const Text(
                          'Attachment',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.textColor, fontFamily: 'Rubik'),
                          textAlign: TextAlign.left,
                        ),
                        sizedBoxH(5),
                        GlobalButtonWidget(
                          str: 'Choose File',
                          height: 50,
                          width: Get.width,
                          textSize: 14,
                          textColor: ColorRes.textColor,
                          radius: 5,
                          borderColor: ColorRes.borderColor,
                          buttomColor: Colors.transparent,
                          onTap: pickFile,
                        ),
                        if (fileName != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Selected file: ${fileName!.split('/').last}',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        sizedBoxH(20),
                        GlobalButtonWidget(
                          str: 'Update',
                          height: 45,
                          onTap: () {
                            controller.updateAboutUsData;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<AboutUsController>(
                  builder: (aboutUsController) {
                    final aboutUs = aboutUsController.aboutUsData;
                    return ProgressHub(
                      inAsyncCall: aboutUsController.isLoading,
                      child: GlobalContainer(
                        backgroundColor: ColorRes.white,
                        borderRadius: 8,
                        elevation: 2,
                        width: Get.width,
                        child: ProgressHub(
                          inAsyncCall: aboutUsController.isLoading,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (aboutUs?.fileUrl != null)
                                    GlobalContainer(
                                      elevation: 2,
                                      width: Get.width,
                                      borderRadius: 8,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: GlobalImageLoader(
                                          imagePath: aboutUs?.fileUrl ?? '',
                                          height: 190,
                                          width: Get.width,
                                          fit: BoxFit.cover,
                                          imageFor: ImageFor.network,
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
                                    aboutUs?.aboutUsDescription ?? '',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Our Vision',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    aboutUs?.ourVisionDescription ?? '',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'How We Operate',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    aboutUs?.howWeOperateDescription ?? '',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Our Community',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    aboutUs?.ourCommunityDescription ?? '',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Building a Legacy',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    aboutUs?.buildingLegacyDescription ?? '',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 65),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
