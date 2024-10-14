import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'admin_gallery_details_screen.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'https://t3.ftcdn.net/jpg/02/09/43/80/360_F_209438048_bqYPR1SZJx583icNF2fasiwfnttqMZZn.jpg',
    imageTitle: 'Swapnobaj',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  ),
  ImageDetails(
    imagePath: 'assets/images/saeid.jpg',
    imageTitle: 'Swapnobaj',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  ),
  ImageDetails(
    imagePath: 'assets/images/saeid.jpg',
    imageTitle: 'Swapnobaj',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  ),
  ImageDetails(
    imagePath: 'assets/images/saeid.jpg',
    imageTitle: 'Swapnobaj',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  ),
  // Add more `ImageDetails` objects as needed.
];

class AdminGalleryScreen extends StatefulWidget {
  const AdminGalleryScreen({super.key});

  @override
  State<AdminGalleryScreen> createState() => _AdminGalleryScreenState();
}

class _AdminGalleryScreenState extends State<AdminGalleryScreen> {
  String? fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  final TextEditingController galleryImageTitleCon = TextEditingController();
  final TextEditingController galleryImageDescriptionCon = TextEditingController();

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
          'Gallery',
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
                        GlobalTextFormField(
                          controller: galleryImageTitleCon,
                          titleText: 'Title',
                          hintText: 'Enter Title',
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: galleryImageDescriptionCon,
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
                              'Selected file: $fileName',
                              style: const TextStyle(fontSize: 16),
                            ),
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
                  backgroundColor: ColorRes.backgroundColor,
                  child: SizedBox(
                    height: 400, // Set a fixed height for the GridView
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailsPage(
                                imagePath: _images[index].imagePath,
                                imageTitle: _images[index].imageTitle,
                                description: _images[index].description,
                                index: index,
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'logo$index',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(_images[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String imageTitle;
  final String description;

  ImageDetails({
    required this.imagePath,
    required this.imageTitle,
    required this.description,
  });
}
