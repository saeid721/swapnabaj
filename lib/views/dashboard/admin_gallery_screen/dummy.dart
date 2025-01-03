// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controllers/gallery_controller/gallery_controller.dart';
// import '../../../global_widget/colors.dart';
// import '../../../global_widget/global_button.dart';
// import '../../../global_widget/global_container.dart';
// import '../../../global_widget/global_sizedbox.dart';
// import '../../../global_widget/global_textform_field.dart';
// import '../../../global_widget/input_decoration.dart';
// import '../admin_login_screen/login_screen.dart';
// import 'admin_gallery_details_screen.dart';
//
// List<GalleryModel> images = [
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/02/09/43/80/360_F_209438048_bqYPR1SZJx583icNF2fasiwfnttqMZZn.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/04/97/45/58/360_F_497455841_1TSJ07nyEcSOIzYJ4nevIGtEe0VOPWTF.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/02/09/43/80/360_F_209438048_bqYPR1SZJx583icNF2fasiwfnttqMZZn.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/04/97/45/58/360_F_497455841_1TSJ07nyEcSOIzYJ4nevIGtEe0VOPWTF.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/02/09/43/80/360_F_209438048_bqYPR1SZJx583icNF2fasiwfnttqMZZn.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   GalleryModel(
//     fileUrl: 'https://t3.ftcdn.net/jpg/04/97/45/58/360_F_497455841_1TSJ07nyEcSOIzYJ4nevIGtEe0VOPWTF.jpg',
//     imageTitle: 'Swapnobaj',
//     description:
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
//   ),
//   // Add more `ImageDetails` objects as needed.
// ];
//
// class AdminGalleryScreen extends StatefulWidget {
//   const AdminGalleryScreen({super.key});
//
//   @override
//   State<AdminGalleryScreen> createState() => _AdminGalleryScreenState();
// }
//
// class _AdminGalleryScreenState extends State<AdminGalleryScreen> {
//   final GalleryController controller = Get.put(GalleryController());
//   String? fileName;
//
//   Future<void> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
//     );
//     if (result != null && result.files.isNotEmpty) {
//       controller.fileName = result.files.first.path; // Get the file path
//       setState(() {
//         fileName = result.files.first.path;
//       });
//       Get.snackbar('Success', 'File selected successfully', colorText: ColorRes.green);
//     } else {
//       Get.snackbar('Error', 'No file selected', colorText: ColorRes.red);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         shadowColor: ColorRes.borderColor,
//         backgroundColor: ColorRes.white,
//         iconTheme: const IconThemeData(color: ColorRes.primaryColor),
//         centerTitle: true,
//         title: const Text(
//           'Gallery',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w700,
//             color: ColorRes.primaryColor,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => SignInScreen());
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Center(
//             child: Column(
//               children: [
//                 GlobalContainer(
//                   backgroundColor: ColorRes.white,
//                   elevation: 1,
//                   width: Get.width,
//                   borderRadius: 8, // Adjust the width if needed
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GlobalTextFormField(
//                           controller: controller.galleryImageTitleCon,
//                           titleText: 'Title',
//                           hintText: 'Enter Title',
//                           isDense: true,
//                           decoration: inputDropDecoration,
//                           filled: true,
//                         ),
//                         const SizedBox(height: 10),
//                         GlobalTextFormField(
//                           controller: controller.galleryImageDescriptionCon,
//                           titleText: 'Description',
//                           hintText: 'Enter Description',
//                           isDense: true,
//                           decoration: inputDropDecoration,
//                           maxLine: 5,
//                           filled: true,
//                         ),
//                         const SizedBox(height: 10),
//                         const Text(
//                           'Attachment',
//                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.textColor, fontFamily: 'Rubik'),
//                           textAlign: TextAlign.left,
//                         ),
//                         sizedBoxH(5),
//                         GlobalButtonWidget(
//                           str: 'Choose File',
//                           height: 50,
//                           width: Get.width,
//                           textSize: 14,
//                           textColor: ColorRes.textColor,
//                           radius: 5,
//                           borderColor: ColorRes.borderColor,
//                           buttomColor: Colors.transparent,
//                           onTap: pickFile,
//                         ),
//                         if (fileName != null)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10.0),
//                             child: Text(
//                               'Selected file: $fileName',
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         const SizedBox(height: 20),
//                         GlobalButtonWidget(
//                           str: 'Submit',
//                           height: 45,
//                           onTap: () {
//                             controller.submitGalleryData();
//                             setState(() {
//                               fileName = null; // Clear selected file after submission
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 GetBuilder<GalleryController>(builder: (galleryController) {
//                   if (galleryController.galleryData.isEmpty) {
//                     return const Center(
//                       child: Text(
//                         'No News Data Found',
//                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                     );
//                   }
//                   return GlobalContainer(
//                     backgroundColor: ColorRes.backgroundColor,
//                     child: SizedBox(
//                       height: Get.height,
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: galleryController.galleryData.length,
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
//                         itemBuilder: (context, index) {
//                           final images = galleryController.galleryData[index];
//                           return InkWell(
//                             onTap: () {
//                               Get.to(
//                                     () => AdminGalleryDetailsScreen(
//                                   imagePath: images.fileUrl ?? 'assets/images/placeholder.png',
//                                   imageTitle: images.imageTitle,
//                                   description: images.description,
//                                   index: index,
//                                 ),
//                               );
//                             },
//                             child: Hero(
//                               tag: 'logo$index',
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   image: DecorationImage(
//                                     image: NetworkImage(images.fileUrl ?? 'assets/images/placeholder.png'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GalleryModel {
//   final String fileUrl;
//   final String imageTitle;
//   final String description;
//
//   GalleryModel({
//     required this.fileUrl,
//     required this.imageTitle,
//     required this.description,
//   });
// }
