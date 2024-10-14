import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../admin_login_screen/admin_login_screen.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  final String description;
  final int index;

  const DetailsPage({
    super.key,
    required this.imagePath,
    required this.imageTitle,
    required this.description,
    required this.index,
  });

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
          'Details',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() =>  SignInScreen());
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
              children: <Widget>[
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: Hero(
                    tag: 'logo$index',
                    child: Container(
                      height: 270, // Set a fixed height for the image container
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        imageTitle,
                        style: const TextStyle(
                          color: ColorRes.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
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
