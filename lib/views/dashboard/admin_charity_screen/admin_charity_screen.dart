import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/charity_controller/charity_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'admin_charity_details.dart';

class AdminCharityScreen extends StatefulWidget {
  const AdminCharityScreen({super.key});

  @override
  State<AdminCharityScreen> createState() => _AdminCharityScreenState();
}

class _AdminCharityScreenState extends State<AdminCharityScreen> {
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
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalTextFormField(
                        controller: controller.selectCharityDateCon,
                        titleText: 'Select Date',
                        hintText: "Select Date".tr,
                        keyboardType: TextInputType.datetime,
                        titleStyle: const TextStyle(color: ColorRes.textColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                        sufixIcon: GestureDetector(
                            onTap: () async {
                              var pickedDate = await showDateOnlyPicker(context);
                              if (pickedDate != null) {
                                String formattedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                                setState(() {
                                  controller.selectCharityDateCon.text = formattedDate;
                                });
                              }
                            },
                            child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.charityTitleCon,
                        titleText: 'Title',
                        hintText: 'Enter Title',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.charityNumberCon,
                        titleText: 'Number',
                        hintText: 'Enter Number',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.charityDescriptionCon,
                        titleText: 'Description',
                        hintText: 'Enter Description',
                        isDense: true,
                        decoration: inputDropDecoration,
                        maxLine: 5,
                        filled: true,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () {
                          controller.submitCharityData();
                          setState(() {
                            fileName = null; // Clear selected file after submission
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                              () => AdminCharityDetailsScreen(
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
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GlobalContainer(
                                    width: Get.width,
                                    child: Image.network(
                                      charity.fileUrl!,
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
