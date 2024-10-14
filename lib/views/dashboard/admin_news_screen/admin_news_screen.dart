import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/news_controller/news_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'admin_news_details.dart';

class AdminNewsScreen extends StatefulWidget {
  const AdminNewsScreen({super.key});

  @override
  State<AdminNewsScreen> createState() => _AdminNewsScreenState();
}

class _AdminNewsScreenState extends State<AdminNewsScreen> {
  final NewsController controller = Get.put(NewsController());
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
          'News',
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
                        controller: controller.newsDateCon,
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
                                  controller.newsDateCon.text = formattedDate;
                                });
                              }
                            },
                            child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.newsTitleCon,
                        titleText: 'Title',
                        hintText: 'Enter Title',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.newsDescriptionCon,
                        titleText: 'Description',
                        hintText: 'Enter Description',
                        isDense: true,
                        decoration: inputDropDecoration,
                        maxLine: 5,
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
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () {
                          controller.submitNewsData();
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
              GetBuilder<NewsController>(builder: (newsController) {
                if (newsController.newsData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No News Data Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsController.newsData.length,
                      itemBuilder: (context, index) {
                        final newsItems = newsController.newsData[index];
                        return Stack(children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => AdminNewsDetailsScreen(
                                  imagePath: newsItems.fileUrl ?? 'assets/images/placeholder.png', // Added null check
                                  newsTitle: newsItems.title,
                                  date: newsItems.date,
                                  description: newsItems.description,
                                  index: index,
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.only(top: 10),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        newsItems.title,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ColorRes.textColor),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Image.network(
                                          newsItems.fileUrl!,
                                          width: Get.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: ColorRes.primaryColor.withOpacity(0.05),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                newsItems.date,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
