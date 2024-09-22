import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_sizedbox.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';

class AdminAboutScreen extends StatefulWidget {
  const AdminAboutScreen({super.key});

  @override
  _AdminAboutScreenState createState() => _AdminAboutScreenState();
}

class _AdminAboutScreenState extends State<AdminAboutScreen> {

  String? _fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
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
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
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
                        onTap: _pickFile,
                      ),
                      if (_fileName != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Selected file: $_fileName',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        titleText: 'Title',
                        hintText: 'Enter Title',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(
                    'assets/images/logo2.png',
                    width: 250,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'About Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Column(
                    children: [
                      Text.rich(
                        textAlign: TextAlign.justify,
                        TextSpan(
                          children: [TextSpan(
                            text: "What is Lorem Ipsum? ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                            TextSpan(
                                text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          ],
                        ),
                      ),
                      Text.rich(
                        textAlign: TextAlign.justify,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Organizational Structure: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32."""),
                          ],
                        ),
                      ),
                    ],
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
